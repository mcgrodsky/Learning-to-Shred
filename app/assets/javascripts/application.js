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
//= require turbolinks
//= require_tree .

console.log("haaaay")
$( document ).ready(function() {
  var strings = ["E", "A", "D", "G", "B", "e"];
  var frets = 14;


  for(var f = 0; f < frets; f++) {
    // create a new row that will represent this fret level
    var $fret = $("<div class='fret' data-fret='"+f+"'/>");

    for (i = 0; i < strings.length; i++) {
      var $div = $("<div/>");
      var $input = $("<input type='checkbox'>");
      $input.attr("data-string", strings[i]);
      // use f as the fret number
      $input.attr("data-fret", f);
      // set id to strings[i]+fret num
      var id = strings[i] + f;
      $input.attr("id", id);
      $div.append($input);
      // use id again to set 'for' equal to id
      var $label = $("<label for='"+id+"'></label>");
      $div.append($input);
      $div.append($label);
      $fret.append($div); // add to the fret, not the fretboard

    }
  console.log("here");
    // done creating the row, now append that to the fretboard
    $('.fretboard').append($fret);
  }

  //function for barre chords
  //for every input-type = data-string E, change input to X
  $('.Estring').on("click", function(){
    console.log ($("[data-string='E'] [label]"));

  })
});
