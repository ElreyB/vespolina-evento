// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
// = require_tree .
// = require jquery3
// = require jquery_ujs
// = require bootstrap-sprockets

$(document).ready(function () {

  $(document).on('change', 'input#uploadBtn', function (e) {
    e.preventDefault();
    $("#uploadFile").val(this.value);
  });

  $('#myCarousel').carousel({
    interval: 3000
  });

  function showMenuForm(menu) {
    const menuStyleValue = menu.options[menu.selectIndex].innerText;
    if (menuStyleValue === "HORS D’OEUVRES") {
      document.getElementById('bits_form').hidden = false;
      document.getElementById('family_form').hidden = true;
    } else if (menuStyleValue === "The Traditional Italian Dinner" || menuStyleValue === "The Traditional Italian Dinner with Individually Plated Entrees") {
      document.getElementById('family_form').hidden = false;
      document.getElementById('bits_form').hidden = true;
    } else {
      document.getElementById('family_form').hidden = true;
      document.getElementById('bits_form').hidden = true;
    }
  }


  const menuStyle = document.getElementById('menu_style_id');
  showMenuForm(menuStyle);
  menuStyle.addEventListener('change', showMenuForm(menuStyle));


});
