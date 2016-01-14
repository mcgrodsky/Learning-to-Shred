// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

  var strings = ["e", "b", "G", "D", "A", "E"];
  var dots = [3, 5, 7, 9, 15, 17];
  var doubleDots = 12;
  var nextDot = dots.shift();
  var frets = 21;

  for (var f = 0; f < frets; f++) {
    // create a new row that will represent this fret level
    var $fret = $("<div class='fret' data-fret='" + f + "'/>");
    for (i = 0; i < strings.length; i++) {
      // set id to strings[i]+fret num
      var id = strings[i] + f;
      var $div = $("<div class='note'/>");
      $div.attr('data-string', strings[i]);
      var $input = $("<input type='checkbox' title='" + id + "'>");
      $input.attr("data-string", strings[i]);
      // use f as the fret number
      $input.attr("data-fret", f);
      $input.attr("id", id);
      $div.append($input);

      // use id again to match label with input
      var $label = $("<label for='" + id + "'></label>");
      $div.append($input);
      $div.append($label);
      $fret.append($div); // add to the FRET, not the fretboard
    }
    if (f === doubleDots) {
      $fret.addClass('two-dots');
    } else if (f === nextDot) {
      nextDot = dots.shift();
      $fret.addClass('dot');
    }
    // done creating the row, now append that to the fretboard
    $('.fretboard').append($fret);
  }

  $(".sel-button").on('click', function(e) {
    e.preventDefault();
    // when a button is clicked, show which notes are pressed for that chord
    var chord = $(this).attr('data-chord').split(",");
    if (chord) {
      $(".fretboard input").prop('checked', false);
      for (var i = 0; i < chord.length; i++) {
        $(".fretboard input#" + chord[i]).prop('checked', true);
      }
    }
    showSelected();
  });

  $(".fretboard").on('change', 'input', function(e) {
    // when an input is changed clear  notes selected, update  list of pressed notes, show updated list
    e.preventDefault();
    clearOthersInRow(this);
    showSelected();
  });

  function showSelected() {
    // output a list of strings being pressed
    var sel = getSelected();
    $("#selected").val(sel.length ? "'" + sel.join("', '") + "'" : '');
  }

  function getSelected() {
    // get the array of notes being pressed. array of ids of selected notes
    var sel = [];
    $('.fretboard input:checked').each(function() {
      sel.push($(this).attr('id'));
    });
    return sel;
  }

  //clear fretboard and input values on click
  $('.clear-fretboard').on("click", function() {
    $('.fretboard input:checked').removeAttr('checked');
    $('#selected').val('');
  })

  function clearOthersInRow(selected) {
    // ensure that `selected` is the only note being pressed on this string
    var s = $(selected).attr('data-string');
    $('.fretboard div[data-string="' + s + '"] input')
      .not(selected).prop('checked', false);
  }
  // initialize selected notes
  showSelected();

  $(".show-edit").on("click", function(){
    $(".edit-chord").toggleClass("display", "inline");
    $(".destroy-chord").css("display", "inline");
  })

});
