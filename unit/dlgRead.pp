{
|-dlgRead.pp :
|  -unit information :
|    -freepascal unit to read and extract information from
|     _ Autodock 4.2 .dlg files .
|    -intended to be used by the mmLogInfo program .
|    -.dlg file info... :
|      -relevant information :
|        -program version :
|          -example line :
|            -"          AutoDock 4.2 Release 4.2.6" ;;
|        -grid center :
|          -example line :
|            -"Coordinates of Central Grid Point of Maps 
|             _=     (4.620, 66.120, 62.720)" ;;;;;
|  -version :-0.0.1 ;
|  -authors :-Carlos Z. Gómez Castro ;
|  -version information :
|    -date :-2022-08-18.Thr ;
|    -status :-unfinished ;
|    -implementing in this version :
|      -a similar structure and design as the mmLogInfo program ;;
|  -interface section :
|    -uses :
|      -sysutils, strutils, ioDrv, condText ;
|    -constants :
|      -dlgRead_name :- ;
|      -dlgRead_version :- ;;
|    -types :- ;
|    -vars :
|      -ulog :-object to manage log info messages ;;
|    -functions and procedures :- ;
|      -dlgRead_init :- ;
|      -dlgRead_finish :- ;
|      -dlgRead_test :- ;;;
}

unit dlgRead;

interface

{$H+}  {Ansi strings are used instead short strings}

uses
  sysutils, strutils, ioDrv, condText;

const
  dlgRead_name = 'dlgRead';
  dlgRead_version = '0.0.1';

type
  strLogLine = AnsiString;
  strToken = string;
  rec_dlgInfo = record
    pwd: strLogLine;
    fileName: strToken;
    
  end;

var
  ulog : obj_infoMsg;

procedure dlgRead_test (testOpt: string);
procedure dlgRead_init;
procedure dlgRead_finish;

{
|  -implementation section :
|    -functions and procedures :
}
implementation


{|-procedure dlgRead_test (testOpt: string) :
 |  -performs unit tests ;}
procedure dlgRead_test (testOpt: string);
  begin
  end;

{|-procedure dlgRead_init :
 |  -performs all initialization operations of the unit ;}
procedure dlgRead_init;
  begin
    ulog.init;
    ulog.setInfoMsgName ('dlgRead');
    ulog.setOutputDevice (c_outdev_screen,'','');
    {code for reading external user options}
  end;

{|-procedure dlgRead_finish :
 |  -finalizes the unit ;;;}
procedure dlgRead_finish;
  begin
    ulog.finish;
  end;

{|  -dlgRead unit body :- ;;}

begin   {unit dlgRead}
  dlgRead_init
end.

