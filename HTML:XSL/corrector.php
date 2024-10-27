<html>
<head>
</head>
<body>
	<div class="main">
		<div class="site_title">
			Les Caractères
		</div>
		<div class="main_text">
			<?php
			ini_set('display_errors', 1);
			$saxonProc = new Saxon\SaxonProcessor(true);
			$trans = $saxonProc->newXslt30Processor();
			$executable = $trans->compileFromFile("corrector.xsl");
			$executable->setParameter("base_copy","P_ed01_ex1");
			$executable->setInitialMatchSelectionAsFile("caracteres.xml");
			echo $executable->transformToString(); ?>
		</div>
		<div class="cpanel">
			<?php //$transformer->importStylesheet(simplexml_load_file("webpanel.xsl"));
			//echo $proc->transformToXML(simplexml_load_file("../caracteres.xml")); ?>
		</div>
	</div>
</body>
</html>