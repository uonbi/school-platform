<?php
class Student_model extends CI_Model{
	function __construct(){
		parent::__construct();
	}

	function add_student(){
		$student = array(
			"adm_number"=>$this->input->post("adm_number"),
			"surname"=>$this->input->post("surname"),
			"other_names"=>$this->input->post("other_names"),
			"year_of_adm"=>$this->input->post("year_of_adm"),
			"email"=>$this->input->post("email"),
			"email_uni"=>$this->input->post("email_uni"),
			"phone"=>$this->input->post("phone"),
			"uid"=>$this->session->userdata("uid"),
			"scid"=>$this->input->post("scid"),
			"category"=>$this->input->post("category")
			);
		return $this->db->insert("student",$student);
	}
}