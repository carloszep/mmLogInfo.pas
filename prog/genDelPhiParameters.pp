{|-genDelPhiParameters.pp :
 |  -freepascal program to generate DelPhi parameter files .
 |  -provisional version that will be integrated to mmLogInfo in the future .
 |  -this program makes available the procedures implemented in the
 |   _ unit charmmRead within the mmLogInfo repository .
 |  -version :
 |    -0.0.1 ;
 |  -dates :
 |    -created :
 |      -2023-10-12.Thu ;
 |    -mofified :
 |      -2023-10-12.Thu ;;
 |  -version information :
 |    -first version working .
 |    -this version works executing the binary without arguments but
 |     _ requiring a struct/ and a toppar/ directories in the calling (working)
 |     _ directory with the following scheme :
 |      -<workingDirectory>/ :
 |        -'struct/' :
 |          -'<psfFile>.psf' ;
 |        -'toppar/' :
 |          -'namd/' :
 |            -<charmmParameters1>.prm .
 |            -<charmmParameters2>.prm .
 |            -... ;
 |          -'delphi/' :
 |            - ;;;;;
 |  - ; |}


{|-program genDelPhiParameters; :
 |  -uses :
 |    -condText .
 |    -charmmRead ;
 |  -const :
 |    - ;
 |  -var :
 |    - ;
 |  -global procedures and functions :|}
program genDelPhiParameters;

{$H+}

uses
  condText, charmmRead;


var
  pNode : p_CTnode;
  ctInp : obj_condText;

{|    -procedure printHelp; :
 |      -prints usage and help information for the current version of the
 |       _ program .
 |      -works when the first argument in the command line call is
 |       _ "-h" or "--help" ;;;|}
procedure printHelp;
  begin
    writeln;
  end;   {printHelp}

procedure readInput;
  begin
  end;

begin

  ctInp.init;
  pNode := nil;

  config_genDelPhiParam (ctInp, pNode);
{input information for charmmRead}
{  ctInp.open ('charmmRead_extUsrOpts.ct', 'I');}
{  pNode := ctInp.findTextRec (nil, 'genDelPhiParam');}
{  if pNode <> nil then}
{    writeln ('genDelPhiParam node found in ctInp...');}
{  genDelPhiParam (ctInp, pNode);}

end.
