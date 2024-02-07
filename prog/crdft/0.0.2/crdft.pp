{
|-crdft.pp :
|  -freepascal program to process scalar fields from
|   _ electronic-structure calculations to plot
|   _ Density Functional Chemical Reactivity Theory functions .
|  -the program reads and writes scalar-field data in format
|   _ compatible to VMD trhough a tcl script .
|  -the program series continues from fukuiData v-0.0.3 .
|  -functionality :
|    -Fukui function and dual descriptor plots :
|      -calculation Fukui's functions from electron density data .
|      -input data :-electron density of the neutral, anionic and cationic
|       _ species of a molecule [rho-N(r), rho-A(r) and rho-C(r)] ;
|      -output :
|        -nucleophilic Fukui function [f-(r)] .
|        -electrophilic fukui function [f+(r)] .
|        -dual descriptor function [delta-f(r)] ;;
|    -analysis of the electrostatic potential (covalent term) ...* .
|      -caculation of the total energy and covalent term functions * .
|      -input data :
|        -electrostatic potential data of the neutral, anionic and cationic
|         _ species of a molecule [esp-N(r), esp-A(r), esp-C(r)] ;
|      -output :
|        -nucleophilic covalent term function [covT-N(r)] .
|        -electrophilic covalent term function [covT-E(r)] .
|        -nucleophilic total energy * function [totE-N(r)] .
|        -electrophiloc total energy term * function [totE-E(r)] ;;
|    -Fukui potential plots :
|      -calculation of the Fukui potential functions .
|      -input data :
|        -electrostatic potential data of the neutral, anionic and cationic
|         _ species of a molecule [esp-N(r), esp-A(r), esp-C(r)] ;
|      -output :
|        -nucleophilic Fukui potential function [nu-f-(r)] .
|        -electrophilic Fukui potential function [nu-f+(r)] .
|        -dual potential function [delta-nu-f(r)] ***???*** ;;;
|  -authors and contributors :
|    -Angel U. Orozco Valencia .
|    -Carlos Z. Gómez Castro :
|  -date :-2017-11-13.Tue ;
|  -version :-0.0.2 ;
|  -version information :
|    -changes to do or currently in progress :
|      -Fukui potential functions .
|      -improving command-line parameters input :
|        -provide option to set prefix for output files ;
|      -tcl script output for ploting in VMD :
|        -pending initialization and termination of the tcl object ;
|      -update command-line help (usage) .
|      -implement default parameters in external condText files ;
|    -changes done :
|      -command-line parameters improved .
|      -fukui potential calculation implemented ;;
|    -finished version ;
|  -helpCT :
|    -command-line usage :
|      -'crdft <function> [<parameter> <value> ...]' ;
|    -command-line parameters :
|      -<function> (parameter 1) :
|        -"fukui", "dual", "dualDesc", "dual-desc" :
|          -perform Fukui and dual-descriptor function calculation .
|          -required parameters :-rhoN, rhoA and rhoC of a molecule ;
|          -default values :-"rhoN.asc", "rhoA.asc", "rhoC.asc" ;
|          -default output file names :
|            -"fukui-Nu.asc", "fukui-El.asc", "dualD.asc", "fukui.tcl" ;;
|        -"covt", "covTerm", "totalEnergy", "totEnergy" :
|          -perform covalent-term analysis calculation .
|          -required parameters :-espN, espA, espC and deltaN of a molecule ;
|          -default values :-"espN.asc", "espA.asc", "espC.asc" and 1.0 ;
|          -default output file names :
|            -"covT-Nu.asc", "covT-El.asc", "totEn-Nu.asc", "totEn-El.asc" ;;
|        -"fukuip", "fukuiPot", "fukuiPotential", "fPot" :
|          -perform Fukui-potential calculation .
|          -required parameters :-espN, espA and espC of a molecule ;
|          -default values :-"espN.asc", "espA.asc", "espC.asc" ;
|          -default output file names :
|            -"fukuiPot-Nu.asc", "fukuPot-El.asc" ;;
|        -"script", "tclScript", "vmdScript", "plotScript", "plotVMD" :
|          -only generate VMD script to plot a scalar field .
|          -required parameters :-scalar Field of a molecule ;
|          -default value :-"scalarField.asc" ;;;
|      -variable/optional parameters (parameter 2 onwards) :
|        -parameters for specifying ASCII data file names :
|          -"rhoN", "EDN" :
|            -electron density of the neutral species of a molecule ;
|          -"rhoA", "EDA" :
|            -electron density of the anionic species of a molecule ;
|          -"rhoC", "EDC" :
|            -electron density of the cationic species of a molecule ;
|          -"espN", "EPN" :
|            -electrostatic potential of the neutral species of a molecule ;
|          -"espA", "EPA" :
|            -electrostatic potential of the anionic species of a molecule ;
|          -"espC", "EPC" :
|            -electrostatic potential of the cationic species of a molecule ;
|          -"scalarFieldN", "scFieldN", "SFN" :
|            -any scalar field of the neutral species of a molecule ;
|          -"scalarFieldA", "scFieldA", "SFA" :
|            -any scalar field of the anionic species of a molecule ;
|          -"scalarFieldC", "scFieldC", "SFC" :
|            -any scalar field of the cationic species of a molecule ;
|          -"scalarField", "scField", "SF" :-generic scalar field ;;
|        -numeric parameters (real type) :
|          -"deltaN", "delta-N" :
|            -delta-N value for covalent-term analysis ;;
|        -parameters for specifying molecule file names :
|          -"xyzMol", "molXYZ" :
|            -XYZ molecule file name .
|            -expected to correspond to the scalar fields ;;
|        -parameters for output files :
|          -"prefix", "outPrefix" :
|            -prefix prepended to output files ;;;;
}
//|  -{propertyRecord} :
{
|      -mark :--extense ;
|      -tabSpace :-3 ;
|      -bullet :-·>  ;;;
|  -definitions :
|    -Fukui function (f(r)) :
|      - ;
|    -nucleophilic Fukui function (f-(r)) :
|      - ;
|    -electrophilic Fukui function (f+(r)) :
|      - ;
|    -dual descriptor (delta_f) :
|      - ;
|    -analysis for electrostatic potential (covalent term)... * :
|      - ;
|    -Fukui potential function ... :
|      - ;;
|  -bibliography :
|    - ;
|  -uses :
|    -sysutils .
|    -ioDrv .
|    -condText ;
|  -program constants :
|    -crdft_name :-string for program name ;
|    -crdft_version :-string with the program version number ;;
|  -program variables :
|    -iml :-object for managing the output log information .
|    -tcl :-output object to write a tcl script for VMD ;
|    -userParamFile :-*** decidir tipo de archivo y función *** ;
|    -plotFunction :-flag specifying the plot to perform .
|      -for the moment is specified by the number of arguments ;
|    -dataFileN, dataFileA, dataFileC :
|      -name of the data files containing the electron density or electrostatic
|     _ potential of the neutral, anionic, and cationic species ;
|    -dataFileGen :-data file name for a generic scalar field ;
|    -fukuiOutFileN, fukuiOutFileE :-default names for the output files
|     _ containing the fukui function data .
|      -assigned during initialization ;
|    -dualDescOutFile :-name for dual descriptor output file ;
|    -covtNOutFile :-name for output covalent term (nucloefile) ;
|    -covtEOutFile :-name for output covalent term (eleftrofile)  ;
|    -fukuiPotNuName, fukuiPotElName :
|      -file names for output Fukui potential (nucleophilic, electrophilic) ;
|    -deltaN :-user-defined parameter for covalent term analysis ;
|    -xyzMolName :-name of the XYZ file of a molecule .
|      -the molecule is expected to correspond to the scalar fields .
|      -default value :-'molecule.xyz' ;;
|    -outPrefix :-prefix prepended to output file names .
|      -default value :-'' ;;
|    -scriptName :-name of the output file containing VMD tcl script .
|      -default value :-the same as the output files with extension ".tcl" ;;;
|  -procedures and functions :
|    -crdft_finish :-finalizes the program ;
|    -crdft_init :-initializes the program ;
|    -fukuiCalc :-calculates fukui functions from density data ;
|    -covtCalc :-calculates covalent term from electrostatic potential ;;;
}
program crdft;

