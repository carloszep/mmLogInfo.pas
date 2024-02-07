{
|-crdft.pp :
|  -freepascal program to process scalar fields from
|   _ electronic-structure calculations to plot
|   _ Density Functional Chemical Reactivity Theory functions .
|  -the program reads and writes scalar-field data in format
|   _ compatible to VMD calculated using the deMon2k program [ref] .
|  -program series continues from fukuiData v-0.0.3 .
|  -functionality :
|    -Fukui function and dual descriptor plots :
|      -calculation Fukui's functions from electron density data .
|      -input data :-electron density of the neutral, anionic and cationic
|       _ species of a molecule [rho-N(r), rho-A(r) and rho-C(r)] ;
|      -available functions to plot :
|        -nucleophilic Fukui function [f-(r)] .
|        -electrophilic fukui function [f+(r)] .
|        -dual descriptor function [delta-f(r)] ;;
|    -Fukui potential plots :
|      -calculation of the Fukui potential functions .
|      -input data :
|        -electrostatic potential data of the neutral, anionic and cationic
|         _ species of a molecule [esp-N(r), esp-A(r), esp-C(r)] ;
|      -available functions to plot :
|        -nucleophilic Fukui potential function [fp-(r)] .
|        -electrophilic Fukui potential function [fp+(r)] ;;;
|  -authors and contributors :
|    -Angel U. Orozco Valencia .
|    -Carlos Z. Gómez Castro :
|  -date :-2018-01-11.Tue ;
|  -version :-0.0.4 ;
|  -version information :
|    -changes done :
|      -'prop' functionality added to crdftFuncCalc .
|      -'script' functionality added for all functions .
|      -generic representations for molecule and isosurface added ;
|    -to do in future versions :
|      -add in the tcl script the command 'cd $PWD' or add paths to files .
|      -to link the 'crdft_finish' proc to infoMsg when an error arises .
|      -to incorporate default visualization set up for each function .
|      -to implement analyses of atoms-condensed properties .
|      -to implement operations on the raw property data (i.e. scaling etc.) .
|      -to implement property-specific command-line help, usage and examples .
|      -allow reading parameters from external condText or config files ;
|    -finished version ;
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
|        -"molProp", "scalarField", "property", "prop" :
|          -processes a deMon2k ASCII file with a molecular property .
|          -considered parameters :
|            -propName, demonOut, scriptName ;;
|        -"script", "vmdPlot" :
|          -only generate VMD script to plot a molecular property .
|          -considers only a preprocessed scalar field ... .
|          -considered parameters :
|            -scalarField, xyzMolName, scriptName ;;
|        -"-h", "h" :-shows brief command-line help ;
|        -"--help", "--helpCT", "help", "helpCT" :
|          -shows the condText information contained in the source code file .
|          -the text file crdft.pp have to be available in the running dir ;;
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
|            -default value :-"<scalarField>.asc" ;;
|          -"propName" :
|            -name used to identify a molecular property (scalar field) .
|            -default value :-"prop" ;;
|          -"demon", "demonOut", "deMon2k" :
|            -deMon2k output file specifying PLOT lattice information .
|            -the name of the scalar field is taken if it is not specified .
|            -the XYZ coordinates are extracted from this .
|            -default value :-"demon.out" ;;;
|        -parameters for output files :
|          -"prefix", "outPrefix" :
|            -prefix prepended to all output files .
|            -default value :-"" ;;
|          -"xyz", "molecule" :
|            -output XYZ molecule file name .
|            -coordinates extracted from the deMon2k output file .
|            -default value :-"mol.xyz" ;;
|          -"tcl", "vmd", "script" :
|            -name of the output tcl file for plotting in VMD .
|            -default value :-"vmdPlot.tcl" ;;;;;
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
|    -datProp :
|      -data file name for a preprocessed generic scalar field .
|      -used to store the output calculated molecular property .
|      -default value :-"<proNamep>_p.asc" ;;
|    -datDemonProp :
|      -data file name of a raw generic scalar field in deMon2k format .
|      -default value :-"prop.asc" ;;
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
|      -default value :-"vmdPlot.tcl" ;
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
|    -writeTclScrip :
|      -flag to specify whether or not the Tcl script for plotting with VMD
|       _ will be created .
|      -note: the crdft function may be calculated and plotted manually .
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
  crdft_version = '0.0.4';

var
  iml : obj_infoMsg;
{  tcl : obj_output; }
  plotFunction : String;
  datRhoN, datRhoA, datRhoC, datEspN, datEspA, datEspC : String;
  datProp, datDemonProp : String;
  demonOut, xyzMolName, outPrefix, scriptName, propName : String;
  writeInpData, writeTclScript : Boolean;

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
      writeln (crdft_name + '-v.' + crdft_version + ': Writes a tcl script ' +
        'with deMon2k CRDFT molec. properties for plotting in VMD.');
      writeln;
      writeln ('  Usage: ');
      writeln ('    ./'+crdft_name +' <property> [<parameter> <value> ...]');
      writeln;
      writeln ('  Available molecular properties:');
      writeln ('    [1] "fukuiNu" or "f-"        ( = rhoN - rhoC )');
      writeln ('    [2] "fukuiEl" or "f+"        ( = rhoA - rhoN )');
      writeln ('    [3] "dualDesc" or "dual"     ' +
                                       '( = f+ - f- = rhoA - 2*rhoN + rhoC )');
      writeln ('    [4] "fukuiPotNu" or "fp-"    ( = espC - espN )');
      writeln ('    [5] "fukuiPotEl" or "fp+"    ( = espN - espA )');
      writeln ('    [6] "molProp" or "scalarField"');
      writeln ('    [7] "script" or "vmdPlot"');
      writeln ('    [8] "-h", "--help", "--helpCT"');
      writeln;
      writeln ('  Optional input parameters (default value) [used by prop]:');
      writeln ('    "-demon <file>" or "-demonOut <file>" (demon.out) [1-7]');
      writeln ('    "-rhoN <ascii_file>" (rhoN.asc) [1-3]');
      writeln ('    "-rhoA <ascii_file>" (rhoA.asc) [2,3]');
      writeln ('    "-rhoC <ascii_file>" (rhoC.asc) [1,3]');
      writeln ('    "-espN <ascii_file>" (espN.asc) [4,5]');
      writeln ('    "-espA <ascii_file>" (espA.asc) [5]');
      writeln ('    "-espC <ascii_file>" (espC.asc) [4]');
      writeln ('    "-propFile <ascii_file>" (prop.asc) [6,7]');
      writeln ('    "-propName <string>" ("prop") [6,7]');
      writeln;
      writeln ('  Optional parameters for output:');
      writeln ('    "-prefix <string>" ("") [1-7]');
      writeln ('    "-tcl <file>", "-vmd <file>", or "-script <file>" ' +
                                                        '(vmdPlot.tcl) [1-7]');
      writeln ('    "-xyz <file>" or "-molecule <file>" (mol.xyz) [1-7]');
      writeln;
      writeln ('  Notes:');
      writeln ('    -A log file "log_'+crdft_name+'.log" is written each run.');
      writeln ('    -Input molecular properties calculated by the program');
      writeln ('     deMon2k (i.e. keyword "PLOT RHO ASCII").');
      writeln ('    -A deMon2k output file with molec. prop. lattice info is');
      writeln ('     mandatory to create tcl scripts (-demon parameter).');
      writeln ('    -The specified "prefix" is prepended to all output files.');
      writeln ('    -After running, run "vmd -e <script>.tcl" to plot.');
      writeln ('     Alternatively, open VMD and run in the console ' +
                                                     '"source <script>.tcl".');
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
      datDemonProp := 'prop.asc';
      demonOut := 'demon.out';
      iml.infoMsg (0,2,name+'datRhoN: Default file name: ' + datRhoN);
      iml.infoMsg (0,2,name+'datRhoA: Default file name: ' + datRhoA);
      iml.infoMsg (0,2,name+'datRhoC: Default file name: ' + datRhoC);
      iml.infoMsg (0,2,name+'datEspN: Default file name: ' + datEspN);
      iml.infoMsg (0,2,name+'datEspA: Default file name: ' + datEspA);
      iml.infoMsg (0,2,name+'datEspC: Default file name: ' + datEspC);
      iml.infoMsg (0,2,name+'datDemonProp: Default file name: ' + datDemonProp);
      iml.infoMsg (0,2,name+'demonOut: Default file name: ' + demonOut);
{default output parameters}
      scriptName := 'vmdPlot.tcl';
      outPrefix := '';
      xyzMolName := 'mol.xyz';
      iml.infoMsg (0,2,name+'scriptName: default file name: ' + scriptName);
      iml.infoMsg (0,2,name+'outPrefix: default value: ""');
      iml.infoMsg (0,2,name+'xyzMolName: Default file name: ' + xyzMolName);
{default program flags}
      plotFunction := '';
      writeInpData := True;
      writeTclScript := True;
      propName := 'prop';
      iml.infoMsg (0,2,name+'plotFunction: default value: ""');
      iml.infoMsg (0,2,name+'writeInpData: default value: True');
      iml.infoMsg (0,2,name+'writeTclScript: default value: True');
      iml.infoMsg (0,2,name+'propName: default value: ' + propName);
    end;   {defaultParam}

  procedure readExtParam (fileName : String);
    begin
      iml.infoMsg (0,2,name+'looking for external user parameters file.');
      {*** pendiente ***}
    end;   {readExtParam}

  procedure writeExternalParam (fileName : String);
    begin
      iml.infoMsg (0,2,name+'writing external user parameters file.');
      {*** pendiente ***}
    end;   {writeExtParam}

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
        'MOLPROP', 'SCALARFIELD', 'PROPERTY', 'PROP' : plotFunction := 'prop';
        'SCRIPT', 'VMDPLOT' : plotFunction := 'script';
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
                if (plotFunction <> 'fukuiNu') and
                   (plotFunction <> 'fukuiEl') and
                   (plotFunction <> 'dualDesc') then
                  begin
                    iml.infoMsg (3,1,name+'rhoN: unused by: '+plotFunction);
                    crdft_finish
                  end;
                datRhoN := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for rho (neutral): '+datRhoN)
              end;
            'RHOA' :
              begin
                if (plotFunction <> 'fukuiEl') and
                   (plotFunction <> 'dualDesc') then
                  begin
                    iml.infoMsg (2,1,name+'rhoA: unused by: '+plotFunction);
                    crdft_finish
                  end;
                datRhoA := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for rho (anionic): '+datRhoA)
              end;
            'RHOC' :
              begin
                if (plotFunction <> 'fukuiNu') and
                   (plotFunction <> 'dualDesc') then
                  begin
                    iml.infoMsg (2,1,name+'rhoC: unused by: '+plotFunction);
                    crdft_finish
                  end;
                datRhoC := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for rho (cationic): '+datRhoC)
              end;
            'ESPN' :
              begin
                if (plotFunction <> 'fukuiPotNu') and
                   (plotFunction <> 'fukuiPotEl') then
                  begin
                    iml.infoMsg (2,1,name+'espN: unused by: '+plotFunction);
                    crdft_finish
                  end;
                datEspN := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for ESP (neutral): '+datEspN)
              end;
            'ESPA' :
              begin
                if (plotFunction <> 'fukuiPotEl') then
                  begin
                    iml.infoMsg (2,1,name+'espA: unused by: '+plotFunction);
                    crdft_finish
                  end;
                datEspA := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for ESP (anionic): '+datEspA)
              end;
            'ESPC' :
              begin
                if (plotFunction <> 'fukuiPotNu') then
                  begin
                    iml.infoMsg (2,1,name+'espC: unused by: '+plotFunction);
                    crdft_finish
                  end;
                datEspC := ParamStr(p+1);
                iml.infoMsg (0,1,name+'data file for ESP (cationic): '+
                                 datEspC)
              end;
            'DEMON', 'DEMONOUT', 'DEMON2K' :
              begin
                demonOut := ParamStr(p+1);
                iml.infoMsg (0,1,name+'deMon2k output file: '+demonOut)
              end;
            'PROPFILE' :
              begin
                if (plotFunction <> 'prop') and (plotFunction <> 'script') then
                  begin
                    iml.infoMsg(2,1,name+'propFile: unused by: '+plotFunction);
                    crdft_finish
                  end;
                if plotFunction = 'script' then
                  datProp := ParamStr(p+1)
                else
                  datDemonProp := ParamStr(p+1);
                iml.InfoMsg(0,1,name+'mol prop data file name: '+datDemonProp)
              end;
            'PROPNAME' :
              begin
                if (plotFunction <> 'prop') and (plotFunction <> 'script') then
                  begin
                    iml.infoMsg(2,1,name+'propName: unused by: '+plotFunction);
                    crdft_finish
                  end;
                propName := ParamStr(p+1);
                iml.InfoMsg(0,1,name+'molec property name: '+propName)
              end;
            'TCL', 'VMD', 'SCRIPT' :
              begin
                scriptName := ParamStr(p+1);
                iml.InfoMsg(0,1,name+'script name: '+scriptName)
              end;
            'XYZ', 'MOLECULE' :
              begin
                xyzMolName := ParamStr(p+1);
                iml.InfoMsg (0,1,name+'output XYZ file name: '+xyzMolName)
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
        end
    end;   {checkCLParam}

  procedure specifiedParam;
    begin
      case plotFunction of
        'fukuiNu' :
          begin
            propName := plotFunction;
          end;
        'fukuiEl' :
          begin
            propName := plotFunction;
          end;
        'dualDesc' :
          begin
            propName := plotFunction;
          end;
        'fukuiPotNu' :
          begin
            propName := plotFunction;
          end;
        'fukuiPotEl' :
          begin
            propName := plotFunction;
          end;
        'prop' :
          begin
            writeInpData := False;
          end;
        'script' :
          begin
            writeInpData := False;
          end;
        else ;
        end;
      if not FileExists(demonOut) then
        begin
          iml.infoMsg (1,1,name+'no deMon2k output file was specified. ' +
                                'No script for plotting will be created.');
          writeTclScript := False;
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
{assigning input and output files}
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
      else if (plotFunction='fukuiPotNu') or (plotFunction='fukuiPotEl') then
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
        end
      else   {plotFunction = prop}
        begin
          iml.infoMsg (0,2,name+'Reading molecular property data (' +
                                propName + ') from: ' + datDemonProp);
          Assign (inpDat1, datDemonProp);
          datProp := outPrefix + propName + '_p.asc';
          iml.infoMsg (0,2,name+'Writting molecular property (' +
                                 propName + ') data to file: ' + datProp);
        end;
{selecting function}
      case plotFunction of
        'fukuiNu' :
          begin
            datProp := outPrefix + 'fukuiNu.asc';
            iml.infoMsg (0,2,name+'Writting Fukui-Nu data to file: '+datProp);
            crdftFunc2 := @fukuiNu
          end;
        'fukuiEl' :
          begin
            datProp := outPrefix + 'fukuiEl.asc';
            iml.infoMsg (0,2,name+'Writting Fukui-El data to file: '+datProp);
            crdftFunc2 := @fukuiEl
          end;
        'dualDesc' :
          begin
            datProp := outPrefix + 'dualDesc.asc';
            iml.infoMsg (0,2,name+'Writting Dual-Desc data to file: '+datProp);
            crdftFunc3 := @dualDesc
          end;
        'fukuiPotNu' :
          begin
            datProp := outPrefix + 'fukuiPotNu.asc'; 
            iml.infoMsg(0,2,name+'Writting FukuiPot-Nu data to file: '+datProp);
            crdftFunc2 := @fukuiPotNu
          end;
        'fukuiPotEl' :
          begin
            datProp := outPrefix + 'fukuiPotEl.asc';
            iml.infoMsg(0,2,name+'Writting FukuiPot-El data to file: '+datProp);
            crdftFunc2 := @fukuiPotEl
          end;
        end;
      Assign (outDat, datprop);
{opening input files}
      iml.infoMsg (0,2,name+'opening input files.');
{$I-} Reset (inpDat1); {$I+}
      if IOresult <> 0 then
        begin
          iml.infoMsg (2,1,name + 'reading input file.');
          crdft_finish
        end;
      if plotFunction <> 'prop' then   {only 'prop' uses a single data file}
        begin
{$I-}     Reset (inpDat2); {$I+}
          if IOresult <> 0 then
            begin
              iml.infoMsg (2,1,name + 'reading input file.');
              crdft_finish
            end
        end;
      if plotFunction = 'dualDesc' then
        begin
{$I-}     Reset (inpDat3); {$I+}
          if IOresult <> 0 then
            begin
              iml.infoMsg (2,1,name + 'reading input file.');
              crdft_finish
            end
        end;
{opening output files}
{$I-} Rewrite (outDat); {$I+}
      if IOresult <> 0 then
        begin
          iml.infoMsg (2,1,name + 'preparing output file.');
          crdft_finish
        end;
      if writeInpData then
        begin
{$I-}     Rewrite (inpOutDat1); {$I+}
          if IOresult <> 0 then
            begin
              iml.infoMsg (2,1,name + 'preparing output file.');
              crdft_finish
            end;
{$I-}     Rewrite (inpOutDat2); {$I+}
          if IOresult <> 0 then
            begin
              iml.infoMsg (2,1,name + 'preparing output file.');
              crdft_finish
            end;
          if plotFunction = 'dualDesc' then
            begin
{$I-}         Rewrite (inpOutDat3); {$I+}
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
          if plotFunction <> 'prop' then ReadLn (inpDat2, strLine);
          if plotFunction = 'dualDesc' then ReadLn (inpDat3, strLine)
        end;
{performing calculation for each data point}
      if plotFunction <> 'prop' then
        while not EoF(inpDat1) do
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
            WriteLn (outDat, outVal:15)
          end
      else   {for plotFunction = prop}
        while not EoF(inpDat1) do
          begin
            ReadLn (inpDat1, strLine);
            strVal := ExtractWord (4, strLine, [' ']);
            WriteLn (outDat, strVal)
          end;
{closing data files}
      close (inpDat1);
      if plotFunction <> 'prop' then close (inpDat2);
      if plotFunction = 'dualDesc' then close (inpDat3);
      close (outDat);
      if writeInpData then
        begin
          close (inpOutDat1);
          close (inpOutDat2);   {note: for 'prop' writeInpData is False}
          if plotFunction = 'dualDesc' then close (inpOutDat3)
        end
    end;   {funcCalc}

  begin   {crdftFuncCalc}
    iml.infoMsg (0,2,name+'Calculating CRDFT function.');
    iml.infoMsg (0,3,name+'plotFunction flag: ' + plotFunction);
    funcCalc;   {note: this should not be called if plotFunction = script}
    iml.infoMsg (0,2,name+'CRDFT function calculation done.');
  end;   {crdftFuncCalc}


procedure tclScript;
  const
    name = 'tclScript: ';

  var
    strLine, nAtm, atm, xc, yc, zc : String;
    ox, oy, oz, ax, ay, az, bx, by, bz, cx, cy, cz, na, nb, nc : String;
    demonFile, xyzFile : Text;
    script : obj_output;

  procedure readExtLattXyz;
    begin
      iml.infoMsg (0,2,name+'Reading parameters from external user file.');
      {pendiente}
    end;

  procedure extractLattXyz;
    var
      i, i_numAtm : Integer;
      code : Word;

    begin
      iml.infoMsg (0,2,name+'Extracting data Lattice parameters and XYZ ' +
                             'coordinates from deMon2k output file:'+demonOut);
{initializing strings and files}
      nAtm := '';
      ox := ''; oy := ''; oz := '';
      ax := ''; ay := ''; az := '';
      bx := ''; by := ''; bz := '';
      cx := ''; cy := ''; cz := '';
      na := ''; nb := ''; nc := '';
      Assign (demonFile, demonOut);
      Assign (xyzFile, outPrefix + xyzMolName);
{opening files}
{$I-} Reset (demonFile);   {$I-}
      if IOResult <> 0 then
        begin
          iml.infoMsg (2,1,name+'opening deMon2k output file for reading' +
                               demonOut);
          crdft_finish
        end;
{$I-} Rewrite (xyzFile);   {$I-}
      if IOResult <> 0 then
        begin
          iml.infoMsg (2,1,name+'opening XYZ file for writting: ' +
                                outPrefix + xyzMolName);
          crdft_finish
        end;
{processing deMon2k output file contents to extract parameters}
      while not EoF(demonFile) do
        begin
          ReadLn (demonFile, strLine);
          if Pos('NUMBER OF ATOMS:', strLine) > 0 then
            begin
              nAtm := ExtractWord (4, strLine, [' ']);
              iml.infoMsg (0,2,name+'Number of atoms (total): ' + nAtm);
              WriteLn (xyzFile, nAtm);
              WriteLn (xyzFile, 'Extracted from: '+demonOut+' by ' +
                                crdft_name + '-v.' + crdft_version)
            end
          else if (Pos('PLOT FUNCTION:', strLine) > 0) and
                  (propName = 'prop') then
            begin   {modify only if the default value was not changed}
              propName := ExtractWord (3, strLine, [' ']);
              iml.infoMsg (0,1,name+'mol property name changed to: '+propName)
            end
          else if Pos('LATTICE ORIGIN :', strLine) > 0 then
            begin
              ox := ExtractWord (4, strLine, [' ']);
              oy := ExtractWord (5, strLine, [' ']);
              oz := ExtractWord (6, strLine, [' ']);
              iml.infoMsg (0,2,name+'read:' + strLine)
            end
          else if Pos('LATTICE  AXIS 1:', strLine) > 0 then
            begin
              ax := ExtractWord (4, strLine, [' ']);
              ay := ExtractWord (5, strLine, [' ']);
              az := ExtractWord (6, strLine, [' ']);
              na := ExtractWord (9, strLine, [' ']);
              iml.infoMsg (0,2,name+'read:' + strLine)
            end
          else if Pos('LATTICE  AXIS 2:', strLine) > 0 then
            begin
              bx := ExtractWord (4, strLine, [' ']);
              by := ExtractWord (5, strLine, [' ']);
              bz := ExtractWord (6, strLine, [' ']);
              nb := ExtractWord (9, strLine, [' ']);
              iml.infoMsg (0,2,name+'read:' + strLine)
            end
          else if Pos('LATTICE  AXIS 3:', strLine) > 0 then
            begin
              cx := ExtractWord (4, strLine, [' ']);
              cy := ExtractWord (5, strLine, [' ']);
              cz := ExtractWord (6, strLine, [' ']);
              nc := ExtractWord (9, strLine, [' ']);
              iml.infoMsg (0,2,name+'read:' + strLine)
            end
          else if Pos('MOLECULE ORIENTATION FOR PLOTTING', strLine) > 0 then
            begin
              for i:=1 to 3 do ReadLn (demonFile, strLine);
              val (nAtm, i_numAtm, code);
              if code <> 0 then
                begin
                  iml.infoMsg (1,1,name+'converting the number of atoms.');
                  crdft_finish
                end;
              for i:=1 to i_numAtm do
                begin
                  ReadLn (demonFile, strLine);
                  atm := ExtractWord (2, strLine, [' ']);
                  xc := ExtractWord (3, strLine, [' ']);
                  yc := ExtractWord (4, strLine, [' ']);
                  zc := ExtractWord (5, strLine, [' ']);
                  WriteLn (xyzFile, ' ' + atm, xc:15, yc:15, zc:15)
                end;
              iml.infoMsg (0,2,name+'XYZ coordinates written.')
            end
        end;
{closing files}
      close (demonFile);
      close (xyzFile)
    end;   {extractLattXyz}

  procedure addTclDecl;
    begin
      script.outDev('');
      script.outDev('# Tcl script for plotting CRDFT molecular properties '+
                    'calculated by deMon2k for visualization in VMD.');
      script.outDev('');
      script.outDev('# declaring lattice variables and loading molecule:');
      script.outDev('set molName ' + outPrefix + xyzMolName);
      script.outDev('set propName ' + propName);
      script.outDev('set propFile ' + datProp);
      script.outDev('set origin [list ' + ox + ' ' + oy + ' ' + oz + ']');
      script.outDev('set va [list ' + ax + ' ' + ay + ' ' + az + ']');
      script.outDev('set vb [list ' + bx + ' ' + by + ' ' + bz + ']');
      script.outDev('set vc [list ' + cx + ' ' + cy + ' ' + cz + ']');
      script.outDev('set na ' + na);
      script.outDev('set nb ' + nb);
      script.outDev('set nc ' + nc);
      script.outDev('set id [mol new $molName]');
      script.outDev('');
      script.outDev('# loading molecular property (scalar field) data:');
      script.outDev('set dataProp [split [read [open $propFile r]] \n]');
      script.outDev('');
      script.outDev('# delete the last empty value in the data list:');
      script.outDev('set last [expr {[llength $dataProp] - 1}]');
      script.outDev('set dataProp [lreplace $dataProp $last $last]');
      script.outDev('');
      script.outDev('# load volumetric data into molecule:');
      script.outDev('mol volume $id $propName $origin $va $vb $vc ' +
                                                     '$na $nb $nc $dataProp');
      script.outDev('unset dataProp');
      script.outDev('');
    end;

  procedure addTclRep;
    begin
{setting up property-specific isosurface rep parameters}
      case plotFunction of
          'fukuiNu' :
            begin
              script.outDev('set isoVal 0.0');
              script.outDev('set isoColorId 1');
            end;
          'fukuiEl' :
            begin
              script.outDev('set isoVal 0.0');
              script.outDev('set isoColorId 0');
            end;
          'dualDesc' :
            begin
              script.outDev('set isoVal 0.0');
              script.outDev('set isoColorId 3');
            end;
          'fukuiPotNu' :
            begin
              script.outDev('set isoVal 0.25');
              script.outDev('set isoColorId 1');
            end;
          'fukuiPotEl' :
            begin
              script.outDev('set isoVal 0.25');
              script.outDev('set isoColorId 0');
            end;
          'prop', 'script' :
            begin
              script.outDev('set isoVal 0.0');
              script.outDev('set isoColorId 2');
            end;
        end;
      script.outDev('');
      script.outDev('# adding rep for molecule and prop isosurface.');
      script.outDev('mol color Name');
      script.outDev('mol representation Licorice 0.1 15.0 15.0');
      script.outDev('mol selection all');
      script.outDev('mol material Opaque');
      script.outDev('mol addrep $id');
      script.outDev('');
      script.outDev('mol color ColorID $isoColorId');
      script.outDev('mol representation Isosurface $isoVal 0 0 0 1 1');
      script.outDev('mol material Transparent');
      script.outDev('mol addrep $id');
      script.outDev('');
      script.outDev('menu graphics off');
      script.outDev('menu graphics on');
      script.outDev('display resetview');
      script.outDev('');
    end;

  begin   {tclScript}
    iml.infoMsg (0,1,name+'Generating tcl script to plot molec. prop. in VMD.');
{initializing script file}
    script.init;
    script.setOutputDevice (c_outDev_screen_file,
                        outPrefix + scriptName, 'REWRITE');
    iml.infoMsg (0,1,name+'Tcl script for VMD: '+script.getOutputFileName);
{creating script}
    extractLattXyz;
    addTclDecl;
    addTclRep;
{finalizing script file}
    script.finish;
    iml.infoMsg (0,2,name+'Tcl script written.');
  end;   {tclScript}

begin   {crdft}
  crdft_init;

  if plotFunction <> 'script' then crdftFuncCalc;
  if writeTclScript then tclScript;

  iml.clearError;
  crdft_finish;
end.   {crdft}

