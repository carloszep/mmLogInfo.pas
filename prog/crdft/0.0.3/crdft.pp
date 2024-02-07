{
|-crdft.pp :
|  -freepascal program to process scalar fields from
|   _ electronic-structure calculations to plot
|   _ Density Functional Chemical Reactivity Theory functions .
|  -the program reads and writes scalar-field data in format
|   _ compatible to VMD calculated using the deMon2k program [ref] .
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
|    -Fukui potential plots :
|      -calculation of the Fukui potential functions .
|      -input data :
|        -electrostatic potential data of the neutral, anionic and cationic
|         _ species of a molecule [esp-N(r), esp-A(r), esp-C(r)] ;
|      -output :
|        -nucleophilic Fukui potential function [fp-(r)] .
|        -electrophilic Fukui potential function [fp+(r)] ;;;
|  -authors and contributors :
|    -Angel U. Orozco Valencia .
|    -Carlos Z. Gómez Castro :
|  -date :-2018-01-09.Tue ;
|  -version :-0.0.3 ;
|  -version information :
|    -changes to do or currently in progress :
|      -to read directly deMon2k output files to extract input data .
|      -tcl script output for ploting in VMD :
|        -pending initialization and finalization of the tcl object ;
|      -update command-line help (usage) .
|      -implement default parameters in external condText files ;
|    -changes done :
|      -procedure calc_SF_NAC deleted in this version (see v-0.0.2) .
|      -deleted functionality of the covalent term analysis (see v-0.0.2) .
|      -deMon2k PLOT ASCII output file are directly read and processed .
|      -each function is now calculated specifically in a single run ;
|    -finished version ;
|    -to do in future versions :
|      -to include specific help for each function command-line available .
|      -to link the 'crdft_finish' proc to infoMsg when an error arises ;
|  -helpCT :
|    -command-line usage :
|      -'crdft <function> [<parameter> <value> ...]' ;
|    -command-line parameters :
|      -<function> (parameter 1) :
|        -"fukuiNu", "f-" :
|          -calculates nucleophilic Fukui function [f-(r)] from
|           _ electron densities .
|          -considered parameters :
|            -rhoN, rhoC, fukuiNuName, demonOut, scriptName ;;
|        -"fukuiEl", "f+" :
|          -calculates electriphilic Fukui function [f+(r)] from
|           _ electron densities .
|          -considered parameters :
|            -rhoN, rhoA, fukuiElName, demonOut, scriptName ;;
|        -"dualDesc", "dual" :
|          -calculates dual-descriptor function [delta-f(r)] from
|           _ electron densities .
|          -considered parameters :
|            -rhoN, rhoC, rhoA, dualDescName, demonOut, scriptName ;;
|        -"fukuiPotNu", "fp-", "pf-", "potFukuiNu" :
|          -calculates nucleophilic Fukui potential from
|           _ electrostatic potentials .
|          -considered parameters :
|            -espN, espC, fukuiPotNuName, demonOut, scriptName ;;
|        -"fukuiPotEl", "fp+", "pf+", "potFukuiEl" :
|          -calculates nucleophilic Fukui potential from
|           _ electrostatic potentials .
|          -considered parameters :
|            -espN, espA, fukuiPotElName, demonOut, scriptName ;;
|        -"scalarField" :
|          -processes a deMon2k ASCII file with a scalar field function .
|          -considered parameters :
|            -scalarField, scalarFieldName, demonOut, scriptName ;;
|        -"script" :
|          -only generate VMD script to plot a scalar field .
|          -considers only a preprocessed scalar field ... .
|          -considered parameters :
|            -scalarField, xyzMolName, scriptName ;;;
|      -variable/optional parameters (parameter 2 onwards) :
|        -parameters for specifying ASCII data file names :
|          -"rhoN" :
|            -electron density of the neutral species of a molecule .
|            -default value :-"rhoN.asc" ;;
|          -"rhoA" :
|            -electron density of the anionic species of a molecule .
|            -default value :-"rhoA.asc" ;;
|          -"rhoC" :
|            -electron density of the cationic species of a molecule .
|            -default value :-"rhoC.asc" ;;
|          -"espN" :
|            -electrostatic potential of the neutral species of a molecule .
|            -default value :-"espN.asc" ;;
|          -"espA" :
|            -electrostatic potential of the anionic species of a molecule .
|            -default value :-"espA.asc" ;;
|          -"espC" :
|            -electrostatic potential of the cationic species of a molecule .
|            -default value :-"espC.asc" ;;
|          -"property", "prop", "molField", "scalarField" :
|            -generic scalar field .
|            -default value :-"<scalarField>.asc" ;;;
|        -parameters for specifying other input file names :
|          -"xyz", "mol", "molec", "molecule" :
|            -XYZ molecule file name .
|            -expected to correspond to the scalar fields .
|            -used only by the "script" function option .
|            -the value will be overwritten when processing the 'demonOut' .
|            -default value :-"molecule.xyz" ;;
|          -"demon", "demonOut" :
|            -deMon2k output file specifying PLOT lattice information .
|            -for 'scalarField' option, the name of the scalar field is taken .
|            -the XYZ coordinates are extracted from this except for the
|             _ "script" function option .
|            -default value :-"demon.out" ;;;
|        -parameters for output files :
|          -"prefix" :
|            -prefix prepended to all output files ;
|          -"tcl", "vmd", "script" :
|            -name of the output tcl file for plotting in VMD .
|            -default value :-"<function>.tcl" ;;;;;
}
//|  -{propertyRecord} :
{
|      -mark :-extense ;
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
|    -Fukui potential function ... :
|      - ;;
|  -bibliography :
|    - ;
|  -uses :
|    -Sysutils .
|    -StrUtils .
|    -ioDrv .
|    -condText ;
|  -program constants :
|    -crdft_name :-string for program name ;
|    -crdft_version :-string with the program version number ;;
|  -program types :
|    -t_arg2RfuncR :
|      -procedural type for a Real-type function with 2 real arguments ;
|    -t_arg3RfuncR :
|      -procedural type for a Real-type function with 3 real arguments ;;
|  -program variables :
|    -iml :-object for managing the output log information .
|    -tcl :-output object to write a tcl script for VMD ;
|    -userParamFile :-*** decidir tipo de archivo y función *** ;
|    -plotFunction :-flag specifying the plot to perform .
|      -for the moment is specified by the number of arguments ;
|    -datRhoN, datRhoA, datRhoC, datEspN, datEspA, datEspC :
|      -name of the data files containing the electron density or electrostatic
|     _ potential of the neutral, anionic, and cationic species ;
|    -datScalarField :-data file name for a generic scalar field ;
|    -fukuiNuName :-name for output nucleophilic Fukui function data file .
|      -default value :-"fukuiNu.asc" ;;
|    -datFukuiEl :-name for output electrphilic Fukui function data file .
|      -default value :-"fukuiEl.asc" ;;
|    -datDualDesc :-name for output Dual-Descriptor function data file .
|      -default value :-"dualDesc.asc" ;;
|    -datFukuiPotNu :
|      -name for output nucleophilic Fukui-Potential function data file .
|      -default value :-"fukuiPotNu.asc" ;;
|    -datFukuiPotEl :
|      -name for output electrophilic Fukui-Potential function data file .
|      -default value :-"fukuiPotEl.asc" ;;
|    -xyzMolName :-name of the XYZ file of a molecule .
|      -the molecule is expected to correspond to the scalar fields .
|      -default value :-"molecule.xyz" ;;
|    -outPrefix :-prefix prepended to output file names .
|      -default value :-"" ;;
|    -scriptName :-name of the output file containing VMD tcl script .
|      -default value :-"<function>.tcl" ;
|    -demonOut :
|      -name of the deMon2k output file .
|      -data extracted ... :
|        -lattice data .-scalar field (property) name .-xyz coordinates ;
|      -notes :
|        -the properties calculated with deMon2k have to be requested as
|         _ ASCII output in an external data file :
|          -i.e. use deMon2k keyword 'PLOT RHO ASCII' ;
|        -see deMon2k user's guide ;;
|      -default value :-"demon.out" ;;
|    -writeInpData :
|      -flag to specify whether or not the processed input raw data should
|       _ be written in ascii files .
|      -note: this is necessary to plot the input scalar fields using
|       _ the 'script' option .
|      -default value :-'True' ;;
|    -propName :
|      -short name specifying the property plotted by 'script' option ;;;
|  -procedures and functions :
|    -crdft_finish :-finalizes the program ;
|    -crdft_init :-initializes the program ;
|    -fukuiCalc :-calculates fukui functions from density data ;
|    -fukuiPotCalc :-calculates Fukui-potential functions ;
|    -crdftFuncCalc :-calculates different crdft functions ;;;
}
program crdft;