uses
  sysutils, ioDrv, condText;

const
  crdft_name = 'crdft';
  crdft_version = '0.0.2';

var
  iml : obj_infoMsg;
{  tcl : obj_output; }
  plotFunction : string;
  dataFileN, dataFileA, dataFileC, dataFileGen, xyzMolName : String;
  fukuiOutFileN, fukuiOutFileE, dualDescOutFile : String;
  covtNOutFile, covtEOutFile, totENOutFile, totEEOutFile : String;
  fukuiPotNuName, fukuiPotElName : String;
  outPrefix, scriptName : String;
  deltaN : Real;

procedure crdft_finish;
  begin
    iml.infoMsg (0,2,'crdft_finish: unlinking condText log file.');
    CTlog.unlinkExtDev;
    iml.infoMsg (0,1,'crdft_finish: ending program...');
    iml.finish;
    halt
  end;   {crdft_finish}

{|-procedure crdft_init; :
 |  -general initialization of the crdft program .
 |  -initializes command-line help, log File and default parameters .
 |  -look for the external user parameter file and update parameters .
 |  -interprets command-line parameters .
 |  -initializes program .
 |  -initializes global variables .
 |  -checks input command-line parameters .
 |  -prints usage and help information ;|}
procedure crdft_init;
  const
    name = 'crdft_init: ';
  var
    strTmp : string;

  procedure logFileInit;
    begin
{initialize infoMsg object for the log output (iml)}
      iml.init;
      iml.setInfoMsgName (crdft_name + '-v.' + crdft_version);
      iml.setOutputDevice (c_outDev_file,
                         'log_' + crdft_name + '.txt', 'rewrite');
      iml.infoMsg (0,1,name + 'Program log file initialized');
      iml.infoMsg (0,1,'  Initial Time: ' + DateTimeToStr(Now));
      iml.setOutputLevel (c_outLvl_extense);
{linking condText unit log file to iml}
      iml.infoMsg (0,2,name+'sending info messages from condText ' +
                     'unit to the current log file');
      CTlog.setOutputDevice (c_outdev_none,'','');
      CTlog.linkExtDev (iml);
    end;   {logFileInit}

  procedure printHelp;
    begin
      iml.infoMsg (0,1,name+'showing command-line help only.');
      writeln;
      writeln (crdft_name + '-v.' + crdft_version + ': ' +
        'Calculation of CRDFT scalar-field functions for plotting ');
      writeln;
      writeln ('  Usage: ');
      writeln ('    crdft <function> [<parameter> <value> ...]');
      writeln;
      writeln ('  Available functions:');
      writeln ('    (1) "fukui", ...');
      writeln ('    (2) "covt", ...');
      writeln ('    (3) "fukuip", ...');
      writeln ('    (4) "script", (*unfinished*) ...');
      writeln ('    (5) "h", "help", "-h", "--help", "--helpCT"');
      writeln;
      writeln ('  Input file name defaults - (for function):');
      writeln ('    "rhoN.asc", "rhoA.asc", "rhoC.asc" - (1)');
      writeln ('    "espN.asc", "espA.asc", "espC.asc" - (2,3)');
      writeln ('    "scalarField.asc" - (4) (*unfinished*)');
      writeln;
      writeln ('  Valid variable/optional parameters - (for function):');
      writeln ('    "h", "help", "-h", "--help", "--helpCT"');
      writeln ('    "rhoN" - (1), "espN" - (2,3), "scalarFieldN" - (1-3)');
      writeln ('    "rhoA" - (1), "espA" - (2,3), "scalarFieldA" - (1-3)');
      writeln ('    "rhoC" - (1), "espC" - (2,3), "scalarFieldC" - (1-3)');
      writeln ('    "delN", "deltaN", "delta-N" - (2)');
      writeln ('    "xyzMol", "molXYZ" - (1-4) (*unfinished*)');
      writeln ('    "prefix", "outPrefix" - (1-4) (*unfinished*)');
      writeln ('    ...');
      writeln;
      writeln ('  Output file names defaults - (for function):');
      writeln ('    "fukui-nu.asc", "fukui-el.asc", "dualD.asc" - (1)');
      writeln ('    "covT-nu.asc", "covT-el.asc", ' +
                   '"totEn-nu.asc", "totEn-el.asc" - (2)');
      writeln ('    "fukuiPot-nu.asc", "fukuiPot-el.asc" - (3)');
      writeln;
      writeln ('  Notes:');
      writeln ('    -The input scalar fields are obtained from the deMon2k');
      writeln ('     program, i.e. using the keyword "PLOT RHO ASCII".');
      writeln ('    -The script extRho.awk must be used to extract only');
      writeln ('     the real (scalar) values form the .asc files.');
      writeln ('    -A log file "log_'+crdft_name+'-v.'+crdft_version+'" is');
      writeln ('     automatically created/overwritten besides output files.');
      writeln ('    -The specified "prefix" is prepended to all output files.');
      writeln;
    end;   {printHelp}

  procedure defaultParam;
    begin
      iml.infoMsg (0,1,name+'setting up default parameters.');
      {default names for input files}
      dataFileN := 'scalarFieldN.asc';
      dataFileA := 'scalarFieldA.asc';
      dataFileC := 'scalarFieldC.asc';
      dataFileGen := 'scalarField.asc';
      xyzMolName := 'molecule.xyz';
      iml.infoMsg(0,2,name+'default value: dataFileN: '+dataFileN);
      iml.infoMsg(0,2,name+'default value: dataFileA: '+dataFileA);
      iml.infoMsg(0,2,name+'default value: dataFileC: '+dataFileC);
      iml.infoMsg(0,2,name+'default value: dataFileGen: '+dataFileGen);
      iml.infoMsg(0,2,name+'default value: xyzMolName: '+xyzMolName);
      {default names for output files}
      fukuiOutFileN := 'fukui-nu.asc';
      fukuiOutFileE := 'fukui-el.asc';
      dualDescOutFile := 'dualD.asc';
      covtNOutFile := 'covT-nu.asc';
      covtEOutFile := 'covT-el.asc';
      totENOutFile := 'totEn-nu.asc';
      totEEOutFile := 'totEn-el.asc';
      fukuiPotNuName := 'fukuiPot-nu.asc';
      fukuiPotElName := 'fukuiPot-el.asc';
      outPrefix := '';
      iml.infoMsg(0,2,name+'default value: fukuiOutFileN: '+fukuiOutFileN);
      iml.infoMsg(0,2,name+'default value: fukuiOutFileE: '+fukuiOutFileE);
      iml.infoMsg(0,2,name+'default value: dualDescOutFile: '+dualDescOutFile);
      iml.infoMsg(0,2,name+'default value: covtNOutFile: '+covtNOutFile);
      iml.infoMsg(0,2,name+'default value: covtEOutFile: '+covtEOutFile);
      iml.infoMsg(0,2,name+'default value: totENOutFile: '+totENOutFile);
      iml.infoMsg(0,2,name+'default value: totEEOutFile: '+totEEOutFile);
      iml.infoMsg(0,2,name+'default value: fukuiPotNuName: '+fukuiPotNuName);
      iml.infoMsg(0,2,name+'default value: fukuiPotElName: '+fukuiPotElName);
      iml.infoMsg(0,2,name+'default value: outPrefix: '+outPrefix);
      {physiscal parameters}
      deltaN := 1.0;
      Str (deltaN:6:3, strTmp);
      iml.infoMsg(0,3,name+'default value: deltaN: '+strTmp);
    end;   {defaultParam}

  procedure externalParam (fileName : String);
    begin
      iml.infoMsg (0,2,name+'looking for external user parameters file.');
      {*** pendiente ***}
    end;   {externalParam}

  procedure writeExternalParam (fileName : String);
    begin
      iml.infoMsg (0,2,name+'writing external user parameters file.');
      {*** pendiente ***}
    end;   {writeExternalParam}

  procedure checkCLParam;
    var
      strTmp : String;
      code : Word;
      p : Byte;
      helpCT : obj_condText;

    begin
      iml.infoMsg (0,1,name + 'Command line: ' + ParamStr(0));
      str (ParamCount, strTmp);
      iml.infoMsg (0,2,name + 'ParamCount: ' + strTmp);
{checking <function> options}
      case upCase(ParamStr(1)) of
        'FUKUI','DUAL','DUALDESC','DUAL-DESC':
          begin
            plotFunction := 'fukui';
            dataFileN := 'rhoN.asc';
            dataFileA := 'rhoA.asc';
            dataFileC := 'rhoC.asc';
            iml.infoMsg(0,1,name+'function option: "fukui"');
            iml.infoMsg(0,2,name+'default value: dataFileN: '+dataFileN);
            iml.infoMsg(0,2,name+'default value: dataFileA: '+dataFileA);
            iml.infoMsg(0,2,name+'default value: dataFileC: '+dataFileC)
          end;
        'COVT','COVTERM','TOTALENERGY','TOTENERGY':
          begin
            plotFunction := 'covt';
            iml.infoMsg(0,1,name+'function option: "covt"');
          end;
        'FUKUIP','FUKUIPOT','FUKUIPOTENTIAL','FPOT':
          begin
            plotFunction:='fukuip';
            iml.infoMsg(0,1,name+'function option: "fukuip"');
          end;
        'SCRIPT', 'TCLSCRIPT','VMDSCRIPT','PLOTSCRIPT','PLOTVMD':
          begin
            plotFunction:='script';
          end;
        '-H','H','HELP':
          begin
            printHelp;
            crdft_finish;
          end;
        '--HELPCT', '--HELP':
          begin   {provisional}
            iml.infoMsg (0,1,name+'loading help from condText file...');
            helpCT.init;
