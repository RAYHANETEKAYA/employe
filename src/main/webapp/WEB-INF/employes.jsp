<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, employes.employes, employes.EmployeDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Liste des Employés</title>
</head>
<body>
    <h2>Liste des Employés</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Poste</th>
            <th>Salaire</th>
            <th>Photo</th>
        </tr>
        <%
            EmployeDAO employeDAO = new EmployeDAO();
            List<employes> employes = employeDAO.getAllEmployes();
            request.setAttribute("employes", employes);
        %>
        <c:forEach var="emp" items="${employes}">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.nom}</td>
                <td>${emp.prenom}</td>
                <td>${emp.poste}</td>
                <td>${emp.salaire}</td>
                <td><img src="${emp.pathImage}" width="50" height="50"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
