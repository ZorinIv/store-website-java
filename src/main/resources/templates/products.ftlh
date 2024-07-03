<!DOCTYPE html>
<html lang="en">
<head>
<title>SPORTSHOP</title>
</head>
<body>
<h1>SPORTSHOP</h1>
<hr>
<#if user.isAdmin()>
    <a href="/admin">Панель администратора</a>
    <#else >
        <a href="/basket">Корзина</a>
</#if>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Выйти">
            </form>
<hr>
<form action="/" method="get">
    Поиск по названию: <input type="text" name="title">
    <input type="submit" value="Поиск">
</form>
<hr>
<h2>Товары в наличии</h2>
<#list products as product>
        <p><b>${product.title} ${product.company}</b> ${product.price} руб. <a href="./product/${product.id}">Подробнее о товаре</a></p>
    <#else>
    <h3>Товаров нет</h3>
</#list>
</body>
</html>