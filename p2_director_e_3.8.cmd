@echo off
rem ----------------------------------------------------------------
rem edit following Path variables.
rem ----------------------------------------------------------------
IF "%JAVA_HOME%"==""	set JAVA_HOME=C:\Progra~1\Java\jdk1.7.0_10
IF "%DEST_DIR%"==""	set DEST_DIR=C:\work\eclipse_3_8_6
IF "%ECLIPSE_HOME%"=="" set ECLIPSE_HOME=%DEST_DIR%

rem ----------------------------------------------------------------
rem do not edit anything beyond this line.
rem ----------------------------------------------------------------
IF "%P2_DIRECTOR_CMD%"=="" set P2_DIRECTOR_CMD=java -jar .\director\plugins\org.eclipse.equinox.launcher_1.2.0.v20110502.jar
rem 
rem set OLDDIR=%CD%
rem CD %ECLIPSE_HOME%
rem IF EXIST eclipsec.exe GOTO nextstep
rem echo %ECLIPSE_EXE% not found
rem goto:eof
rem :nextstep
rem CD %OLDDIR%

IF "%OPTS1%"=="" set OPTS1=-nosplash
IF "%OPTS2%"=="" set OPTS2=-application org.eclipse.equinox.p2.director
IF "%OPTS3%"=="" set OPTS3=-destination %DEST_DIR%
IF "%OPTS4%"=="" set OPTS4=-bundlepool %DEST_DIR%
IF "%OPTS5%"=="" set OPTS5=-p2.os win32 -p2.ws win32 -p2.arch x86_64
rem IF "%OPTS5%"=="" set OPTS5=-p2.os win32 -p2.ws win32 -p2.arch x86
IF NOT EXIST .\director jar xf director_latest.zip

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% -clean ^
-repository http://download.eclipse.org/eclipse/updates/3.8-M-builds/ ^
-installIU org.eclipse.sdk.ide -tag InitialState ^
%OPTS3% %OPTS4% -profile SDKProfile -profileProperties "org.eclipse.update.install.features=true" ^
-roaming %OPTS5%

%P2_DIRECTOR_CMD% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/eclipse/updates/3.8-M-builds/ ^
-installIU org.eclipse.platform.feature.group ^
-tag platformfeature %OPTS3% %OPTS4% ^
-roaming %OPTS5%

