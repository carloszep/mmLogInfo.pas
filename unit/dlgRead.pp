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
|      -a condText record dlgDB is created with a baseDir, a list of dlgDirs,
|       _ the list of dlgs, the list of rec names, ... ;
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

procedure dlgRead_scanDir (basePath : strToken; dlgDB : obj_condText);
procedure dlgInfo_recInit (var dlgInfo: rec_dlgInfo);
procedure dlgReadFile (basePath,filePath,fileName: string;
                       var dlgInfo: rec_dlgInfo);

procedure dlgRead_test (testOpt: string);
procedure dlgRead_init;
procedure dlgRead_finish;
procedure dlgRead_interpreter (usrCommands : obj_condText; title : p_CTnode);

{
|  -implementation section :
}
implementation

{
|    -var :
|      -dlgInfo :- ;
|      -dlgDB :- ;;;
}
var
  dlgInfo : rec_dlgInfo;
  dlgDB : obj_condText;

{
|    -functions and procedures :
}

{
|-procedure dlgRead_scanDir (basePath : strToken; dlgDB : obj_condText); :
|  -makes a recursive search of directories containing .dlg files .
|  -arguments :
|    -basePath :
|      -path from which the recursive search is started .
|      -acceptable values :
|        -either a relative or absolute linux path ;;
|    -dlgDB :
|      -condText object used to record the directory paths found .
|      -CT structure created (example) :
|        -dlgBasePath :
|          -<absBasePath> ;
|        -dlgDirList :
|          -<relDirPath1> :
|            -dlgFileList :
|              -<dlgFileName1> .
|              -<dlgFileName1> .
|              -... ;;
|          -<relDirPath2> :- ;
|          -... ;;;;
|  -notes :
|    -the directory path found are recorded as absolute paths ;;
}
procedure dlgRead_scanDir (basePath : strToken; dlgDB : obj_condText);
  begin
  end;   {dlgRead_scanDir}

{
|-procedure dlgInfo_recInit (var dlgInfo: rec_dlgInfo) :
|  -initializes a rec_dlgInfo record ;
}
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
 |  -information to be extracted :
 |    -dpfName .
 |    - ;
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
  var
    procName : string;
    lline : strLogLine;
    ltoken : strToken;
    dlg : text;
    

  begin
    procName := 'dlgReadFile: ';
    dlgrl.infoMsg (0,2,procName+'Reading .dlg file; ');
    dlgrl.infoMsg (0,2,'    extracting data into dlgInfo record.');
    dlgrl.infoMsg (0,3,'  fileName: '+fileName);
    dlgrl.infoMsg (0,3,'  filePath: '+filePath);
    dlgrl.infoMsg (0,3,'  basePath: '+basePath);
{initializing dlgInfo record}
{    dlgInfo_recInit (dlgInfo);}

{record input}
    dlgInfo.basePath := basePath;
    dlgInfo.dlgPath := filePath;
    dlgInfo.dlgName := fileName;

