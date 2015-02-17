<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {
	private $data;

	function __construct(){
		parent::__construct();
		$this->is_logged_in();
	}

	private function _load_view(){
		$this->load->view("inc/temp",$this->data);
	}

	public function index()
	{
		$this->data['main'] = "user/index";
		$this->_load_view();
	}

	function is_logged_in(){
		if(!$this->session->userdata("is_logged_in")){
			redirect("home/login");
		}
	}
}
