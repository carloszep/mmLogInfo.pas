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
|      -2023-10-10.Tue ;;
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

type
  strLogLine = AnsiString;
  strToken = string;


procedure write_DelPhi_crg_siz (ctInp : obj_condText; title : p_CTnode);

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

const
  max_nFileList = 20;

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
    ulog.setOutputLevel (c_outLvl_detailed);
    {code for reading external user options}
{    CTlog.linkExtDev (ulog);}
  end;

{
|        -procedure write_DelPhi_crg_siz (ctInp : obj_condText;
|                                       _ title : p_CTnode); :
|          -creates DelPhi .crg and .siz files from .psf and .par files .
|          -detects all unique resname/atomname pairs from the .psf file
|           _ and write in the correct format the .crg and .siz files .
|          -arguments :
|            -ctInp :
|              -condText object containing input information :
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
|                  -paramDelPhi ;
|                -strDir :
|                  -struct/ ;
|                -parDir :
|                  -toppar/delphi/ ;;;;
|          -notes :
|            - ;;
}
procedure write_DelPhi_crg_siz (ctInp : obj_condText; title : p_CTnode);
  var
    psfFile, outPrefix, strDir, parDir, parFile : strToken;
    resName, atmName, atmCharge, atmType, atmSize : strToken;
    nAtomStr, tmpStr : strToken;
    nAtom, a : longint;
    code : word;
    psf, par, outCrg, outSiz : text;
    rline : strLogLine;
    finishRead, readInp : boolean;
    parNode, typeNode, resnameNode, nameNode, foundNode : p_CTnode;
    ctDB: obj_condText;

  begin
    ulog.infoMsg (0,1, 'charmmRead: Starting procedure...');
{initialization}
    nAtom := 0;
    nAtomStr := '';
    psfFile := '';
    outPrefix := 'paramDelPhi';
    strDir := 'struct/';
    parDir := 'toppar/delphi/';
    ctDB.init;
    typeNode := nil;
    resnameNode := nil;
{extraction of input from ct object}
    tmpStr := ctInp.getFieldValue(title, 'psfFileName');
    if tmpStr <> '' then psfFile := tmpStr;
    tmpStr := ctInp.getFieldValue(title, 'outPrefix');
    if tmpStr <> '' then outPrefix := tmpStr;
    tmpStr := ctInp.getFieldValue(title, 'strDir');
    if tmpStr <> '' then strDir := tmpStr;
    tmpStr := ctInp.getFieldValue(title, 'parDir');
    if tmpStr <> '' then parDir := tmpStr;
    parNode := ctInp.findText (title, 'parFiles');
    if parNode = nil then
      begin
        ulog.infoMsg (2,1,'write_DelPhi_crg_siz: no parameter files specified');
        exit;
      end
    else
      begin
        parNode := parNode^.cont;
        while parNode <> nil do
          begin
            parFile := parNode^.CTstr;
            ulog.infoMsg (0,2,'parameter file: '+parDir+parFile);
            if FileExists (parDir+parFile) then
              begin
                assign (par, parDir+parFile);
{$I-}           reset (par); {$I+}
                if IOresult <> 0 then
                  begin
                    ulog.infoMsg (2,1,'write_DelPhi_crg_siz: unable to read parameter file!');
                    exit;
                  end
                else
                  ulog.infoMsg (0,1,'parameter file openned: '+parFile);
                finishRead := False;
                readInp := False;
{extracting size parameter to create a DB of atmType and atmSize}
                while (not EoF(par)) and (not finishRead) do
                  begin
                    readln (par, rline);
                    if pos ('NONBONDED nbxmod', rline) > 0 then
                      begin
                        readInp := True;
                        continue;
                      end
                    else if pos('NBFIX', rline) > 0 then
                      begin
                        finishRead := True;
                        continue;
                      end
                    else if readInp and (rline <> '') then
                      begin
                        if (rline[1] <> ' ') and (rline[1] <> '!') then
                          begin
                            atmType := ExtractWord (1, rline, [' ']);
                            atmSize := ExtractWord (4, rline, [' ']);
                            if typeNode = nil then
                              begin
                                if ctDB.empty then
                                  ctDB.addRoot ('size')
                                else
                                  begin
                                    ctDB.gotoRoot;
                                    ctDB.addFirst ('size');
                                  end;
                                ctDB.addCont ('type');
                                typeNode := ctDB.getCurrPos;
                                ctDB.addFieldValue (atmType, atmSize);
                              end
                            else
                              begin
                                ctDB.gotoPos (typeNode);
                                ctDB.addFieldValue (atmType, atmSize);
                              end;
                          end;
                      end;
                  end;
                close (par);
              end
            else
              begin
                ulog.infoMsg (2,1,'parameter file not found!!');
              end;
            parNode := parNode^.next;
          end;
      end;
{creates a DB with charges and sizes for atom names according to the psf file}
    if FileExists(strDir+psfFile) then
      begin
        assign (psf, strDir+psfFile);
{$I-}   reset (psf); {$I+}
        if IOresult <> 0 then
          begin
            ulog.infoMsg (2,1,'write_DelPhi_crg_siz: unable to read .psf file!');
            exit;
          end
        else
          ulog.infoMsg (0,2,'write_DelPhi_crg_siz: reading .psf info');
{reading lines from .psf file}
        finishRead := False;
        while (not EoF(psf)) and (not finishRead) do
          begin
{detect number of atoms}
            readln (psf, rline);
            if pos('!NATOM', rline) > 0 then
              begin
                nAtomStr := ExtractWord (1, rline, [' ']);
                val (nAtomStr, nAtom, code);
                if code = 0 then
                  ulog.infoMsg (0,3,'  number of atoms in .psf: '+nAtomStr)
                else
                  begin
                    ulog.infoMsg(0,1,'  unable to read nAtoms from psf');
                    exit;
                  end;
                finishRead := True;
                for a:=1 to nAtom do
                  begin
{detect atomnames and resnames}
                    readln (psf, rline);
                    resName := ExtractWord (4, rline, [' ']);
                    atmName := ExtractWord (5, rline, [' ']);
                    atmType := ExtractWord (6, rline, [' ']);
                    atmCharge := ExtractWord (7, rline, [' ']);
                    atmSize := ctDB.getFieldValue (typeNode, atmType);
                    if atmSize = '' then
                      ulog.infoMsg(1,1,'  atmSize not found for type '+atmType);
                    if resnameNode = nil then
                      begin   {resnameNode not found)}
                        if ctDB.empty then
                          begin
                            ctDB.addRoot ('resname');
                            resnameNode := ctDB.getCurrPos;
                          end
                        else
                          begin
                            ctDB.gotoRoot;
                            ctDB.addLast ('resname');
                            resnameNode := ctDB.getCurrPos;
                          end;
                        ctDB.addCont (resName);
                        ctDB.addCont ('name');
                        ctDB.addCont (atmName);
                        ctDB.addFieldValue ('type', atmType);
                        ctDB.addFieldValue ('charge', atmCharge);
                        ctDB.addFieldValue ('size', atmSize);
                      end
                    else   {resnameNode found}
                      begin
                        foundNode := ctDB.findText (resnameNode, resName);
                        if foundNode = nil then
                          begin   {add new resName}
                            ctDB.gotoPos (resnameNode);
                            ctDB.addLastCont (resName);
                            ctDB.addCont ('name');
                            ctDB.addCont (atmName);
                            ctDB.addFieldValue ('type', atmType);
                            ctDB.addFieldValue ('charge', atmCharge);
                            ctDB.addFieldValue ('size', atmSize);
                          end
                        else
                          begin   {the resname already exists}
                            nameNode := ctDB.findText (foundNode, 'name');
                            if nameNode = nil then
                              begin
                                ctDB.gotoPos (foundNode);
                                ctDB.addCont ('name');
                                nameNode := ctDB.getCurrPos;
                              end;
                            foundNode := ctDB.findText (nameNode, atmName);
                            if foundNode = nil then
                              begin   {add new atmName}
                                ctDB.gotoPos (nameNode);
                                ctDB.addLastCont (atmName);
                                ctDB.addFieldValue ('type', atmType);
                                ctDB.addFieldValue ('charge', atmCharge);
                                ctDB.addFieldValue ('size', atmSize);
                              end;
                          end;
                      end;
                  end;
              end;
          end;
        close (psf);
      end
    else
      begin
        ulog.infoMsg (2,1,'write_DelPhi_crg_siz: .psf file not found!');
      end;
    ctDB.print (ctDB.getRoot, 0, 0, 4, 2, 'tmp_paramDB.ct');
{write output .crg parameter files for delphi}
    assign (outCrg, outPrefix+'.crg');
    assign (outSiz, outPrefix+'.siz');
    rewrite (outCrg);
    rewrite (outSiz);
{writing headers}
    writeln (outCrg, '! created by '+charmmRead_name+'_v'+
                     charmmRead_version+' on '+DateTimeToStr(Now));
    writeln (outCrg, 'atom__resnumbc_charge_');
    writeln (outSiz, '! created by '+charmmRead_name+'_v'+
                     charmmRead_version+' on '+DateTimeToStr(Now));
    writeln (outSiz, 'atom__res_radius_');
    CTlog.clearError;
    ctDB.gotoPos (resnameNode);
    ctDB.gotoCont;   {move to first resname}
{move over resName and atmName lists     *** find a better way ***}
    while not CTlog.getError do
      begin
        writeln ('entering resname: '+ctDB.getCurrStr);
        resName := ctDB.getCurrStr;
        CTlog.clearError;
        ctDB.gotoCont;   {move to nameNode}
        ctDB.gotoCont;   {move to first atmName}
        while not CTlog.getError do
          begin
            writeln ('entering name: '+ctDB.getCurrStr);
            atmName := ctDB.getCurrStr;
            atmType := ctDB.getFieldValue (ctDB.getCurrPos, 'type');
            atmCharge := ctDB.getFieldValue (ctDB.getCurrPos, 'charge');
            atmSize := ctDB.getFieldValue (ctDB.getCurrPos, 'size');

            writeln (outCrg, atmName, resName:(9-Length(atmName)), atmCharge:15);
            writeln (outSiz, atmName, resname:(9-Length(atmName)),'   ', atmSize);

            CTlog.clearError;
            ctDB.gotoNext;
          end;
        ctDB.gotoTitle;   {move to the nameNode}
        ctDB.gotoTitle;   {move to the resName}
        writeln ('returning resname title: '+ctDB.getCurrStr);
        CTlog.clearError;
        ctDB.gotoNext;
      end;
    close (outCrg);
    close (outSiz);
  end;   {write_DelPhi_crg_siz}

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

begin
  charmmRead_init;
end.   {unit charmmRead}


{
|  - ;
|- .


|- ;
}