uses
  SysUtils, StrUtils, ioDrv, condText;

const
  crdft_name = 'crdft';
  crdft_version = '0.0.3';

var
  iml : obj_infoMsg;
{  tcl : obj_output; }
  plotFunction : String;
  datRhoN, datRhoA, datRhoC, datEspN, datEspA, datEspC : String;
  datScalarField : String;
  demonOut, xyzMolName, outPrefix, scriptName, propName : String;
  writeInpData : Boolean;

procedure crdft_finish;
  begin
    if iml.getError then WriteLn ('Fatal Error. No calculation was performed.');
    iml.infoMsg (0,2,crdft_name+'_finish: unlinking condText log file.');
    CTlog.unlinkExtDev;
    iml.infoMsg (0,1,crdft_name+'_finish: ending program...');
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
    name = crdft_name+'_init: ';

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
      writeln ('    '+crdft_name+' <function> [<parameter> <value> ...]');
      writeln;
      writeln ('  Available functions:');
      writeln ('    [1] "fukuiNu" or "f-" ( = rhoN - rhoC)');
      writeln ('    [2] "fukuiEl" or "f+" ( = rhoA - rhoN)');
      writeln ('    [3] "dualDesc" or "dual" ' +
                         '( = f+ - f- = rhoA - 2*rhoN + rhoC)');
      writeln ('    [4] "fukuiPotNu" or "fp-" ( = espC - espN)');
      writeln ('    [5] "fukuiPotEl" or "fp+" ( = espN - espA)');
      writeln ('    [6] "scalarField" (*unfinished*)');
      writeln ('    [7] "script" (*unfinished*)');
      writeln ('    [8] "-h", "--help", "--helpCT"');
      writeln;
      writeln ('  Valid variable/optional input parameters (default value):');
      writeln ('    "-rhoN <ascii_file>" (rhoN.asc)');
      writeln ('    "-rhoA <ascii_file>" (rhoA.asc)');
      writeln ('    "-rhoC <ascii_file>" (rhoC.asc)');
      writeln ('    "-espN <ascii_file>" (espN.asc)');
      writeln ('    "-espA <ascii_file>" (espA.asc)');
      writeln ('    "-espC <ascii_file>" (espC.asc)');
      writeln ('    "-prop <ascii_file>" (scalarField.asc)');
      writeln ('    "-xyz <file>" or "-molecule <file>" (molecule.xyz)');
      writeln ('    "-demon <file>" or "-demonOut <file>" (demon.out)');
      writeln;
      writeln ('  Valid variable/optional output parameters (default value):');
      writeln ('    "-prefix <string>" ("")');
      writeln ('    "-tcl <file>", "-vmd <file>", or "-script <file>" ' +
                   '(<function>.tcl)');
      writeln ('    ...');
      writeln;
      writeln ('  Notes:');
      writeln ('    -Input scalar fields calculated by the deMon2k program ');
      writeln ('     (i.e. keyword "PLOT RHO ASCII").');
      writeln ('    -A log file "log_'+crdft_name+'.log" is created each run.');
      writeln ('    -The specified "prefix" is prepended to all output files.');
      writeln;
      crdft_finish
    end;   {printHelp}

  procedure defaultParam;
    begin
      iml.infoMsg (0,1,name+'setting up default parameters.');
{default input parameters}
      datRhoN := 'rhoN.asc';
      datRhoA := 'rhoA.asc';
      datRhoC := 'rhoC.asc';
      datEspN := 'espN.asc';
      datEspA := 'espA.asc';
      datEspC := 'espC.asc';
      demonOut := 'demon.out';
      xyzMolName := 'molecule.xyz';
      iml.infoMsg (0,2,name+'datRhoN: Default file name: ' + datRhoN);
      iml.infoMsg (0,2,name+'datRhoA: Default file name: ' + datRhoA);
      iml.infoMsg (0,2,name+'datRhoC: Default file name: ' + datRhoC);
      iml.infoMsg (0,2,name+'datEspN: Default file name: ' + datEspN);
      iml.infoMsg (0,2,name+'datEspA: Default file name: ' + datEspA);
      iml.infoMsg (0,2,name+'datEspC: Default file name: ' + datEspC);
      iml.infoMsg (0,2,name+'demonOut: Default file name: ' + demonOut);
      iml.infoMsg (0,2,name+'xyzMolName: Default file name: ' + xyzMolName);
{default output parameters}
      scriptName := 'script.tcl';
      outPrefix := '';
      iml.infoMsg (0,2,name+'scriptName: default file name: ' + scriptName);
      iml.infoMsg (0,2,name+'outPrefix: default value: ""');
{default program flags}
      plotFunction := '';
      writeInpData := True;
      propName := '';
      iml.infoMsg (0,2,name+'plotFunction: default value: ""');
      iml.infoMsg (0,2,name+'writeInpData: default value: True');
      iml.infoMsg (0,2,name+'propName: default value: ""');
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
      p : Byte;
      helpCT : obj_condText;

    begin
      strTmp := ParamStr(0);
      for p := 1 to ParamCount do strTmp := strTmp + ' ' + ParamStr(p);
      iml.infoMsg (0,1,name + 'Command line: ' + strTmp);
      str (ParamCount, strTmp);
      iml.infoMsg (0,2,name + 'ParamCount: ' + strTmp);
{checking <function> option}
      case upCase(ParamStr(1)) of
        'FUKUINU', 'F-' : plotFunction := 'fukuiNu';
        'FUKUIEL', 'F+' : plotFunction := 'fukuiEl';
        'DUALDESC', 'DUAL' : plotFunction := 'dualDesc';
        'FUKUIPOTNU', 'FP-', 'PF-', 'POTFUKUINU' : plotFunction := 'fukuiPotNu';
        'FUKUIPOTEL', 'FP+', 'PF+', 'POTFUKUIEL' : plotFunction := 'fukuiPotEl';
        'SCALARFIELD' : plotFunction := 'scalarField';
        'SCRIPT', 'TCLSCRIPT','VMDSCRIPT' : plotFunction := 'script';
        '-H', 'H', 'HELP' : printHelp;   {and exits, the log file is created}
        '--HELPCT', '--HELP':
          begin   {provisional}
            iml.infoMsg (0,1,name+'loading help from condText file...');
            helpCT.init;
