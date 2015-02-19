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
				$user_details = $this->user_model->get_user($email);
				// var_dump($user_details); die();
				$this->session->set_userdata($user_details);
				$this->session->set_userdata("is_logged_in",TRUE);

				redirect("user");
			}else{
				$this->session->set_flashdata("msg","Wrong Email/Password");
				redirect("home/login");
			}
		}
	}

	public function logout(){
		$this->session->sess_destory();
		// session_destroy();
		redirect("home/login");
	}
}