IF "%ECLIPSE_EXE%"=="" set ECLIPSE_EXE=%ECLIPSE_HOME%\eclipsec.exe

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://findbugs.cs.umd.edu/eclipse/ ^
-installIU edu.umd.cs.findbugs.plugin.eclipse.feature.group ^
-tag findbugs %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository ^
http://download.eclipse.org/recommenders/updates/stable/e37/,http://quick-junit.sourceforge.jp/updates/current/ ^
-installIU ^
org.eclipse.recommenders.feature.completion.rcp.intellig.e37.feature.group,^
org.eclipse.recommenders.feature.rcp.core.feature.group,^
org.eclipse.recommenders.feature.completion.rcp.chain.e37.feature.group,^
org.eclipse.recommenders.feature.extdoc.rcp.feature.group,^
org.eclipse.recommenders.feature.completion.rcp.subwords.feature.group,^
org.eclipse.recommenders.feature.3rd.orbit.feature.group,^
org.eclipse.recommenders.feature.3rd.rcp.nonorbit.feature.group ^
-tag recommenders %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://eclipse-cs.sf.net/update/ ^
-installIU net.sf.eclipsecs.feature.group ^
-tag checkstyle %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://pmd.sourceforge.net/eclipse ^
-installIU net.sourceforge.pmd.eclipse.feature.group ^
-tag pmd %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://update.eclemma.org/ ^
-installIU com.mountainminds.eclemma.feature.feature.group ^
-tag eclemma %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.forge.objectweb.org/eclipse-update/ ^
-installIU org.objectweb.asm.feature.feature.group,de.loskutov.BytecodeOutline.feature.feature.group ^
-tag asm %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://andrei.gmxhome.de/eclipse/ ^
-installIU AnyEditTools.feature.group,FileSync.feature.group,JDepend4Eclipse.feature.group ^
-tag andrei %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU ^
org.eclipse.emf.sdk.feature.group,org.eclipse.emf.facet.sdk.feature.feature.group,^
org.eclipse.modisco.sdk.feature.feature.group,org.eclipse.xpand.sdk.feature.group,org.eclipse.emf.importer,^
org.eclipse.jem.util,org.eclipse.wst.common.emf,org.eclipse.actf.visualization.feature.group ^
-tag emf %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/modeling/mdt/papyrus/updates/releases/juno ^
-installIU org.eclipse.papyrus.sdk.feature.feature.group ^
-tag papyrus %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/egit/updates ^
-installIU ^
org.eclipse.egit.feature.group,org.eclipse.egit.source.feature.group,org.eclipse.egit.mylyn.feature.group,org.eclipse.egit.import.feature.group ^
-tag egit %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/technology/m2e/releases,http://download.eclipse.org/releases/staging/,http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-tycho/0.6.0/N/0.6.0.201207302152/ ^
-installIU org.eclipse.m2e.sdk.feature.feature.group,^
org.eclipse.m2e.feature.feature.group,^
org.eclipse.m2e.logback.feature.feature.group,org.eclipse.m2e.site,org.eclipse.m2e.site.product,org.eclipse.m2e.site,^
org.eclipse.wst.xsd.core,org.eclipse.wst.xml.ui,org.sonatype.tycho.m2e.feature.feature.group,org.sonatype.tycho.m2e.feature.feature.group ^
-tag m2e %OPTS3% %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository ^
http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/,http://download.eclipse.org/releases/indigo ^
-installIU ^
org.eclipse.xtend.feature.group,^
org.eclipse.xtend.sdk.feature.group,^
org.eclipse.xtend.m2e.feature.group,^
org.eclipse.xtend.sdk.source.feature.group,^
org.eclipse.xtend.ui.feature.group,^
org.eclipse.xtext.sdk.feature.group,^
org.eclipse.xtext.ui.feature.group,^
org.eclipse.xtext.xtext.ui.feature.group,^
org.eclipse.xtext.runtime.feature.group,^
org.eclipse.xtext.examples.feature.group,^
org.eclipse.xtext.docs.feature.group,^
org.eclipse.xtend.middleend.xtend.feature.group,^
org.eclipse.xtend.typesystem.emf.feature.group,^
org.eclipse.xtend.dependencies.feature.group,^
org.eclipse.xtend.backend.feature.group ^
-tag xtend %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%


%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://jautodoc.sourceforge.net/update/ ^
-installIU net.sf.jautodoc.feature.feature.group ^
-tag jautodoc %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%


