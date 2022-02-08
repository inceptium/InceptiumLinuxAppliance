/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */





var data;

$(document).ready(function () {
    data = new dataForm();
    const returningLINK = baseURL();
    console.log(baseURL());
    data.linkforlogin = getUrlParameter("linkforlogin");
    // btn.href = atob(data.linkforlogin);
    document.getElementById("signin").href = baseURL();
});


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



function baseURL() {
    const URL = window.location.origin + "/portaledef";
    return URL;
}