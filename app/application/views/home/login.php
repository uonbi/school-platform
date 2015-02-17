<div class="row">

<div class="col-md-6">
<h1><i class="fa fa-lock"></i> Login</h1>

<?php 

echo form_open("home/login/submit","class='form'");
echo form_input("email","");
echo form_label("Email");
echo form_password("password","");
echo form_label("Password");
echo form_submit("Login","login","class='btn btn-lg btn-success'");

echo form_close();
?>

</div>

</div>
