{
|-charmmRead.pp :
|  -freepascal unit to read topology and parameter files from the CHARMM
|   _ force field .
|  -authors an contributors :
|    -Carlos Z. Gómez Castro ;
|  -dates :
|    -created :
|      -2023-10-05.Wed ;
|    -modified :
|      -2023-10-05.Wed ;;
|  -code repositories :
|    -GitHub: https://github.com/carloszep/mmLogInfo.pas ;
|  -version :
|    -0.0.1 ;
|  -version information :
|    -changes implemented :
|      -initial definitions ;
|    -to do list :
|      -create all initial definitions to run .
|      -to implement test procedures ;;
}

{
|  -unit charmmRead :
|    -interface section :
|      -uses (units required) :
|        -sysutils, strutils, ioDrv, condText ;
|      -const (constants) :
|        -charmmRead_name .
|        -charmmRead_version ;
|      -type (unit types) :
|        -strLogLine .
|        -strToken ;
|      -interface procedures .
|        -charmmRead_init .
|        -writeDelPhiCRG ;;
}
unit charmmRead;

interface

{$H+}  {Ansi strings are used instead short strings}

uses
  sysutils, strutils, ioDrv, condText;

const
  charmmRead_name = 'charmmRead';
  charmmRead_version = '0.0.1';


procedure charmmRead_init;
procedure write_DelPhi_crg-siz (psf : strToken);
procedure charmmRead_interpreter;

{
|    -implementation section :
|        -var (unit variables) :
|          -ulog :
|            -unit log (obj_infoMsg) ;
|          -userOptsFile :
|            -name of the external .ct file for user option used by this unit .
|            -predefined name: 'charmmRead_extUserOptions.ct' ;
|          -userOpts :
|            -obj_condText with the contents of the userOptsFile ;;
|      -procedures and function :
}
implementation

type
  strLogLine = AnsiString;
  strToken = string;

var
  ulog : obj_infoMsg;

{
|        -procedure charmmRead_init; :
|          -initializes the charmmRead unit ;
}
procedure charmmRead_init;
  begin
    ulog.init;
    ulog.setInfoMsgName ('charmmRead');
    ulog.setOutputDevice (c_outdev_screen,'','');
    {code for reading external user options}
    
  end;

{
|        -procedure write_DelPhi_crg-siz (inpCTFileName : strToken) :
|          -creates DelPhi .crg and .siz files from .psf and .par files .
|          -detects all unique resname/atomname pairs from the .psf file
|           _ and write in the correct format the .crg and .siz files .
|          -arguments :
|            -inpCTFileName :
|              -name of the .ct file containing input information :
|              -search field text (for .ct format) :
|                -'outPrefix' :
|                  -prefix used for the output .crg and .siz files ;
|                -'psfFileName' :
|                  -name of the .psf file (as value 'cont node') ;
|                -'parFiles' :
|                  -list of parameter files (as value 'count list') ;
|                -'strDir', 'parDir' :
|                  -path to the directories for the .psf or .par files .
|                  -optional fields .
|                  -acceptable values :
|                    -valid unix relative or absolute paths ;;;
|              -example :
|                -psfFileName :
|                  -1brs.psf ;
|                -parFiles :
|                  -par_all36m_prot.prm .
|                  -par_water_ions2.prm .
|                  -par_all36_cgenff.prm ;
|                -outPrefix :
|                  -parameters ;
|                -strDir :
|                  -struct/ ;
|                -parDir :
|                  -toppar/namd/ ;;;
|            -notes :
|              - ;;;
}
procedure write_DelPhi_crg-siz (inpCTFileName : strToken);
  begin
  end;   {writeDelPhiCRG}

{
|        -procedure charmmRead_interpreter; :
|          -interpretates user input through an external .ct file .
|          -external user file (in .ct format) :
|            -'charmmRead_extUserOptions.ct' .
|            -the file is read at initialization time by proc charmmRead_init ;
|          -the interpreter is activated if the external user options .ct file
|           _ contains a node 'charmmRead_interpreter' :
|            -then the cont list is tried to be interpreted node by node ;;
}
procedure charmmRead_interpreter;
  begin
  end;   {charmmRead_interpreter}

end.   {unit charmmRead}


{
|  - ;
|- .


|- ;
}
