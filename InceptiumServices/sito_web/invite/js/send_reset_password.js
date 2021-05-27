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
    data.token = getUrlParameter("authtoken");
    data.inchost = getUrlParameter("inchost");
    document.getElementById("inceptium_id").value = data.inceptiumid;

})



function submit() {
    data.newusermail = document.getElementById("email").value;
    data.inceptiumid = document.getElementById("inceptium_id").value;
    var password1 = document.getElementById("psw").value;
    var password2 = document.getElementById("psw-repeat").value;
    if (password1 === password2) {
        data.password = document.getElementById("psw-repeat").value;
        //alert(btoa(data.email));

        var urllink = "/inapi/resetpassword?inceptiumid=" +
                data.inceptiumid + "::newusermail=" +
                data.newusermail + "::newuserpassword.b64=" + btoa(data.password) + "::authtoken=" + data.token;

        console.log(urllink);




        $.ajax({
            url: urllink,
            type: 'POST',
            dataType: 'text',
            success: function (resul) {

                if (resul === "USER NOT EXISTS") {
                    alert("Utente non registrato")
                } else if (resul.startsWith("UPDATE_OK")) {
                    alert("Password cambiata con successo!!!")
                    window.location.href = "/portaledef/login";

                } else
                {
                    alert(result)
                }
                console.log(resul);
            },
            error: function (error) {
                console.log(error.responseText);
            }
        });


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

