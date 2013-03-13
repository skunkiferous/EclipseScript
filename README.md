EclipseScript
=============
Scripts used to help/automate creating a customized Eclipse environment, including setting up a strict coding standard checking configuration. Purpose of this project is mentioned in https://github.com/skunkiferous/EclipseScript/wiki

This repo currently contains:	
	p2_director_e_3.8.cmd - Command based Script to create a eclipse 3.8 Setup with all the required plugins, ground up. 
	director_latest.zip - command based P2 director tool needed to run the eclipse script (see details below)
	checkstyle.xml - preferences used by check style plugin. (see 'EclipsePreferences.pdf' form more details)
	custom_code_formatter.xml - Custom code formatter, based on Standard Java conventions with small modifications (see 'EclipsePreferences.pdf' form more details)
	dictionary.txt - Dictionary file so that the spell check is ignore for some commonly used project terms.
	EclipsePreferences.pdf - notes about preferences currently applied in the eclipse environment.
	MyPrefs.epf - eclipse preferences exported to this file.
	ws_template.zip - Template workspace files for rapid setup of new eclipse workspace.

Windows Instructions
---------------------
Eclipse setup:
--------------
1. Edit 'p2_director_e_3.8.cmd' edit enter the values for following environment variables:	
	JAVA_HOME
	DEST_DIR - directory where you want to have eclipse 3.8 setup this should be a path to empty directory if you want to have a fresh 
	eclipse setup. If you want to rerun it after added/removing any plugins on existing eclipse 3.8, we can do that as well.
	ECLIPSE_HOME - existing eclipse home

3. Run 'p2_director_e_3.8.cmd' from command prompt (if there are any errors it will generate log file under existing eclipse home and the path 
   will be mentioned in the error message printed on the console.)

4. After successful Completion of the above script we should see an eclipse environment setup in 'DEST_DIR'


Eclipse Workspace Setup:
------------------------

These files should be imported when a new workspace is created :
Note: imports should be made in the same order as mentioned below: 

1. Importing the custom code formatter inside eclipse - Go to, Eclipse WS preferences -> Java -> Code Style -> Formatter -> Import and import file preferences/custom_code_formatter.xml  

1. Checkstyle - Eclipse WS preferences -> Checkstyle -> Select New (if importing for the first time) or Properties (if custom preferences already exist in the workspace and we need to update them) -> Import. Select file preferences/checkstyle.xml.

1. CodePro Audit - Eclipse WS preferences -> CodePro Audit -> RuleSets -> Import. Select file preferences/CodePro.pref

1. CodePro Metrics - Eclipse WS preferences -> CodePro Audit -> RuleSets -> Import. Select file preferences/CodePro_metrics.pref

1. PMD - PMD is configured with Project specific preferences, this means every time we create a new project we have to enable PMD specifically for the project as follows (No need to perform these steps for already existing projects):  
 * Copy the file named as ".ruleset" from preferences into the project folder. 
 * Select the newly created project, Right click in Eclipse Project Explorer -> Properties -> PMD -> check the following two check boxes -> Enable PMD and  

1. Eclipse Core preferences � Go to File -> Import -> Preferences and select preferences/EclipsePrefs.epf. These preferences contain :
 * Findbugs Preferences
 * Java code style preferences
 * Java auto save Actions.
 * Others.

1. Dictionary (*Not* Included in ws_template) - General -> Editors -> Text Editors -> Spellings -> User defined Dictionary. Select file $PB_ROOT/eclipse_script/dictionary.txt

-------------------------------

Notes Regarding How to suppress a warning using java comments :

1. To suppress a CodePro - Add a inline comment as follows
 // $codepro.audit.disable <Comma separated Rule Names> (the same can be done by Selecting a Violation in CodePro audit window, right click -> Fix Violation -> Disable Rule <Rule name> for the file/line)

1. To suppress Checkstyle violation 
 * Enter following line comments *before* the line of code containing the violation
   // CHECKSTYLE IGNORE FOR NEXT 1 LINES
   (here 1 can be replace by the number of lines for which Checkstyle should be suppressed.)
 * Custom comment pattern is added to suppress magic number checks 
   The code block should start with following comment to suppress magic number check :
   //CHECKSTYLE stop magic number check
   The code block should end with following comment to resume magic number check :
   //CHECKSTYLE resume magic number check
 * To switch off and switch off a specific rule by its rule-name following syntax can be used :
   
     CHECKSTYLE.OFF: RuleName
   
     CHECKSTYLE.ON: RuleName 
 * More such comment pattern can be added by editing file - preferences/checkstyle.xml.

1. Findbugs rules can be suppressed through java annotation as follows :
   @edu.umd.cs.findbugs.annotations.SuppressWarnings(value = "DM_DEFAULT_ENCODING") 
   (here DM_DEFAULT_ENCODING is the name of the rule that needs to be suppressed.

1. Suppressing PMD Violations - 
  * we can tell PMD to ignore a specific line by using the "NOPMD" comment as follows : 
   `private int bar; //NOPMD`
  * @SuppressWarnings("PMD") can also be used please check [here](http://pmd.sourceforge.net/suppressing.html) for more details 

----------------------------


Using template.
1. There is a workspace template present inside 'ws_template.zip', We can use this template so that all the required preferences are applied at 
   the time of workspace creation.
2. 'EclipsePreferences.pdf' describes the preferences that are present in 'ws_template.zip'
3. To use the template copy .metadata folder present inside the 'ws_template.zip' to the workspace folder.
5. Launch eclipse and/or switch workspace to the newly created workspace folder. 
6. Dictionary file present in this director should be manually Applied.
7. Now all the projects can be imported (File -> Import -> Existing Projects into workspace -> (Select Root Directory as newly created workspace folder) -> Finish.

Converting a Jar as OSGi bundle Using BNDTools Eclispe plugin.
-------------------------------------------------------------
* Make sure BNDTools plugin is installed.
* In an existing eclipse workspace, open Eclipse preferences Select 'BNDTools OSGi' and click check now and follow the steps to create the 'cnf' project.
* Go to File -> New -> Wrap JAR as OSGi Bundle Project -> Add External -> Next -> Add the required project in Selected Packages ->
  Give a Project Name - > Finish.
* This step will create a project of BND nature.
* Now edit Bnd.bnd and assign a version number to the Bundle and Save.
* This step should generate a jar file under 'generated' folder of the newly created project. Name of this jar will be same as the name of the project.
* Open the jar in Eclipse jar viewer and check META-INF/MANIFEST.MF



TODO/KNOWN ISSUES
-----------------
* p2_director_e_4.2.cmd is a script for eclipse Juno latest release this is not updated with ALL the plugins.
* yakindu plugin doesn't get installed on 'eclipse 4.2' but works fine on 'eclipse 3.8'.
* Create our own update site and P2 Repo with all the required plugins.
* Convert the .cmd scripts to .sh 
