/*!
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
function include(c,m,e){if(document.getElementById(c)==null){var a=typeof e=="string"?[e]:e;for(var f=0;f<a.length;f++){var b=a[f].replace(/^\s|\s$/g,"");var h=b.split(".");var d=h[h.length-1].toLowerCase();var k=d=="css";var l=k?"link":"script";var g=k?" type='text/css' rel='stylesheet' ":" type='text/javascript' ";var j=(k?"href":"src")+"='"+m+b+"'";document.write("<"+l+(f==0?" id="+c:"")+g+j+"></"+l+">")}}}function windowOpen(d,c,e,a){var g=parseInt((window.screen.height-a)/2,10),f=parseInt((window.screen.width-e)/2,10),b="location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes,width="+e+",height="+a+",top="+g+",left="+f;window.open(d,c,b)}function loading(a){top.$.jBox.tip.mess=null;top.$.jBox.tip(a,"loading",{opacity:0})}function confirmx(b,a){top.$.jBox.confirm(b,"系统提示",function(c,d,e){if(c=="ok"){loading("正在提交min，请稍等...");location=a}},{buttonsFocus:1});top.$(".jbox-body .jbox-icon").css("top","55px");return false}$.validator.setDefaults({submitHandler:function(a){loading("正在提交min，请稍等...");a.submit()},errorPlacement:function(a,b){$("#messageBox").text("输入有误，请先更正！").removeClass("alert-success").addClass("alert-error");if(b.is(":checkbox")||b.is(":radio")||b.parent().is(".input-append")){a.appendTo(b.parent().parent())}else{a.insertAfter(b)}}});function tableSort(f){var c={orderBy:"#orderBy",contentTable:"#contentTable",sortClass:"sort",callBack:$.noop};var a=$.extend({},c,f);var b=$(a.orderBy),e=$(a.contentTable+" th."+a.sortClass),d=b.val().split(" ");e.each(function(){if($(this).hasClass(d[0])){d[1]=d[1]&&d[1].toUpperCase()=="DESC"?"down":"up";$(this).html($(this).html()+' <i class="icon icon-arrow-'+d[1]+'"></i>')}});e.click(function(){var g=$(this).attr("class").split(" "),j=b.val().split(" ");for(var h=0;h<g.length;h++){if(g[h]==a.sortClass){g=g[h+1];break}}if(g==j[0]){j=(j[1]&&j[1].toUpperCase()=="DESC"?"ASC":"DESC");
b.val(g+" DESC"!=g+" "+j?"":g+" "+j)}else{b.val(g+" ASC")}a.callBack()})}$(document).ready(function(){$("select").select2();$(".fancybox").fancybox()});