//            iml.setOutputLevel (c_outLvl_moderated);
            helpCT.open ('crdft.pp','I');
            helpCT.print (helpCT.findTextRec(nil, 'helpCT'), 1, 0, 1, 1, '');
//            iml.setOutputLevel (c_outLvl_detailed);
            helpCT.finish;
            crdft_finish
          end;
        else
          begin
            iml.infoMsg (2,1,name+'Invalid option: '+ParamStr(1)+'; try -h.');
            writeln ('Invalid option: '+ParamStr(1)+'; try -h.');
            crdft_finish
          end
        end;
{updating defaults for covt or fukuip}
      if (plotFunction = 'covt') or (plotFunction = 'fukuip') then
        begin
          dataFileN := 'espN.asc';
          dataFileA := 'espA.asc';
          dataFileC := 'espC.asc';
          iml.infoMsg(0,2,name+'default value: dataFileN: '+dataFileN);
          iml.infoMsg(0,2,name+'default value: dataFileA: '+dataFileA);
          iml.infoMsg(0,2,name+'default value: dataFileC: '+dataFileC)
        end;
{checking variable/optional parameters}
      p := 2;
      while (p <= ParamCount) do
        begin
          strTmp := ParamStr(p);
          if Pos('--', strTmp) > 0 then Delete(strTmp, 1, 2)
            else if Pos('-', strTmp) = 1 then Delete(strTmp, 1, 1);
          iml.InfoMsg (0,3,name+'checking parameter: '+strTmp);
          case upCase(strTmp) of
              'RHON', 'EDN' : 
                begin
                  if plotFunction <> 'fukui' then
                    begin
                      iml.infoMsg (2,1,name+
                        'rhoN parameter reserved for the "fukui" option');
                      crdft_finish
                    end;
                  dataFileN := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for rho (neutral): '+
                                   dataFileN)
                end;
              'RHOA', 'EDA' :
                begin
                  if plotFunction <> 'fukui' then
                    begin
                      iml.infoMsg (2,1,name+
                        'rhoA parameter reserved for the "fukui" option');
                      crdft_finish
                    end;
                  dataFileA := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for rho (anionic): '+
                                   dataFileA)
                end;
              'RHOC', 'EDC' :
                begin
                  if plotFunction <> 'fukui' then
                    begin
                      iml.infoMsg (2,1,name+
                        'rhoC parameter reserved for the "fukui" option');
                      crdft_finish
                    end;
                  dataFileC := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for rho (cationic): '+
                                   dataFileC)
                end;
              'ESPN', 'EPN' :
                begin
                  if (plotFunction <> 'covt') and 
                     (plotFunction <> 'fukuip') then
                    begin
                      iml.infoMsg (2,1,name+'espN parameter reserved for '+
                        'function options "covt" or "fukuip"');
                      crdft_finish
                    end;
                  dataFileN := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for ESP (neutral): '+
                                   dataFileN)
                end;
              'ESPA', 'EPA' :
                begin
                  if (plotFunction <> 'covt') and
                     (plotFunction <> 'fukuip') then
                    begin
                      iml.infoMsg (2,1,name+'espA parameter reserved for '+
                        'function options "covt" or "fukuip"');
                      crdft_finish
                    end;
                  dataFileA := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for ESP (anionic): '+
                                   dataFileA)
                end;
              'ESPC', 'EPC' :
                begin
                  if (plotFunction <> 'covt') and
                     (plotFunction <> 'fukuip') then
                    begin
                      iml.infoMsg (2,1,name+'espC parameter reserved for '+
                        'function options "covt" or "fukuip"');
                      crdft_finish
                    end;
                  dataFileC := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for ESP (cationic): '+
                                   dataFileC)
                end;
              'SCALARFIELDN', 'SCFIELDN', 'SFN' :
                begin
                  if (plotFunction <> 'fukui') and (plotFunction <> 'fukui') and
                     (plotFunction <> 'fukuip') then
                    begin
                      iml.infoMsg (2,1,name+'scalarFieldN parameter reserved '+
                        'for function options "fukui", "covt" or "fukuip"');
                      crdft_finish
                    end;
                  dataFileN := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for the scalar field '+
                                        '(neutral): '+dataFileN)
                end;
              'SCALARFIELDA', 'SCFIELDA', 'SFA' :
                begin
                  if (plotFunction <> 'fukui') and (plotFunction <> 'fukui') and
                     (plotFunction <> 'fukuip') then
                    begin
                      iml.infoMsg (2,1,name+'scalarFieldA parameter reserved '+
                        'for function options "fukui", "covt" or "fukuip"');
                      crdft_finish
                    end;
                  dataFileA := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for the scalar field '+
                                        '(anionic): '+dataFileA)
                end;
              'SCALARFIELDC', 'SCFIELDC', 'SFC' :
                begin
                  if (plotFunction <> 'fukui') and (plotFunction <> 'fukui') and
                     (plotFunction <> 'fukuip') then
                    begin
                      iml.infoMsg (2,1,name+'scalarFieldC parameter reserved '+
                        'for function options "fukui", "covt" or "fukuip"');
                      crdft_finish
                    end;
                  dataFileC := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for the scalar field '+
                                        '(cationic): '+dataFileC)
                end;
              'SCALARFIELD', 'SCFIELD', 'SF' :
                begin
                  if (plotFunction <> 'script') then
                    begin
                      iml.infoMsg (2,1,name+'scalarField parameter reserved '+
                        'for function option "script"');
                      crdft_finish
                    end;
                  dataFileGen := ParamStr(p+1);
                  iml.infoMsg (0,1,name+'data file for a generic scalar field: '
                                       + dataFileGen)
                end;
              'DELTAN', 'DELTA-N' :
                begin
                  if (plotFunction <> 'covt') then
                    begin
                      iml.infoMsg (2,1,name+'deltaN parameter reserved '+
                        'for function option "covt"');
                      crdft_finish
                    end;
                  Val (ParamStr(p+1), deltaN, code);
                  if code <> 0 then
                    begin
                      iml.infoMsg (2,1,name+'deltaN must be real.');
                      crdft_finish
                    end;
                  iml.infoMsg (0,1,name+'delta-N value for function "covt": '+
                                        ParamStr(p+1))
                end;
              'XYZMOL', 'MOLXYZ' :
                begin
                  xyzMolName := ParamStr(p+1);
                  iml.InfoMsg (0,1,name+'XYZ molecule file name: '+xyzMolName)
                end;
              'PREFIX', 'OUTPREFIX' :
                begin
                  outPrefix := ParamStr(p+1);
                  iml.InfoMsg (0,1,name+'prefix to output files: '+outPrefix)
                end;
            else
              begin
                iml.infoMsg (1,0,name+'Warning: unkown parameter: '+strTmp);
                iml.infoMsg (1,0,name+'Warning: unused parameter value: '
                                 +ParamStr(p+1));
              end
            end;
          p := p + 2
        end;
{checking input scalar field data files}
      if (plotFunction = 'fukui') or (plotFunction = 'covt') or
         (plotFunction = 'fukuip') then
        begin
          if not FileExists(dataFileN) then
            begin
              iml.infoMsg (2,1,name+'file missing: ' + dataFileN);
              crdft_finish
            end;
          if not FileExists(dataFileA) then
            begin
              iml.infoMsg (2,1,name+'file missing: ' + dataFileA);
              crdft_finish
            end;
          if not FileExists(dataFileC) then
            begin
              iml.infoMsg (2,1,name+'file missing: ' + dataFileC);
              crdft_finish
            end
        end
    end;   {checkCLParam}

  begin   {crdft_init}
    logFileInit;
    defaultParam;
    checkCLParam;
  end;   {crdft_init}


