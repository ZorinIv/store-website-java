<!DOCTYPE html>
<html lang="en">
<head>
    <title>SPORTSHOP</title>
</head>
<body>
<h1>SPORTSHOP</h1>
<hr>
<h2>Панель администратора</h2>
<a href="/">На главную страницу</a>
<hr>
<h3>Список товаров</h3>
<table border="1">
    <tr>
        <th>Название</th>
        <th>Размер</th>
        <th>Изготовитель</th>
        <th>Цена</th>
        <th>Удалить</th>
    </tr>
    <#list products as product>
        <tr>
            <th>${product.title}</th>
            <th>${product.size}</th>
            <th>${product.company}</th>
            <th>${product.price}</th>
            <th>
                <form action="/admin/${product.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Удалить">
                </form>
            </th>
        </tr>
    <#else>
        <h4>Товаров нет</h4>
    </#list>
</table>
<hr>
<h3>Добавить товар</h3>
<form action="/admin/add" method="post" enctype="multipart/form-data">
    Название товара: <input type="text" name="title"/><br><br>
    Описание товара: <input type="text" name="description"/><br><br>
    Размер : <input type="number" name="size"/><br><br>
    Цена: <input type="number" name="price"/><br><br>
    Производитель: <input type="text" name="company"/><br><br>
    Первая фотография: <input type="file" name="file1"/><br><br>
    Вторая фотография: <input type="file" name="file2"/><br><br>
    Третья фотография: <input type="file" name="file3"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить"/>
</form>
</body>
</html>