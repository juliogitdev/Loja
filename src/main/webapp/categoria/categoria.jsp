<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Criar categoria</h2>

    <form action="categorias" method="post">
        <input type="text" name="name" id="name">
        <input type="text" name="description" id="description">
        <input type="submit" value="Criar">
    </form>
	<br>
	
	<h2>Categorias: </h3>
	<h3> ${categoria}</h3>
</body>
</html>