/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var data;

$(document).ready(function () {
    data = new dataForm();
    data.newusermail = getUrlParameter("newusermail");
    data.inceptiumid = getUrlParameter("inceptiumid");
    data.userwhosentinvitation = getUrlParameter("userwhosentinvitation");
    data.id_registerpoint = getUrlParameter("id_registerpoint");
    data.inchost = getUrlParameter("inchost");
    document.getElementById("email").value = data.newusermail;

})



function submit() {
    data.newusermail = document.getElementById("email").value;
    data.newuserdescription_b64 = document.getElementById("nominativo").value;
    var password1 = document.getElementById("psw").value;
    var password2 = document.getElementById("psw-repeat").value;
    if (password1 === password2) {
        data.password = document.getElementById("psw-repeat").value;
        //alert(btoa(data.email));

        var urllink = atob(data.inchost) + "/registernewuser?id_registerpoint=" +
                data.id_registerpoint + "::userwhosentinvitation=" +
                data.userwhosentinvitation + "::newusermail=" +
                data.newusermail + "::inceptiumid=" + data.inceptiumid +
                "::newuserpassword.b64=" + btoa(data.password) +
                "::newuserdescription.b64=" + btoa(data.newuserdescription_b64);

        //console.log(window.location.toString());
        
        $.ajax({
         url: urllink,
            type: 'GET',
            success: function (resul) {
                console.log(resul.responseText);
            },
            error: function (error) {
                console.log(error);
            }
        })
        
       
        //window.location.href = url;
    } else {
        //alert(btoa(data.email));
        alert("Attentione !!!\nLe password non coincidono!!!")
    }

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
}
