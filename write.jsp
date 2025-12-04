<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 일기 작성</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/write.css">
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
</script>

</head>
<body>

<!-- SIDEBAR -->
<%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

<!-- TOPBAR -->
<div class="topbar">
    <button class="menu-btn" type="button" onclick="openSidebar()">☰</button>
    <div class="topbar-title">New Entry</div>
</div>

<!-- CONTENT -->
<div class="page">
    <div class="container">
        <h2>📝 새 일기 작성</h2>

        <form action="<%=request.getContextPath()%>/diary" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="insert">

            <div class="label">날짜</div>
            <input class="input" type="text" name="diaryDate" placeholder="예: 2025-11-27" required>

            <div class="label">제목</div>
            <input class="input" type="text" name="title" placeholder="오늘의 제목" required>

            <div class="label">내용</div>
            <textarea name="content" placeholder="오늘 있었던 일들을 편하게 적어보세요 :)" required></textarea>

            <div class="label">사진 (선택)</div>
            <input class="input" type="file" name="image" accept="image/*">

            <!-- BUTTONS -->
            <button class="btn-save" type="submit">저장하기</button>

            <a href="<%=request.getContextPath()%>/diary?action=list">
                <button class="btn-back" type="button">취소</button>
            </a>
        </form>

        <a href="<%=request.getContextPath()%>/dashboard.jsp" class="back-link">◀ 돌아가기</a>
    </div>
</div>

</body>
</html>