{|-procedure calc_SF_NAC :
 |  -calculate CRDFT functions involving scalar fields of a molecule in
 |   _ neutral, anionic and cationic forms .
 |  -functions implemented :
 |    -for the "fukui" function option (flag) :
 |      -fukui-Nu, fukui-El, dual-descriptor ;
 |    -for the "covt" function option (flag) :
 |      -cov-term-Nu, cov-term-El, totEn-Nu, totEn-El ;
 |    -for the "fukuip" function option (flag) :
 |      -fukui-pot-Nu, fukui-pot-El ;;;|}
procedure calc_SF_NAC;

  function fukui_Nu (rhoN, rhoC : Real) : Real;
    begin
      fukui_Nu := rhoN - rhoC
    end;

  function fukui_El (rhoN, rhoA : Real) : Real;
    begin
      fukui_El := rhoA - rhoN
    end;

  function dualD (rhoN, rhoA, rhoC : Real) : Real;
    begin
      dualD := fukui_El(rhoN, rhoA) - fukui_Nu(rhoN, rhoC)
    end;

  function covT_Nu (espN, espC : Real) : Real;
    begin
      covT_Nu := (1 - deltaN)*espN + deltaN*espC
    end;

  function covT_El (espN, espA : Real) : Real;
    begin
      covT_El := (1 - deltaN)*espN + deltaN*espA
    end;

  function totEn_Nu (espN, espC : Real) : Real;
    begin
      totEn_Nu := covT_Nu(espN, espC) + espN
    end;

  function totEn_El (espN, espA : Real) : Real;
    begin
      totEn_El := covT_El(espN, espA) - espN
    end;

  function fukuiPot_Nu (espN, espC : Real) : Real;
    begin
      fukuiPot_Nu := espC - espN
    end;

  function fukuiPot_El (espN, espA : Real) : Real;
    begin
      fukuiPot_El := espN - espA
    end;

  begin   {calc_SF_NAC}
    
  end;   {calc_SF_NAC}

