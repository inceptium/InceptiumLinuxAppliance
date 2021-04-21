/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {
    window.setTimeout(function () {

        var data = new dataForm();
        data.email = getUrlParameter("email");
        data.inceptiumid = getUrlParameter("inceptiumid");
        data.userwhoinvite = getUrlParameter("userwhoinvite");

        document.getElementById("email").value = data.email;
    })
})

function quandoclicco() {
    var email = document.getElementById("email").value;
    var nominativo = document.getElementById("nominativo").value;
    var password1 = document.getElementById("psw").value;
    var password2 = document.getElementById("psw-repeat").value;
    alert(btoa(email));
}

function loadpage() {
    var pippo = 'mail ciao';
    document.getElementById("email").value = pippo;
    return pippo;
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};