//            iml.setOutputLevel (c_outLvl_moderated);
            helpCT.open ('crdft.pp','I');
            helpCT.print (helpCT.findTextRec(nil, 'helpCT'), 1, 0, 1, 1, '');
//            iml.setOutputLevel (c_outLvl_detailed);
            helpCT.finish;
            iml.clearError;
            crdft_finish
          end;
        else
          begin
            iml.infoMsg (2,1,name+'Invalid option: '+ParamStr(1)+'; try -h.');
            writeln ('Invalid option: '+ParamStr(1)+'; try -h.');
            crdft_finish
          end
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
            'RHON' : 
              begin
                if (plotFunction = 'fukuiPotNu') or
                   (plotFunction = 'fukuiPotEl') then
                  begin
                    iml.infoMsg (2,1,name+'rhoN is not used by this function.');
                    crdft_finish
                  end;
                propName := 'rhoN';
                datRhoN := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for rho (neutral): '+datRhoN)
              end;
            'RHOA' :
              begin
                if (plotFunction = 'fukuiNu') or
                   (plotFunction = 'fukuiPotNu') or
                   (plotFunction = 'fukuiPotEl') then
                  begin
                    iml.infoMsg (2,1,name+'rhoA is not used by this function.');
                    crdft_finish
                  end;
                propName := 'rhoA';
                datRhoA := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for rho (anionic): '+datRhoA)
              end;
            'RHOC' :
              begin
                if (plotFunction = 'fukuiEl') or
                   (plotFunction = 'fukuiPotNu') or
                   (plotFunction = 'fukuiPotEl') then
                  begin
                    iml.infoMsg (2,1,name+'rhoC is not used by this function.');
                    crdft_finish
                  end;
                propName := 'rhoC';
                datRhoC := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for rho (cationic): '+datRhoC)
              end;
            'ESPN' :
              begin
                if (plotFunction = 'fukuiNu') or
                   (plotFunction = 'fukuiEl') or
                   (plotFunction = 'dualDesc') then
                  begin
                    iml.infoMsg (2,1,name+'espN is not used by this function.');
                    crdft_finish
                  end;
                propName := 'espN';
                datEspN := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for ESP (neutral): '+datEspN)
              end;
            'ESPA' :
              begin
                if (plotFunction = 'fukuiNu') or
                   (plotFunction = 'fukuiEl') or
                   (plotFunction = 'dualDesc') or
                   (plotFunction = 'fukuiPotNu') then
                  begin
                    iml.infoMsg (2,1,name+'espA is not used by this function.');
                    crdft_finish
                  end;
                propName := 'espA';
                datEspA := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for ESP (anionic): '+datEspA)
              end;
            'ESPC' :
              begin
                if (plotFunction = 'fukuiNu') or
                   (plotFunction = 'fukuiEl') or
                   (plotFunction = 'dualDesc') or
                   (plotFunction = 'fukuiPotEl') then
                  begin
                    iml.infoMsg (2,1,name+'espC is not used by this function.');
                    crdft_finish
                  end;
                propName := 'espC';
                datEspC := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for ESP (cationic): '+
                                 datEspC)
              end;
            'PROPERTY' ,'PROP', 'MOLFIELD', 'SCALARFIELD' :
              begin
                if (plotFunction <> 'scalarField') and
                   (plotFunction <> 'script') then
                  begin
                    iml.infoMsg(2,1,name+'property not used by this function.');
                    crdft_finish
                  end;
                 if plotFunction = 'script' then
                   propName := 'molProp'
                 else
                   propName := '';
                datScalarField := ParamStr(p+1);
                iml.InfoMsg(0,1,name+'molec field data file name: ' +
                                     datScalarField)
              end;
            'XYZ', 'MOL', 'MOLEC', 'MOLECULE' :
              begin
                if plotFunction <> 'script' then
                  begin
                    iml.infoMsg (2,1,name+'XYZ not used by this function.');
                    crdft_finish
                  end;
                xyzMolName := ParamStr(p+1);
                iml.InfoMsg (0,1,name+'XYZ molecule file name: '+xyzMolName)
              end;
            'PREFIX', 'OUTPREFIX' :
              begin
                outPrefix := ParamStr(p+1);
                iml.InfoMsg (0,1,name+'prefix for output files: '+outPrefix)
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

    end;   {checkCLParam}

  procedure specifiedParam;
    begin
      case plotFunction of
        'fukuiNu' :
          begin
          end;
        'fukuiEl' :
          begin
          end;
        'dualDesc' :
          begin
          end;
        'fukuiPotNu' :
          begin
          end;
        'fukuiPotEl' :
          begin
          end;
        'scalarField' :
          begin
          end;
        'script' :
          begin
          end;
        else ;
        end;
    end;   {specifiedParam}

  begin   {crdft_init}
    if ParamCount = 0 then printHelp;   {and exits, no log file is created}
    logFileInit;
    defaultParam;
    checkCLParam;
    specifiedParam;
  end;   {crdft_init}


