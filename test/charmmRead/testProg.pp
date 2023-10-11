program testProg;

{$H+}

uses
  condText, charmmRead;

var
  pNode : p_CTnode;
  ctInp : obj_condText;

begin

  ctInp.init;

{input information for charmmRead}
  ctInp.open ('charmmRead_extUserOptions.ct', 'I');
  pNode := ctInp.findTextRec (nil, 'write_DelPhi_crg_siz');
  write_DelPhi_crg_siz (ctInp, pNode);

end.
