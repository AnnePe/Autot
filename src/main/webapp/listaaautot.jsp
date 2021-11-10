<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<table id="listaus"> 
	<thead>				
		<tr>
			<th>Rekisterinumero</th>
			<th>Merkki</th>
			<th>Malli</th>
			<th>Vuosi</th>							
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){                         //kaikki jquery hommat t‰n alle
	$.ajax({url:"autot", type:"GET", dataType:"json", success:function(result){   //Funktio palauttaa tiedot json-objektina		
		$.each(result.autot, function(i, field){    //haetaan backendist‰ autot ajaxilla @webservlet"autot" Autot servletiss‰
        	var htmlStr;						   //m‰‰ritell‰‰n metodi mill‰ haeteen GET
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.rekno+"</td>";  //lis‰t‰‰ luupissa table bodyyn tavaraa
        	htmlStr+="<td>"+field.merkki+"</td>";
        	htmlStr+="<td>"+field.malli+"</td>";
        	htmlStr+="<td>"+field.vuosi+"</td>";  
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);//elementin id=listaus lis‰t‰‰n tbody
        });	
		
		//console.log(result);jos haluat n‰ytt‰‰ consolissa toimiiko ajax kutsu
    }});
});	

</script>
</body>
</html>