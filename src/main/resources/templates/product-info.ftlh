<!DOCTYPE html>
<html lang="en">
<head>
    <title>SPORTSHOP</title>
</head>
<body>
<h1>SPORTSHOP</h1><hr>
<h2>Информация о товаре</h2>
<#list images as img>
<img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Размер: </b>${product.size}<br>
<b>Производитель: </b>${product.company}<br>
<b>Цена: </b>${product.price} руб.<br>

<form action="/product/add/${product.id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="В корзину"/>
</form>
<hr>
<a href="/basket">Корзина</a><br>
<a href="/">Вернуться к покупкам</a>
</body>
</html>