function fukuiNu (rhoN, rhoC : Real) : Real;
    begin
      fukuiNu := rhoN - rhoC
    end;

  function fukuiEl (rhoN, rhoA : Real) : Real;
    begin
      fukuiEl := rhoA - rhoN
    end;

  function dualDesc (rhoN, rhoA, rhoC : Real) : Real;
    begin
      dualDesc := rhoA - 2*rhoN + rhoC
    end;

  function fukuiPotNu (espN, espC : Real) : Real;
    begin
      fukuiPotNu := espC - espN
    end;

  function fukuiPotEl (espN, espA : Real) : Real;
    begin
      fukuiPotEl := espN - espA
    end;


{|-procedure crdftFuncCalc; :
 |  - ;|}
procedure crdftFuncCalc;
  const
    name = 'crdftFuncCalc: ';

  type
    t_arg2RfuncR = Function (Arg1, Arg2 : Real) : Real;
    t_arg3RfuncR = Function (Arg1, Arg2, Arg3 : Real) : Real;

  var
    crdftFunc2 : t_arg2RfuncR;
    crdftFunc3 : t_arg3RfuncR;

  Function crdftCalc (func : t_arg2RfuncR; arg1, arg2 : Real): real; overload;
    begin
      crdftCalc := func(arg1, arg2);
    end;

  Function crdftCalc (func: t_arg3RfuncR; arg1,arg2,arg3: Real): Real; overload;
    begin
      crdftCalc := func(arg1, arg2, arg3);
    end;

  procedure funcCalc;
    var
      inpDat1, inpDat2, inpDat3, outDat : Text;
      inpVal1, inpVal2, inpVal3, outVal : Real;
      inpOutDat1, inpOutDat2, inpOutDat3 : Text;
      strLine, strVal : String;
      code : Word;
      i : Byte;

    begin
{preparing input and output files}
      if (plotFunction = 'fukuiNu') or (plotFunction = 'fukuiEl') or
         (plotFunction = 'dualDesc') then
        begin
          iml.infoMsg (0,2,name+'Reading rhoN data from: ' + datRhoN);
          Assign (inpDat1, datRhoN);
          if writeInpData then
            begin
              iml.infoMsg (0,2,name+'Writting rhoN data to file: ' +
                                    outPrefix + 'rhoN_p.asc.');
              Assign (inpOutDat1, outPrefix + 'rhoN_p.asc')
            end;
          if (plotFunction = 'fukuiEl') or (plotFunction = 'dualDesc') then
            begin
              iml.infoMsg (0,2,name+'Reading rhoA data from: ' + datRhoA);
              Assign (inpDat2, datRhoA);
              if writeInpData then
                begin
                  iml.infoMsg (0,2,name+'Writting rhoA data to file: ' +
                                    outPrefix + 'rhoA_p.asc.');
                  Assign (inpOutDat2, outPrefix + 'rhoA_p.asc')
                end
            end;
          if (plotFunction = 'fukuiNu') or (plotFunction = 'dualDesc') then
            begin
              iml.infoMsg (0,2,name+'Reading rhoC data from: ' + datRhoC);
              if plotFunction = 'fukuiNu' then
                Assign (inpDat2, datRhoC)
              else   {plotFunction = dualDesc}
                Assign (inpDat3, datRhoC);
              if writeInpData then
                begin
                  iml.infoMsg (0,2,name+'Writting rhoC data to file: ' +
                                    outPrefix + 'rhoC_p.asc.');
                  if plotFunction = 'fukuiNu' then
                    Assign (inpOutDat2, outPrefix + 'rhoC_p.asc.')
                  else   {plotFunction = dualDesc}
                    Assign (inpOutDat3, outPrefix + 'rhoC_p.asc.')
                end
            end
        end
      else   {fukuiPot functions}
        begin
          iml.infoMsg (0,2,name+'Reading espN data from: ' + datEspN);
          Assign (inpDat1, datEspN);
          if writeInpData then
            begin
              iml.infoMsg (0,2,name+'Writting espN data to file: ' +
                                    outPrefix + 'espN_p.asc.');
              Assign (inpOutDat1, outPrefix + 'espN_p.asc')
            end;
          if plotFunction = 'fukuiPotNu' then
            begin
              iml.infoMsg (0,2,name+'Reading espC data from: ' + datEspC);
              Assign (inpDat2, datEspC);
              if writeInpData then
                begin
                  iml.infoMsg (0,2,name+'Writting espC data to file: ' +
                                    outPrefix + 'espC_p.asc.');
                  Assign (inpOutDat2, outPrefix + 'espC_p.asc')
                end
            end
          else   {plotFunction = fukuiPotEl}
            begin
              iml.infoMsg (0,2,name+'Reading espA data from: ' + datEspA);
              Assign (inpDat2, datEspA);
              if writeInpData then
                begin
                  iml.infoMsg (0,2,name+'Writting espA data to file: ' +
                                    outPrefix + 'espA_p.asc.');
                  Assign (inpOutDat2, outPrefix + 'espA_p.asc')
                end
            end
        end;
{selecting function}
      case plotFunction of
        'fukuiNu' :
          begin
            iml.infoMsg (0,2,name+'Writting Fukui-Nucleophilic data to file: '
                                 + outPrefix + 'fukuiNu.asc');
            Assign (outDat, outPrefix + 'fukuiNu.asc');
            crdftFunc2 := @fukuiNu
          end;
        'fukuiEl' :
          begin
            iml.infoMsg (0,2,name+'Writting Fukui-Electrophilic data to file: '
                                 + outPrefix + 'fukuiEl.asc');
            Assign (outDat, outPrefix + 'fukuiEl.asc');
            crdftFunc2 := @fukuiEl
          end;
        'dualDesc' :
          begin
            iml.infoMsg (0,2,name+'Writting Dual-Descriptor data to file: '
                                 + outPrefix + 'dualDesc.asc');
            Assign (outDat, outPrefix + 'dualDesc.asc');
            crdftFunc3 := @dualDesc
          end;
        'fukuiPotNu' :
          begin
            iml.infoMsg(0,2,name+'Writting FukuiPot-Nucleophilic data to file: '
                                 +  outPrefix + 'fukuiPotNu.asc');
            Assign (outDat, outPrefix + 'fukuiPotNu.asc');
            crdftFunc2 := @fukuiPotNu
          end;
        'fukuiPotEl' :
          begin
            iml.infoMsg(0,2,name+'Writting FukuiPot-Electrophilic data ' +
                                 'to file: ' +  outPrefix + 'fukuiPotEl.asc');
            Assign (outDat, outPrefix + 'fukuiPotEl.asc');
            crdftFunc2 := @fukuiPotEl
          end;
        end;
{check input files}
        iml.infoMsg (0,2,name+'opening input files.');
{$I-}   Reset (inpDat1); {$I+}
        if IOresult <> 0 then
          begin
            iml.infoMsg (2,1,name + 'reading input file.');
            crdft_finish
          end;
{$I-}   Reset (inpDat2); {$I+}
        if IOresult <> 0 then
          begin
            iml.infoMsg (2,1,name + 'reading input file.');
            crdft_finish
          end;
        if plotFunction = 'dualDesc' then
          begin
{$I-}       Reset (inpDat3); {$I+}
            if IOresult <> 0 then
              begin
                iml.infoMsg (2,1,name + 'reading input file.');
                crdft_finish
              end
          end;
{check output files}
{$I-}   Rewrite (outDat); {$I+}
        if IOresult <> 0 then
          begin
            iml.infoMsg (2,1,name + 'preparing output file.');
            crdft_finish
          end;
        if writeInpData then
          begin
{$I-}       Rewrite (inpOutDat1); {$I+}
            if IOresult <> 0 then
              begin
                iml.infoMsg (2,1,name + 'preparing output file.');
                crdft_finish
              end;
{$I-}       Rewrite (inpOutDat2); {$I+}
            if IOresult <> 0 then
              begin
                iml.infoMsg (2,1,name + 'preparing output file.');
                crdft_finish
              end;
            if plotFunction = 'dualDesc' then
              begin
{$I-}           Rewrite (inpOutDat3); {$I+}
                if IOresult <> 0 then
                  begin
                    iml.infoMsg (2,1,name + 'preparing output file.');
                    crdft_finish
                  end
              end
          end;
{skipping four header lines in deMon2k output}
        for i := 1 to 4 do
          begin
            ReadLn (inpDat1, strLine);
            ReadLn (inpDat2, strLine);
            if plotFunction = 'dualDesc' then ReadLn (inpDat3, strLine)
          end;
{performing calculation for each data point}
        While not EoF(inpDat1) do
          begin
            ReadLn (inpDat1, strLine);
            strVal := ExtractWord (4, strLine, [' ']);
            Val (strVal, inpVal1, code);
            if code <> 0 then
              begin
                iml.infoMsg (2,1,name+'during data conversion.');
                crdft_finish
              end;
            if writeInpData then WriteLn (inpOutDat1, strVal);
            ReadLn (inpDat2, strLine);
            strVal := ExtractWord (4, strLine, [' ']);
            Val (strVal, inpVal2, code);
            if code <> 0 then
              begin
                iml.infoMsg (2,1,name+'during data conversion.');
                crdft_finish
              end;
            if writeInpData then WriteLn (inpOutDat2, strVal);
            if plotFunction = 'dualDesc' then
              begin
                ReadLn (inpDat3, strLine);
                strVal := ExtractWord (4, strLine, [' ']);
                Val (strVal, inpVal3, code);
                if code <> 0 then
                  begin
                    iml.infoMsg (2,1,name+'during data conversion.');
                    crdft_finish
                  end;
                if writeInpData then WriteLn (inpOutDat3, strVal);
              end;
{calling function}
            if plotFunction = 'dualDesc' then
              outVal := crdftCalc (crdftFunc3, inpVal1, inpVal2, inpVal3)
            else
              outVal := crdftCalc (crdftFunc2, inpVal1, inpVal2);
            WriteLn (outDat, outVal:15);
          end;
{closing data text files}
      close (inpDat1);
      close (inpDat2);
      if plotFunction = 'dualDesc' then close (inpDat3);
      close (outDat);
      if writeInpData then
        begin
          close (inpOutDat1);
          close (inpOutDat2);
          if plotFunction = 'dualDesc' then close (inpOutDat3)
        end
    end;   {funcCalc}

  begin   {crdftFuncCalc}
    iml.infoMsg (0,2,name+'Calculating CRDFT function.');
    iml.infoMsg (0,3,name+'plotFunction flag: ' + plotFunction);
    funcCalc;
    iml.infoMsg (0,2,name+'CRDFT function calculation done.');
  end;   {crdftFuncCalc}


procedure writeTclScript;
  begin
    
  end;

begin   {crdft}
  crdft_init;

  case plotFunction of
    'fukuiNu','fukuiEl','dualDesc','fukuiPotNu','fukuiPotEl': crdftFuncCalc;
    'scalarField', 'script' : ;
    else iml.infoMsg (0,1,crdft_name + ': Invalid option: ' + plotFunction);
    end;

  crdft_finish;
end.   {crdft}

