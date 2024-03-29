// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require mousetrap
//= require jquery.nested-fields
//= require sweet-alert
//= require sweet-alert-confirm
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require fullcalendar
//= require bootstrap-switch
//= require_tree .
//= require highcharts

$(document).ready(function () {	
  $('.datatable').DataTable();
  var toggleMenu = function() {
	  $('header').toggleClass('toggle');
	  $('.main').toggleClass('push');
	  $('.overlay').toggleClass('block');
	  $('#social, .logo').toggleClass('reveal');
  };

	//Nav
	$('.navBtn').click(function() {
    toggleMenu();
	});

  Mousetrap.bind('esc', function() {
    toggleMenu();
  });

  $('#spouses_form, #offsprings_form, #addresses_form, #comission_form').nestedFields();

	$('.add').click(datepicker_update);
	$('.remove').click(datepicker_update);

	function datepicker_update(){
	    $('.datetimepicker').datetimepicker();
	}

});

//= require turbolinks