%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository ^
http://updates.yakindu.com/indigo/milestones,http://jautodoc.sourceforge.net/update/,^
http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/,^
http://download.eclipse.org/releases/indigo ^
-installIU org.eclipse.xtext.xtend2.lib,^
org.yakindu.base.feature.group,de.itemis.xtext.utils.jface.feature.group,^
de.itemis.xtext.utils.gmf.feature.group,org.yakindu.sct.generator.java.feature.group,^
org.yakindu.sct.feature.group,org.yakindu.sct.sdk.feature.group ^
-tag yakindu %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://jadclipse.sf.net/update ^
-installIU net.sf.jdtdecompiler.feature.feature.group ^
-tag JD %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/mylyn/releases/latest,^
http://download.eclipse.org/releases/indigo ^
-installIU org.eclipse.mylyn.builds.feature.group,^
org.eclipse.mylyn.builds.sdk.feature.group,^
org.eclipse.mylyn.commons.feature.group,^
org.eclipse.mylyn.commons.compatibility.feature.group,^
org.eclipse.mylyn.discovery.feature.group,^
org.eclipse.mylyn.monitor.feature.group,^
org.eclipse.mylyn.commons.identity.feature.group,^
org.eclipse.mylyn.commons.notifications.feature.group,^
org.eclipse.mylyn.commons.repositories.feature.group,^
org.eclipse.mylyn.commons.repositories.http.feature.group,^
org.eclipse.mylyn.commons.sdk.feature.group,^
org.eclipse.mylyn.ide_feature.feature.group,^
org.eclipse.mylyn.java_feature.feature.group,^
org.eclipse.mylyn.pde_feature.feature.group,^
org.eclipse.mylyn.team_feature.feature.group,^
org.eclipse.mylyn.context.sdk.feature.group,^
org.eclipse.mylyn.docs.epub.feature.group,^
org.eclipse.mylyn.docs.sdk.feature.group,^
org.eclipse.mylyn.docs.epub.sdk.feature.group,^
org.eclipse.mylyn.htmltext.feature.group,^
org.eclipse.mylyn.reviews.feature.feature.group,^
org.eclipse.mylyn.reviews.sdk.feature.feature.group,^
org.eclipse.mylyn_feature.feature.group,^
org.eclipse.mylyn.context_feature.feature.group,^
org.eclipse.mylyn.bugzilla_feature.feature.group,^
org.eclipse.mylyn.tasks.ide.feature.group,^
org.eclipse.mylyn.trac_feature.feature.group,^
org.eclipse.mylyn.sdk_feature.feature.group,^
org.eclipse.mylyn.test_feature.feature.group,^
org.eclipse.mylyn.versions.feature.group,^
org.eclipse.mylyn.git.feature.group,^
org.eclipse.mylyn.versions.sdk.feature.group,^
org.eclipse.mylyn.wikitext_feature.feature.group,^
org.eclipse.mylyn.wikitext.sdk.feature.group ^
-tag mylyn %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://dl.google.com/eclipse/inst/codepro/latest/3.7 ^
-installIU com.instantiations.assist.eclipse.coverage.feature.group,^
com.instantiations.eclipse.analysis.utilities.feature.group,^
com.instantiations.eclipse.coverage.codepro.feature.group,^
com.instantiations.assist.eclipse.ant.feature.group,^
com.instantiations.assist.eclipse.audit.feature.group,^
com.instantiations.eclipse.core.feature.feature.group,^
com.instantiations.eclipse.analysis.appanalysis.feature.feature.group,^
com.instantiations.eclipse.unittester.feature.feature.group,^
com.instantiations.eclipse.shared.feature.group ^
-tag codepro %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://log4e.jayefem.de/update ^
-installIU de.jayefem.log4e.feature.group ^
-tag log4e %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://ehep.sourceforge.net/update ^
-installIU net.sourceforge.ehep.feature.group ^
-tag EHEP %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://www.stateofflow.com/UpdateSite ^
-installIU com.stateofflow.EclipseWikiFeature.feature.group ^
-tag eclipsewiki %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://eclipse.musgit.com ^
-installIU com.musgit.eclipse.grepconsole.feature.group,^
com.musgit.eclipse.grepconsole.source.feature.group ^
-tag GrepConsole %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno,^
http://community.polarion.com/projects/subversive/download/eclipse/3.0/juno-site/ ^
-installIU org.eclipse.team.svn.feature.group,^
org.eclipse.team.svn.mylyn.feature.group,org.polarion.eclipse.team.svn.connector.feature.group,^
org.polarion.eclipse.team.svn.connector.svnkit17.feature.group ^
-tag subversive %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://download.eclipse.org/releases/juno ^
-installIU org.eclipse.mylyn.github.feature.feature.group ^
-tag github %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://www.wickedshell.net/updatesite ^
-installIU net.sf.wickedshell.feature.feature.group ^
-tag wickedShell %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://bndtools-updates.s3.amazonaws.com/ ^
-installIU bndtools.main.feature.feature.group,bndtools.ace.feature.feature.group,^
bndtools.jarviewer.feature.feature.group ^
-tag bndtools %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://eclipse.processing.org/plugin/ ^
-installIU processing.plugin.feature.group ^
-tag processing1 %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

%ECLIPSE_EXE% %OPTS1% %OPTS2% ^
-repository http://proclipsing.googlecode.com/svn/tags/current_releases/proclipsingSite/ ^
-installIU proclipsingFeature.feature.group,^
P5ExporterFeature.feature.group ^
-tag proclipsing %OPTS3% -profileProperties org.eclipse.update.install.features=true %OPTS4% ^
-roaming %OPTS5%

