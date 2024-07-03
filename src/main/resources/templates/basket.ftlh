<!DOCTYPE html>
<html lang="en">
<head>
    <title>SPORTSHOP</title>
</head>
<body>
<h1>SPORTSHOP</h1>
<hr>
<h2>Корзина</h2>
<table border="1">
    <tr>
        <th>Название</th>
        <th>Размер</th>
        <th>Изготовитель</th>
        <th>Цена</th>
        <th>Удалить</th>
    </tr>
    <#list basket as basket>
        <tr>
            <th>${basket.title}</th>
            <th>${basket.size}</th>
            <th>${basket.company}</th>
            <th>${basket.price}</th>
            <th>
                <form action="/basket/${basket.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Удалить">
                </form>
            </th>
        </tr>
    <#else>
        <h3>Покупок нет</h3>
    </#list>
</table>
<hr>
<a href="/">Вернуться к покупкам</a>
</body>
</html>