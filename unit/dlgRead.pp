{
|-dlgRead.pp :
|  -unit information :
|    -freepascal unit to read and extract information from
|     _ Autodock 4.2 .dlg files .
|    -intended to be used by the mmLogInfo program .
|    -purpose and features :
|      -extract information from a single or a group of .dlg files to build a
|       _ script for analysis/visualization programs such as VMD .
|      -the relevant information is stored in an array molInfo within vmd ;
|    -procedure description :
|      -a driver procedure will search recursivelly all .dlg files .
|      -a record of directories containing .dlg files is done to group them .
|      -it will be required a list of dirs, each with a list of .dlg's, and
|       _ each will require at least one list of conformers .
|      - ;
|    -.dlg file info... :
|      -relevant information (example lines) :
|        -program version :
|          -"          AutoDock 4.2 Release 4.2.6" ;
|        -job info :
|          -"This file was created at:     7:09 31" p.m., 05/23/2022" .
|          -"                   on host:   "nodo5"" .
|          -"Current Working Directory
|           _ = "/home/czgomez/autodock4/ache/carba4/dock/2bagA-GSG1200"" ;
|        -dpf file name :
|          -"Docking parameter file (DPF) used for this docking:
|           _   0071119103-HCC_2bag.dpf" ;
|        -grid point spacing :
|          -"Grid Point Spacing =        0.375 Angstroms" ;
|        -number of grid point :
|          -"Even Number of User-specified Grid Points = 90 x-points" .
|          -"            90 y-points" .
|          -"            90 z-points" ;
|        -grid center coordinates :
|          -"Coordinates of Central Grid Point of Maps
|           _ = (3.970, 65.100, 62.660)" ;
|        -macromolecule name :
|          -"Macromolecule file used to create Grid Maps = 2bag.pdbqt" ;
|        -grid parameter file :
|          -"Grid Parameter file used to create Grid Maps =  2bag.gpf" ;
|        -minimum grid coordinates :
|          -"Minimum coordinates in grid = (-12.905, 48.225, 45.785)" ;
|        -maximum grid coordinates :
|          -"Maximum coordinates in grid = (20.845, 81.975, 79.535)" ;
|        -ligand pdbqt file name :
|          -"Ligand PDBQT file = "0071119103-HCC.pdbqt"" ;
|        -ligand pdbqt file... .
|        -number of runs :
|          -"DPF> ga_run 100" .
|          -"Number of requested GA dockings = 100 runs" ;
|        -genetic algorithm docking start :
|          -"  BEGINNING GENETIC ALGORITHM DOCKING 1 of 100" ;
|        -analysis sections :
|          -"DPF> analysis" .
|          -"    CLUSTER ANALYSIS OF CONFORMATIONS" .
|          -"  CLUSTERING HISTOGRAM" .
|          -"  RMSD TABLE" .
|          -"  INFORMATION ENTROPY ANALYSIS FOR THIS CLUSTERING" .
|          -"  STATISTICAL MECHANICAL ANALYSIS" .
|          -"  LOWEST ENERGY DOCKED CONFORMATION from EACH CLUSTER" ;
|        -docked conformation information from each cluster :
|          -"MODEL        6" .
|          -"USER    Run = 6" .
|          -"USER    Cluster Rank = 1" .
|          -"USER    Number of conformations in this cluster = 24" .
|          -"USER    RMSD from reference structure       = 94.009 A" .
|          -"USER    Estimated Free Energy of Binding    =   -7.88 kcal/mol" .
|          -"USER    Estimated Inhibition Constant, Ki
|           _   =    1.66 uM (micromolar)" .
|          -"USER    NEWDPF tran0  2.404770 65.639632 68.722938" .
|          -"USER                              x       y       z
|           _    vdW   Elec        q     RMS"
|          -"ATOM      1  C   LIG A   1       1.696  68.482  67.926
|           _ -0.36 -0.10    +0.085    94.009" .
|          -"TER" .
|          -"ENDMDL" ;
|        -final remarks :
|          -">>> Closing the docking parameter file (DPF)..." .
|          -"This docking finished at:     7:40 04" p.m., 05/23/2022" .
|          -"/home/czgomez/software/autodock/src/autodock/autodock4:
|           _ Successful Completion on "nodo5"" .
|          -"Real= 30m 33.15s,  CPU= 30m 32.96s,  System= 0.23s" ;;
|      -information that can be calculated or extracted :
|        -list of distances between each conformation and the grid center .
|        -list of energies .
|        -list of inhibition constants .
|        -list of RMSDs from reference structure .
|        -completition status .
|        -computation time ;;
|    -information to be output in a molInfo tcl script file :
|      -a list of dir paths containing one or more dlg files (grid names) .
|      -list of dlg file names in each dir .
|      -list of energies of each conformation either from clusters or runs .
|      -list of distances between centers of conformations and grid .
|      -list of RMSD relative to the reference ;
|    -version :-0.0.1 ;
|    -authors :-Carlos Z. Gómez Castro ;
|  -version information :
|    -date :-2022-08-18.Thr ;
|    -status :-unfinished ;
|    -implementing in this version :
|      -a similar structure and design as the mmLogInfo program ;
|    -notes for future versions :
|      -a new array could be used to store the lig-rec info instead of molInfo .
|      -ligInfo record :
|        -... ;;;
}

