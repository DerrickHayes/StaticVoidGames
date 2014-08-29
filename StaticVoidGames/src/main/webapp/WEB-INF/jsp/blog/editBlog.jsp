<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Edit Blog - Static Void Games</title>
	
	<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans'>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/general.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/everyPage.css"/>">
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/pageDown.css"/>">
	
	<script type="text/javascript" src="<c:url value="/js/Markdown.Converter.js" />"></script>
	<script type="text/javascript" src="<c:url value="/js/Markdown.Sanitizer.js" />"></script>
	<script type="text/javascript" src="<c:url value="/js/Markdown.Editor.js" />"></script>
	
	<link rel="shortcut icon" href="<c:url value="/images/favicon.png"/>" />
</head>

<body style="background-image:url(<c:url value="${backgroundImage}"/>);">

<%@ include file="../include/navigation.jsp" %>

<div id="contentPane">

	<h1>Edit ${blog.getTitle()}</h1>
	
	<div class="pagedownDiv" style="width:100%;">
		<form action="<c:url value="/blog/${blog.getUrlName()}/edit/" />" method='POST'>
			<input type='hidden' name='editedBlog' value='${blog.getUrlName()}' /> 
			Title: <input style="width:100%;" type='text' name='title' value='${blog.getTitle()}' /> 
		
			<div class="wmd-panel">
				<div id="wmd-button-bar"></div>
				<textarea class="wmd-input" id="wmd-input" name="text"  style="height:500px;">${blog.getText()}</textarea>
			</div>
			<p>Preview:</p>
			<div id="wmd-preview" class="wmd-panel wmd-preview"></div>
			
			<script type="text/javascript">
				(function() {
					var converter = Markdown.getSanitizingConverter();
					var editor = new Markdown.Editor(converter);
					editor.run();
				})();
			</script>
		
			<input name="submit" type="submit" value="Submit" />
		</form>
	</div>
</div>
</body>
</html>