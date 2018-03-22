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

  function showForm(formOption) {
    $('#bits_form, #family_form').addClass('hide');
    if (formOption === "HORS D’OEUVRES") {
      $('#bits_form').removeClass('hide');
    } else if ((formOption === "The Traditional Italian Dinner") || (formOption === "The Traditional Italian Dinner with Individually Plated Entrees")) {
      $('#family_form').removeClass('hide');
    }
  }

  const selectedOption = $('#menu_style_id option:selected').text();
  showForm(selectedOption);

  $(document).on('change', function () {
    const selectedOption = $('#menu_style_id option:selected').text();
    showForm(selectedOption);

    $('#menu_style_id').change(function (e) {
      e.preventDefault();
      const changedOption = $('#menu_style_id option:selected').text();
      showForm(changedOption);
    })

  })


});
