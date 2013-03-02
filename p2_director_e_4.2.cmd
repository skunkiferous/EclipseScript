@echo off
rem ----------------------------------------------------------------
rem edit following Path variables.
rem ----------------------------------------------------------------
IF "%JAVA_HOME%"==""	set JAVA_HOME=c:\Progra~2\Java\jdk1.7.0_03
IF "%DEST_DIR%"==""	set DEST_DIR=C:\eclipse4.2\
IF "%ECLIPSE_HOME%"=="" set ECLIPSE_HOME=C:\eclipse

rem ----------------------------------------------------------------
rem do not edit anything beyond this line.
rem ----------------------------------------------------------------
IF "%P2_DIRECTOR_CMD%"=="" set P2_DIRECTOR_CMD=java -jar .\director\plugins\org.eclipse.equinox.launcher_1.2.0.v20110502.jar
IF "%ECLIPSE_EXE%"=="" set ECLIPSE_EXE=%ECLIPSE_HOME%\eclipsec.exe
set OLDDIR=%CD%
CD %ECLIPSE_HOME%
IF EXIST eclipsec.exe GOTO nextstep
echo %ECLIPSE_EXE% not found
goto:eof
:nextstep
CD %OLDDIR%
IF "%OPTS1%"=="" set OPTS1=-nosplash
IF "%OPTS2%"=="" set OPTS2=-application org.eclipse.equinox.p2.director
IF "%OPTS3%"=="" set OPTS3=-destination %DEST_DIR%
IF "%OPTS4%"=="" set OPTS4=-bundlepool %DEST_DIR%
IF "%OPTS5%"=="" set OPTS5=-p2.os win32 -p2.ws win32 -p2.arch x86_64

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% -clean ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.sdk.ide -tag InitialState ^
%OPTS3% %OPTS4% -profile SDKProfile -profileProperties "org.eclipse.update.install.features=true" ^
-roaming %OPTS5%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.platform.feature.group ^
-tag platformfeature %OPTS3% %OPTS4%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://findbugs.cs.umd.edu/eclipse/ ^
-installIU edu.umd.cs.findbugs.plugin.eclipse.feature.group ^
-tag findbugs %OPTS3% %OPTS4%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository ^
http://download.eclipse.org/recommenders/updates/stable/e42/ ^
-installIU ^
org.eclipse.recommenders.feature.completion.rcp.intellig.feature.group,^
org.eclipse.recommenders.feature.rcp.core.feature.group,^
org.eclipse.recommenders.feature.completion.rcp.chain.feature.group,^
org.eclipse.recommenders.feature.extdoc.rcp.feature.group,^
org.eclipse.recommenders.feature.completion.rcp.subwords.feature.group,^
org.eclipse.recommenders.feature.3rd.orbit.feature.group,^
org.eclipse.recommenders.feature.3rd.rcp.nonorbit.feature.group ^
-tag recommenders %OPTS3% %OPTS4%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://eclipse-cs.sf.net/update/ ^
-installIU net.sf.eclipsecs.feature.group ^
-tag checkstyle %OPTS3% %OPTS4%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://pmd.sourceforge.net/eclipse ^
-installIU net.sourceforge.pmd.eclipse.feature.group ^
-tag pmd %OPTS3% %OPTS4%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://update.eclemma.org/ ^
-installIU com.mountainminds.eclemma.feature.feature.group ^
-tag eclemma %OPTS3% %OPTS4% 

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.forge.objectweb.org/eclipse-update/ ^
-installIU org.objectweb.asm.feature.feature.group,de.loskutov.BytecodeOutline.feature.feature.group ^
-tag asm %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% 

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://andrei.gmxhome.de/eclipse/ ^
-installIU AnyEditTools.feature.group,FileSync.feature.group,JDepend4Eclipse.feature.group ^
-tag andrei %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% 

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.emf.sdk.feature.group ^
-tag emf %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% 

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.papyrus.sdk.feature.feature.group ^
-tag papyrus %OPTS3% %OPTS1% 

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository ^
http://download.eclipse.org/releases/juno ^
-installIU ^
org.eclipse.mylyn.ide_feature.feature.group,^
org.eclipse.mylyn.mft.emf.feature.group,^
org.eclipse.mylyn.mft.gmf.feature.group,^
org.eclipse.mylyn.java_feature.feature.group,^
org.eclipse.mylyn.pde_feature.feature.group,^
org.eclipse.mylyn.team_feature.feature.group,^
org.eclipse.mylyn.docs.intent.feature.feature.group,^
org.eclipse.mylyn.docs.intent.exporter.feature.feature.group,^
org.eclipse.mylyn.gerrit.feature.feature.group,^
org.eclipse.mylyn_feature.feature.group,^
org.eclipse.mylyn.context_feature.feature.group,^
org.eclipse.mylyn.git.feature.group,^
org.eclipse.mylyn.wikitext_feature.feature.group,^
org.eclipse.mylyn.docs.intent.markup.feature.feature.group,^
org.eclipse.dltk.mylyn.feature.group ^
-tag mylyn %OPTS3% %OPTS1% 

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/egit/updates ^
-installIU ^
org.eclipse.egit.feature.group,org.eclipse.egit.psf.feature.group,org.eclipse.egit.import.feature.group ^
-tag egit %OPTS3% %OPTS4% 

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.m2e.feature.feature.group,^
org.eclipse.m2e.logback.feature.feature.group ^
-tag m2e %OPTS3% %OPTS4% 

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.xtext.sdk.feature.group ^
-tag xtend %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% 

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://jautodoc.sourceforge.net/update/ ^
-installIU net.sf.jautodoc.feature.feature.group ^
-tag jautodoc %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository ^
http://updates.yakindu.com/indigo/milestones,^
http://download.eclipse.org/releases/juno ^
-installIU org.yakindu.base.feature.group,de.itemis.xtext.utils.jface.feature.group,^
de.itemis.xtext.utils.gmf.feature.group,org.yakindu.sct.generator.java.feature.group,^
org.yakindu.sct.feature.group,org.yakindu.sct.sdk.feature.group ^
-tag yakindu %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% 

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://jadclipse.sf.net/update ^
-installIU net.sf.jdtdecompiler.feature.feature.group ^
-tag JD %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository ^
http://dl.google.com/eclipse/inst/codepro/latest/3.7,^
http://download.eclipse.org/releases/juno ^
-installIU com.instantiations.assist.eclipse.coverage.feature.group,^
com.instantiations.eclipse.analysis.utilities.feature.group,^
com.instantiations.eclipse.coverage.codepro.feature.group,^
com.instantiations.assist.eclipse.ant.feature.group,^
com.instantiations.assist.eclipse.audit.feature.group,^
com.instantiations.eclipse.core.feature.feature.group,^
com.instantiations.eclipse.analysis.appanalysis.feature.feature.group,^
com.instantiations.eclipse.unittester.feature.feature.group,^
com.instantiations.eclipse.shared.feature.group ^
-tag codepro %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4%

