<?php

class ExportAjax extends Okay {
    
    private $columns_names = array(
        'category_name'     =>    '���������',
        'product_name'      =>    '�������� ������',
        'sum_price'         =>    '�����',
        'amount'            =>    '����������'
        
    );
    
    private $column_delimiter = ';';
    private $stat_count = 10;
    private $export_files_dir = 'backend/files/export/';
    private $filename = 'export_stat_products.csv';
    
    public function fetch() {
        if(!$this->managers->access('stats')) {
            return false;
        }

        // ������ ������ ������ 1251
        setlocale(LC_ALL, 'ru_RU.1251');
        $this->db->query('SET NAMES cp1251');
        
        // ��������, ������� ������������
        $page = $this->request->get('page');
        if (empty($page) || $page==1) {
            $page = 1;
            // ���� ������ ������� - ������ ������ ���� ��������
            if (is_writable($this->export_files_dir.$this->filename)) {
                unlink($this->export_files_dir.$this->filename);
            }
        }
        
        // ��������� ���� �������� �� ����������
        $f = fopen($this->export_files_dir.$this->filename, 'ab');
        
        // ���� ������ ������� - ������� � ������ ������ �������� �������
        if ($page == 1) {
            fputcsv($f, $this->columns_names, $this->column_delimiter);
        }
        
        $filter = array();
        $date_filter = $this->request->get('date_filter');
        if (!empty($date_filter)) {
            $filter['date_filter'] = $date_filter;
        }
        
        $date_from = $this->request->get('date_from');
        $date_to = $this->request->get('date_to');
        
        if (!empty($date_from)) {
            $filter['date_from'] = date("Y-m-d 00:00:01",strtotime($date_from));
        }
        if (!empty($date_to)) {
            $filter['date_to'] = date("Y-m-d 23:59:00",strtotime($date_to));
        }
        
        $status = $this->request->get('status', 'integer');
        if (!empty($status)) {
            switch ($status) {
                case '1': {
                    $stat_o = 0;
                    break;
                }
                case '2': {
                    $stat_o = 1;
                    break;
                }
                case '3': {
                    $stat_o = 2;
                    break;
                }
                case '4': {
                    $stat_o = 3;
                    break;
                }
            }
            $filter['status'] = $stat_o;
        }
        
        $sort_prod = $this->request->get('sort_prod');
        if (!empty($sort_prod)) {
            $filter['sort_prod'] = $sort_prod;
        } else {
            $filter['sort_prod'] = 'price';
        }
        
        $filter['page'] = max(1, $this->request->get('page', 'integer'));
        $filter['limit'] = 40;
        
        $temp_filter = $filter;
        unset($temp_filter['limit']);
        unset($temp_filter['page']);
        
        $total_count = $this->reportstat->get_report_purchases_count($temp_filter);
        
        if($this->request->get('page') == 'all') {
            $filter['limit'] = $total_count;
        }
        
        $total_summ = 0;
        $total_amount = 0;
        $report_stat_purchases = $this->reportstat->get_report_purchases($filter);
        foreach ($report_stat_purchases as $id=>$r) {
            if (!empty($r->product_id)) {
                $tmp_cat = $this->categories->get_categories(array('product_id' => $r->product_id));
                $tmp_cat = reset($tmp_cat);
                if (!empty($cat_filter) && $tmp_cat->id != $cat_filter) {
                    unset($report_stat_purchases[$id]);
                } else {
                    $report_stat_purchases[$id]->category_name = $tmp_cat->name;
                }
            }
        }
        
        foreach ($report_stat_purchases as $u) {
            $total_summ += $u->sum_price;
            $total_amount += $u->amount;
            $str = array();
            foreach($this->columns_names as $n=>$c) {
                $str[] = $u->$n;
            }
            fputcsv($f, $str, $this->column_delimiter);
        }
        
        $total = array('category_name'=>'�����','product_name'=>' ','price'=>$total_summ,'amount'=>$total_amount);
        fputcsv($f, $total, $this->column_delimiter);
        
        fclose($f);
        if ($this->stat_count*$page < $total_count) {
            return array('end'=>false, 'page'=>$page, 'totalpages'=>$total_count/$this->stat_count);
        } else {
            return array('end'=>true, 'page'=>$page, 'totalpages'=>$total_count/$this->stat_count);
        }
    }
    
}

$export_ajax = new ExportAjax();
$data = $export_ajax->fetch();
if ($data) {
    header("Content-type: application/json; charset=utf-8");
    header("Cache-Control: must-revalidate");
    header("Pragma: no-cache");
    header("Expires: -1");
    $json = json_encode($data);
    print $json;
}
