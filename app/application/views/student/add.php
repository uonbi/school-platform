<?php
$years = array();

for($i=date("Y"); $i>=2000;$i--){
	$years[$i] = $i;
}
?>

<h1><i class="fa fa-add"></i> Add Student</h1>

<div class="row">

<div class="col-md-6">

<?php

echo validation_errors('<div class="alert alert-danger" role="alert">','</div>');

echo form_open("student/add/submit","class='form'");

echo form_input("adm_number",set_value("adm_number"));
echo form_label("Admission Number","adm_number");

echo form_input("surname",set_value("surname"));
echo form_label("Surname","surname");

echo form_input("other_names",set_value("other_names"));
echo form_label("Other Names","other_names");

echo form_dropdown("year_of_adm",$years,date("Y"));
echo form_label("Year of Admission","year_of_adm");

echo form_input("email",set_value("email"));
echo form_label("Primary Email","email");

echo form_input("email_uni",set_value("email_uni"));
echo form_label("University Email","email_uni");

echo form_input("phone",set_value("phone"));
echo form_label("Phone","phone");

echo form_dropdown("category",array("Undergraduate"=>"Undergraduate",
									"Postgraduate"=>"Postgraduate"));

echo form_label("Student Category","category");

echo form_hidden("scid",$this->session->userdata("scid"));

echo form_submit("Add Student","add","class='btn btn-lg btn-success'");

echo form_close();

?>

</div>

</div>