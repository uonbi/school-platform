<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {
	private $data;

	function __construct(){
		parent::__construct();
		$this->load->model("user_model");
	}

	private function _load_view(){
		$this->load->view("inc/temp",$this->data);
	}

	public function index(){
		$this->data['main'] = "home/index";
		$this->_load_view();
	}

	public function login($mode="form"){
		if($mode=="form"){
			$this->data['main'] = "home/login";
			$this->_load_view();
		}

		if($mode=="submit"){
			$email = $this->input->post("email");
			$password = $this->input->post("password");
			if($this->user_model->validate_user($email,$password)){

			}
		}
	}

	public function logout(){
		$this->session->sess_destory();
		redirect("home/login");
	}
}
