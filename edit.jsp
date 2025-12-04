<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tirmizee.mvc.model.Diary"%>
<%
    Diary d = (Diary) request.getAttribute("diary");
    if (d == null) {
        response.sendRedirect(request.getContextPath() + "/diary?action=list");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일기 수정 — <%= d.getTitle() %></title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/edit.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/dark.css">


</head>
<body>

<div class="container">

    <div class="page-title">✏️ 일기 수정</div>

    <!-- ⭐ Только ЭТО изменено! ⭐ -->
    <form action="<%=request.getContextPath()%>/diary" 
          method="post" 
          enctype="multipart/form-data">

        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= d.getId() %>">

        <!-- Date -->
        <div class="label">날짜</div>
        <input class="input" type="text" name="diaryDate" value="<%= d.getDiaryDate() %>">

        <!-- Title -->
        <div class="label">제목</div>
        <input class="input" type="text" name="title" value="<%= d.getTitle() %>">

        <!-- Content -->
        <div class="label">내용</div>
        <textarea class="textarea" name="content"><%= d.getContent() %></textarea>

        <!-- Photo -->
        <div class="label">현재 사진</div>

        <% if (d.getPhoto() != null) { %>
            <div class="photo-preview">
                <img src="<%=request.getContextPath()%>/photo?id=<%= d.getId() %>">
            </div>
        <% } else { %>
            <div style="color:#777; font-size:14px;">사진이 없습니다.</div>
        <% } %>

        <div class="label">사진 변경하기 (선택)</div>

        <!-- ⭐ имя поля должно быть "image", НЕ photo !!! ⭐ -->
        <input class="input" type="file" name="image" accept="image/*">

        <!-- Buttons -->
        <div class="buttons">
            <button class="btn btn-save" type="submit">저장하기</button>

            <a class="btn btn-back" 
               href="<%=request.getContextPath()%>/diary?action=view&id=<%=d.getId()%>">
               ⬅ 돌아가기
            </a>
        </div>

    </form>

</div>
</body>
</html>