{|-procedure fukuiCalc; :
 |  -Calculates electrophilic and nucleophilic Fukui functions .
 |  - ;|}
procedure fukuiCalc;
  const
    name = 'fukuiCalc: ';
  var
    strRN, strRA, strRC : String;
    rhoN, rhoA, rhoC, fukuiN, fukuiE, dualDesc : Real;
    datRN, datRA, datRC, datFN, datFE, datDD : Text;
    code : Integer;

  begin   {fukuiCalc}
    iml.infoMsg (0,1,name+'Calculating Fukui functions from electron density');
{openning data files for electron density}
    assign (datRN, dataFileN);
{$I-} reset (datRN); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileN);
        crdft_finish
      end
    else
      iml.infoMsg(0,2,name+'Reading electron density data from: '+dataFileN);
    assign (datRA, dataFileA);
{$I-} reset (datRA); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileA);
        crdft_finish
      end
    else
      iml.infoMsg(0,2,name+'Reading electron density data from: '+dataFileA);
    assign (datRC, dataFileC);
{$I-} reset (datRC); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileC);
        crdft_finish
      end
    else
      iml.infoMsg(0,2,name+'Reading electron density data from: '+dataFileC);
{preparing output data files for the fukui functions}
    iml.infoMsg (0,1,name+'preparing output file for fukui functions: ' +
          fukuiOutFileN + ', ' + fukuiOutFileE + ' and ' + dualDescOutFile);
    assign (datFN, fukuiOutFileN);
    assign (datFE, fukuiOutFileE);
    assign (datDD, dualDescOutFile);
    rewrite (datFN);
    rewrite (datFE);
    rewrite (datDD);
{processing each data point}
    while not EoF(datRN) do
      begin
        readln (datRN, strRN);
        readln (datRA, strRA);
        readln (datRC, strRC);
        val (strRN, rhoN, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading rho data in: '+dataFileN);
            crdft_finish
          end;
        val (strRA, rhoA, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading rho data in: '+dataFileA);
            crdft_finish
          end;
        val (strRC, rhoC, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading rho data in: '+dataFileC);
            crdft_finish
          end;
{calculating functions}
        fukuiN := rhoN - rhoC;
        fukuiE := rhoA - rhoN;
        dualDesc := fukuiE - fukuiN;
{writing data into output files}
        writeln (datFN, fukuiN:15);
        writeln (datFE, fukuiE:15);
        writeln (datDD, dualDesc:15);
      end;
{closing input and output files}
    close (datRN);
    close (datRA);
    close (datRC);
    close (datFN);
    close (datFE);
    close (datDD);
    iml.infoMsg (0,1,name+'Done.')
  end;   {fukuiCalc}

{|-procedure covtCalc; :
 |  -Calculates covalent term function .
 |  - ;|}
procedure covtCalc;
  const
    name = 'covtCalc: ';
  var
    strVN, strVC, strVA, strTmp : String;
    espN, espC, espA, covtNu, covtEl, eTotNu, eTotEl : Real;
    datVN, datVC, datVA, datCTN, datCTE, datETN, datETE : Text;
    code : Integer;

  begin   {covtCalc}
    iml.infoMsg (0,1,name+
            'Calculating Covalent Term function from electrostatic potential');
    Str (deltaN:6:3, strTmp);
    iml.infoMsg (0,1,name+'deltaN value: ' + strTmp);
{openning data files for electron density}
    assign (datVN, dataFileN);
{$I-} reset (datVN); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileN);
        crdft_finish
      end
    else
      iml.infoMsg (0,2,name + 'Reading ESP data from: ' + dataFileN);
    assign (datVC, dataFileC);
{$I-} reset (datVC); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileC);
        crdft_finish
      end
    else
      iml.infoMsg (0,2,name + 'Reading ESP data from: ' + dataFileC);
    assign (datVA, dataFileA);
{$I-} reset (datVA); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileA);
        crdft_finish
      end
    else
      iml.infoMsg (0,2,name + 'Reading ESP data from: ' + dataFileA);
{preparing output data file for the covalent term function}
    iml.infoMsg (0,1,name+'preparing output files for covalent term functions: '
                         +  covtNOutFile + ' and ' + covtEOutFile + '.');
    iml.infoMsg (0,1,name+'preparing output files for total energy: '
                         + totENOutFile + ' and ' + totEEOutFile);
    assign (datCTN, covtNOutFile);
    rewrite (datCTN);
    assign (datCTE, covtEOutFile);
    rewrite (datCTE);
    assign (datETN, totENOutFile);
    rewrite (datETN);
    assign (datETE, totEEOutFile);
    rewrite (datETE);
{processing each data point}
    while not EoF(datVN) do
      begin
        readln (datVN, strVN);
        readln (datVC, strVC);
        readln (datVA, strVA);
        val (strVN, espN, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading ESP data in: '+dataFileN);
            crdft_finish
          end;
        val (strVC, espC, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading ESP data in: '+dataFileC);
            crdft_finish
          end;
        val (strVA, espA, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading ESP data in: '+dataFileA);
            crdft_finish
          end;
{calculating function and writing data into output file}
        covtNu := (1 - deltaN)*espN + deltaN*espC;
        covtEl := (1 - deltaN)*espN + deltaN*espA;
        eTotNu := covtNu + espN;
        eTotEl := covTEl - espN;
        writeln (datCTN, covtNu:15);
        writeln (datCTE, covtEl:15);
        writeln (datETN, eTotNu:15);
        writeln (datETE, eTotEl:15);
      end;
{closing input and output files}
    close (datVN);
    close (datVC);
    close (datVA);
    close (datCTN);
    close (datCTE);
    close (datETN);
    close (datETE);
    iml.infoMsg (0,1,name + 'Done.')
  end;   {covtCalc}

procedure fukuiPotCalc;
  const
    name = 'fukuiPotCalc';
  var
    datVN, datVC, datVA : Text;   {input text (ascii) files}
    datFPN, datFPE : Text;   {output files}
    strVN, strVA, strVC : String;   {string data read from input files}
    valVN, valVA, valVC : Real;   {input data transformed into real values}
    fukuiPotNu, fukuiPotEl : Real;   {to store calculated results}
    code: Word;   {evaluation of string to real transformations}

  begin
    iml.infoMsg (0,1,name+'Fukui potential calculation');
{openning electrostatic potential data files}
    assign (datVN, dataFileN);
{$I-} reset (datVN); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileN);
        crdft_finish
      end
    else
      iml.infoMsg (0,2,name + 'Reading ESP data from: ' + dataFileN);
    assign (datVC, dataFileC);
{$I-} reset (datVC); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileC);
        crdft_finish
      end
    else
      iml.infoMsg (0,2,name + 'Reading ESP data from: ' + dataFileC);
    assign (datVA, dataFileA);
{$I-} reset (datVA); {$I+}
    if IOresult <> 0 then
      begin
        iml.infoMsg (2,1,name + 'Error reading file: ' + dataFileA);
        crdft_finish
      end
    else
      iml.infoMsg (0,2,name + 'Reading ESP data from: ' + dataFileA);
{preparing output data file for the covalent term function}
    if outPrefix <> '' then
      begin
        fukuiPotNuName := outPrefix + fukuiPotNuName;
        fukuiPotElName := outPrefix + fukuiPotElName;
      end;
    iml.infoMsg (0,1,name+'preparing output files for Fukui potential '+
                 'functions '+fukuiPotNuName+' and '+fukuiPotElName+'.');
    assign (datFPN, fukuiPotNuName);
    rewrite (datFPN);
    assign (datFPE, fukuiPotElName);
    rewrite (datFPE);
{processing each data point}
    while not EoF(datVN) do
      begin
        readln (datVN, strVN);
        readln (datVC, strVC);
        readln (datVA, strVA);
        val (strVN, valVN, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading ESP data in: '+dataFileN);
            crdft_finish
          end;
        val (strVC, valVC, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading ESP data in: '+dataFileC);
            crdft_finish
          end;
        val (strVA, valVA, code);
        if code <> 0 then
          begin
            iml.infoMsg (2,1,name+'Error reading ESP data in: '+dataFileA);
            crdft_finish
          end;
{calculating function and writing data into output file}
        fukuiPotNu := valVC - valVN;
        fukuiPotEl := valVN - valVA;
        writeln (datFPN, fukuiPotNu:15);
        writeln (datFPE, fukuiPotEl:15);
      end;
    close (datVN);
    close (datVC);
    close (datVA);
    close (datFPN);
    close (datFPE);
  end;   {fukuiPotCalc}

procedure writeTclScript;
  begin
    
  end;

begin   {crdft}
  crdft_init;

  case plotFunction of
    'fukui' : fukuiCalc;
    'covt' : covtCalc;
    'fukuip' : fukuiPotCalc;
    else iml.infoMsg (0,1,crdft_name + ': Invalid option: ' + plotFunction);
    end;

  crdft_finish;
end.   {crdft}

