program testProg;

{$H+}

uses
  condText, charmmRead;

var
  pNode : p_CTnode;
  ctInp : obj_condText;

begin

  ctInp.init;
  pNode := nil;
{input information for charmmRead}
  ctInp.open ('charmmRead_extUserOptions.ct', 'I');
  pNode := ctInp.findTextRec (nil, 'write_DelPhi_crg_siz');
  if pNode <> nil then
    writeln ('write_DelPhi_crg_siz node found in ctInp...');
  write_DelPhi_crg_siz (ctInp, pNode);

end.
