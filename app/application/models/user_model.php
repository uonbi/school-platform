<?php
class User_model extends CI_Model{
	function get_user($arg){
		if($arg > 0){
			#it's uid
			$this->db->where("uid",$arg);
		}else{
			#it's email
			$this->db->where("email",$email);
		}

		$result = $this->db->get("user");
		if($result->num_rows > 0){
			$result = $result->result_array();
			return $result[0];
		}
		return FALSE;
	}

	function validate_user($email,$password){
		$this->db->where(
			array(
				"email" => $email,
				"password" => md5($password)
				)
			);

		$result = $this->db->get("user");
		if($result->num_rows > 0){
			return TRUE;
		}
		return FALSE;
	}
}