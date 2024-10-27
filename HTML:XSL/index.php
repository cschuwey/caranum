<html>
<head>
	<style type="text/css">
		body {
			background: black;
		}

		.main {
			width: 960px;
			margin-left: auto;
			margin-right: auto;
		}

		.site_title {
			width: 100%;
			color: white;
		}

		.main_text {
			width: 100%;
		}

		.cpanel {

		}

		.title {

		}

		.change {

		}





		.var_none {
			display: none;
		}

		div
	</style>

	

</head>
<body>
	<div class="main">
		<div class="site_title">
			Les Caractères (aperçu)
		</div>
		<div class="main_text">
			<?php $transformer->importStylesheet(simplexml_load_file("webtext.xsl"));
			echo $proc->transformToXML(simplexml_load_file("../caracteres.xml")); ?>
		</div>
		<div class="cpanel">
			<?php //$transformer->importStylesheet(simplexml_load_file("webpanel.xsl"));
			//echo $proc->transformToXML(simplexml_load_file("../caracteres.xml")); ?>
		</div>
	</div>
</body>
</html>