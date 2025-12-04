<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tirmizee.mvc.model.Diary" %>
<%
    List<Diary> diaryList = (List<Diary>) request.getAttribute("diaryList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Diary</title>

<!-- Подключаем CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/list.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/dark.css">


<script>
    function openSidebar() {
        document.getElementById("sidebar").classList.add("open");
        document.getElementById("sidebarBackdrop").classList.add("show");
    }
    function closeSidebar() {
        document.getElementById("sidebar").classList.remove("open");
        document.getElementById("sidebarBackdrop").classList.remove("show");
    }

    function openDiary(id) {
        window.location.href = "<%=request.getContextPath()%>/diary?action=view&id=" + id;
    }
</script>

</head>
<body>
<!-- ===== SIDEBAR ===== -->
<%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

<!-- ===== TOPBAR ===== -->
<div class="topbar">
    <button class="menu-btn" type="button" onclick="openSidebar()">☰</button>
    <div class="topbar-title">My Diary</div>
</div>
<!-- ===== PAGE CONTENT ===== -->
<div class="page">
    <div class="container">

        <div class="header">
            <div class="title">📘 My Diary</div>
            <a class="add-btn" href="<%=request.getContextPath()%>/diary?action=write">+ Create New Entry</a>
        </div>

        <!-- GRID -->
        <div class="grid">
            <%
                if (diaryList != null) {
                    for (Diary d : diaryList) {
            %>

            <div class="card" ondblclick="openDiary(<%=d.getId()%>)">

                <%-- Если у записи есть фото (BLOB) --%>
                <% if (d.hasPhoto()) { %>
                    <div class="card-img">
                        <img src="<%=request.getContextPath()%>/photo?id=<%= d.getId() %>" alt="">
                    </div>
                <% } else { %>
                    <div class="card-img placeholder"></div>
                <% } %>

                <div class="card-body">
                    <div class="card-title"><%= d.getTitle() %></div>
                    <div class="card-date"><%= d.getDiaryDate() %></div>
                </div>

            </div>

            <%
                    }
                }
            %>
        </div>
        <!-- PAGINATION -->
        <%
            Integer currentPage = (Integer) request.getAttribute("page");
            Integer totalPages = (Integer) request.getAttribute("totalPages");

            if (currentPage == null) currentPage = 1;
            if (totalPages == null) totalPages = 1;
        %>

        <div style="margin: 30px 0; text-align: center; font-size: 15px;">

            <% if (currentPage > 1) { %>
                <a href="<%=request.getContextPath()%>/diary?action=list&page=<%=currentPage - 1%>"
                   style="margin-right: 15px; text-decoration:none;">
                    ⟨ Previous
                </a>
            <% } %>

            <% for (int p = 1; p <= totalPages; p++) {
                    if (p == currentPage) {
            %>
                <span style="font-weight: bold; margin: 0 5px; color:#333;">[<%=p%>]</span>
            <% } else { %>
                <a href="<%=request.getContextPath()%>/diary?action=list&page=<%=p%>"
                   style="margin: 0 5px; text-decoration:none;">
                    <%=p%>
                </a>
            <% }} %>

            <% if (currentPage < totalPages) { %>
                <a href="<%=request.getContextPath()%>/diary?action=list&page=<%=currentPage + 1%>"
                   style="margin-left: 15px; text-decoration:none;">
                    Next ⟩
                </a>
            <% } %>

      </div>
     <!--  <div class="back-wrap">
            <a class="back-btn" href="<%=request.getContextPath()%>/dashboard.jsp">⬅ Back</a>
        </div>  -->

    </div>
</div>
</body>
</html>
