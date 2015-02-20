<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Student extends CI_Controller {
	private $data;

	function __construct(){
		parent::__construct();
		$this->load->model("student_model");
		$this->is_logged_in();
	}

	private function _load_view(){
		$this->load->view("inc/temp",$this->data);
	}

	public function index()
	{
		$this->data['main'] = "student/index";
		$this->_load_view();
	}

	public function add($mode="form"){
		if($mode=="form"){
			$this->data['main'] = "student/add";
			$this->_load_view();
		}

		if($mode=="submit"){
			$this->load->library("form_validation");
			$rules = array(
				array(
					"field"=>"adm_number",
					"label"=>"Admission Number",
					"rules"=>"required"
					),
				array(
					"field"=>"surname",
					"label"=>"Surname",
					"rules"=>"required"
					),
				array(
					"field"=>"other_names",
					"label"=>"Other Names",
					"rules"=>"required"
					),
				array(
					"field"=>"year_of_adm",
					"label"=>"Year of Admission",
					"rules"=>"required"
					),
				array(
					"field"=>"email",
					"label"=>"Email",
					"rules"=>"required|valid_email|is_unique[student.email]"
					),
				array(
					"field"=>"email_uni",
					"label"=>"University Email",
					"rules"=>"valid_email"
					),
				array(
					"field"=>"phone",
					"label"=>"Phone Number",
					"rules"=>"required"
					),
				);
			$this->form_validation->set_rules($rules);

			if($this->form_validation->run()){
				$this->student_model->add_student();
				$this->session->set_flashdata("msg","Student Added");
				redirect("student/add");
			}else{
				$this->add("form");
			}
		}
	}

	function is_logged_in(){
		if(!$this->session->userdata("is_logged_in")){
			redirect("home/login");
		}
	}
}
