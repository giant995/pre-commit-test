$(function() {
    $('button#getHoroscope').bind('click', function() {
      $.getJSON($SCRIPT_ROOT + '/horoscope', {
          nom: $('input[name="nom"]').val(),
          prenom: $('input[name="prenom"]').val(),
          dateNaissance: $('input[name="dateNaissance"]').val()
      }, function(data) {
          $("#horoscope_result").html(data['data']);
          $("#horoscopeForm").hide();
      });
      return false;
    });
});