{
|  -unit dlgRead :
|    -interface section :
|      -uses :
|        -sysutils, strutils, ioDrv, condText ;
|      -constants :
|        -dlgRead_name :- ;
|        -dlgRead_version :- ;
|        -dlgRead_logFile :- ;;
|      -types :
|        -strLogLine :- ;
|        -strToken :- ;
|        -rec_dockedModel :- ;
|        -rec_dlgInfo :
|          -record to store information from a dlg file .
|          -basePath :- ;
|          -dlgPath :- ;
|          -dlgName :- ;
|          -dpfName :- ;
|          -dpfPath :- ;
|          -gridSpacing :- ;
|          -gridXpoints :- ;
|          -gridYpoints :- ;
|          -gridZpoints :- ;
|          -ga_run :- ;
|          - ;
|      -vars :
|        -dlgrl :-object to manage log info messages ;;
|      -functions and procedures :- ;
|        -dlgRead_init :- ;
|        -dlgRead_finish :- ;
|        -dlgRead_test :- ;;;;
|- ;
}

unit dlgRead;

interface

{$H+}  {Ansi strings are used instead short strings}

uses
  sysutils, strutils, ioDrv, condText;

const
  dlgRead_name = 'dlgRead';
  dlgRead_version = '0.0.1';
  dlgRead_logFile = 'log_dlgRead.txt';

type
  strLogLine = AnsiString;
  strToken = string;

  rec_dockedModel = record
    
  end;

  rec_dlgInfo = record
    basePath: strToken;
    dlgPath: strToken;
    dlgName: strToken;
    dpfName: strToken;
    dpfPath: strToken;
    gridSpacing: strToken;
    gridXpoints: strToken;
    gridYpoints: strToken;
    gridZpoints: strToken;
    ga_run: strToken;
  end;

var
  dlgrl : obj_infoMsg;

procedure dlgInfo_recInit (var dlgInfo: rec_dlgInfo);
procedure dlgReadFile (basePath,filePath,fileName: string;
                       var dlgInfo: rec_dlgInfo);

procedure dlgRead_test (testOpt: string);
procedure dlgRead_init;
procedure dlgRead_finish;

{
|  -implementation section :
|    -functions and procedures :
}
implementation

var
  dlgInfo : rec_dlgInfo;

{|-procedure dlgInfo_recInit (var dlgInfo: rec_dlgInfo) :
 |  -initializes a rec_dlgInfo record ;}
procedure dlgInfo_recInit (var dlgInfo: rec_dlgInfo);
  var
    procName: string;
  begin
    procName := 'dlgInfo_recInit';
    dlgrl.infoMsg (0,2,procName+': initializing record dlgInfo...');
    with dlgInfo do
      begin
        basePath := '';
        dlgPath := '';
        dlgName := '';
        dpfName := '';
        dpfPath := '';
        gridSpacing := '';
        gridXpoints := '';
        gridYpoints := '';
        gridZpoints := '';
        ga_run := '';
        {check for external user options...}
      end;
  end;   {dlgInfo_recInit}

{|-procedure dlgReadFile
 | _ (basePath,filePath,fileName: string; var dlgInfo: rec_dlgInfo) :
 |  -reads and process a .dlg file extracting information to dlgInfo .
 |  -arguments :
 |    -basePath :
 |      -directory path sufix to be prepended to the filePath .
 |      -generally ending with "/" .
 |      -acceptable values :
 |        -"", "./" .
 |        -directory path acceptable for the OS ;
 |      -examples :- ;;
 |    -filePath :
 |      -absolute or relative directory path where the .dlg file is located .
 |      -generally ending with "/" .
 |      -acceptable values :
 |        -"", "./" .
 |        -directory path acceptable for the OS ;
 |      -examples :- ;;
 |    -fileName :
 |      -name of the .dlg file to be processed stored in the 'filePath' ;
 |    -dlgInfo :
 |      -record storing all relevant information from the .dlg file .
 |      -must be already initializaed ;;;}
procedure dlgReadFile (basePath,filePath,fileName: string;
                       var dlgInfo: rec_dlgInfo);
  begin
  end;   {dlgReadFile}



{|-procedure dlgRead_test (testOpt: string) :
 |  -performs unit tests ;}
procedure dlgRead_test (testOpt: string);
  begin
  end;

{|-procedure dlgRead_init :
 |  -performs all initialization operations of the unit ;}
procedure dlgRead_init;
  begin
{initialize unit log file}
    dlgrl.init;
    dlgrl.setInfoMsgName ('dlgRead');
    dlgrl.setOutputDevice (c_outdev_screen,'','');
{initialize unit records}
    dlgRead_recInit (dlgInfo);
{code for reading external user options}
    
  end;

{|-procedure dlgRead_finish :
 |  -finalizes the unit ;;;}
procedure dlgRead_finish;
  begin
    dlgrl.finish;
  end;

{|  -dlgRead unit body :- ;;}

begin   {unit dlgRead}
  dlgRead_init
end.