{openning and processing file}
    assign (dlg, basePath+filePath+fileName);
{$I-} reset (dlg); {$I+}
    if IOresult <> 0 then
      begin
        dlgrl.infoMsg (7,1,procName+'Error reading file: '+fileName);
        exit
      end
    else
      begin
        while not EoF(dlg) do
          begin
            readln (dlg, lline);
            if pos('Docking parameter file (DPF) used', lline) > 0 then
              begin
                dlgrl.infoMsg (0,3,'logLine: '+lline);
                ltoken := ExtractWord(8, lline, [' ']);
                dlgInfo.dpfName := ltoken;
                dlgrl.infoMsg (0,3,'  DPF: '+ltoken);
                if FileExists(basePath+filePath+dlgInfo.dpfName) then
                  begin
                    dlgrl.infoMsg (0,3,'DPF available in '+basePath+filePath);
                    dlgInfo.dpfPath := basePath + filePath;
                  end
                else   {note: code for search in other directories may be added}
                  begin
                    dlgrl.infoMsg (0,3,'DPF not found in '+basePath+filePath);
                  end
              end
            else if pos('Grid Point Spacing =', lline) > 0 then
              begin
                dlgrl.infoMsg (0,3,'logLine: '+lline);
                ltoken := ExtractWord(5, lline, [' ']);
                dlgInfo.gridSpacing := ltoken;
                dlgrl.infoMsg (0,3,'  grid point spacing: '+ltoken);
              end
            else if pos('x-points' , lline) > 0 then
              begin
                dlgrl.infoMsg (0,3,'logLine: '+lline);
                ltoken := ExtractWord(7, lline, [' ']);
                dlgInfo.gridXpoints := ltoken;
                dlgrl.infoMsg (0,3,'  X grid points: '+ltoken);
              end
            else if pos('y-points' , lline) > 0 then
              begin
                dlgrl.infoMsg (0,3,'logLine: '+lline);
                ltoken := ExtractWord(1, lline, [' ']);
                dlgInfo.gridYpoints := ltoken;
                dlgrl.infoMsg (0,3,'  Y grid points: '+ltoken);
              end
            else if pos('z-points' , lline) > 0 then
              begin
                dlgrl.infoMsg (0,3,'logLine: '+lline);
                ltoken := ExtractWord(1, lline, [' ']);
                dlgInfo.gridZpoints := ltoken;
                dlgrl.infoMsg (0,3,'  Z grid points: '+ltoken);
              end
            else if pos('DPF> ga_run', lline) > 0 then
              begin
                dlgrl.infoMsg (0,3,'logLine: '+lline);
                ltoken := ExtractWord(3, lline, [' ']);
                dlgInfo.ga_run := ltoken;
                dlgrl.infoMsg (0,3,'  ga_run: '+ltoken);
              end
            else
              begin
              end
          end;
      end;
    dlgrl.infoMsg (0,2,procName+'Done.');
    close (dlg);
  end;   {dlgReadFile}



{|-procedure dlgRead_test (testOpt: string) :
 |  -performs unit tests ;}
procedure dlgRead_test (testOpt: string);
  var
    procName : strToken;
    basePath, filePath, fileName : strLogLine;

  procedure test_dlgReadFile;
    begin
      dlgrl.infoMsg (0,1,'  performing test: dlgReadFile:');
      basePath := '/Users/carloszep/Zep/Shared/GitHub/';
      filePath := 'ksa-proy/ad4/cluster1/dock/cluster1/dlg/';
      fileName := 'DHP-Br_cluster1.dlg';
      dlgrl.infoMsg (0,2,'  basePath: '+basePath);
      dlgrl.infoMsg (0,2,'  filePath: '+filePath);
      dlgrl.infoMsg (0,2,'  fileName: '+fileName);
      dlgReadFile (basePath, filePath, fileName, dlgInfo);
    end;

  begin
    procName := 'dlgRead_test: ';
    dlgrl.infoMsg (0,1,procName+'Tests for unit dlgRead.');
    case LowerCase(testOpt) of
        'dlgreadfile' : test_dlgReadFile;
        else
          begin
            dlgrl.infoMsg (1,1,procName+'option not found.');
          end;
      end;
  end;

{|-procedure dlgRead_init :
 |  -performs all initialization operations of the unit ;}
procedure dlgRead_init;
  begin
{initialize unit log file}
    dlgrl.init;
    dlgrl.setInfoMsgName (dlgRead_name+dlgRead_version);
    dlgrl.setOutputLevel (c_outLvl_detailed);
    dlgrl.setOutputDevice (c_outdev_screen,'','');
{initialize unit records}
    dlgInfo_recInit (dlgInfo);
    dlgDB.init;
{code for reading external user options}
    
  end;

{|-procedure dlgRead_finish :
 |  -finalizes the unit ;;;}
procedure dlgRead_finish;
  begin
    dlgrl.finish;
  end;

{
|-procedure dlgRead_interpreter (usrCommands: obj_condText; title: p_CTnode); :
|  - ;
}
procedure dlgRead_interpreter (usrCommands: obj_condText; title: p_CTnode);
  begin
  end;

{
|      - ;;;
}

{|  -dlgRead unit body :- ;;}

begin   {unit dlgRead}
  dlgRead_init
end.

