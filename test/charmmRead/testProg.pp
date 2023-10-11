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
{  ctInp.open ('charmmRead_extUsrOpts.ct', 'I');}
{  pNode := ctInp.findTextRec (nil, 'genDelPhiParam');}
{  if pNode <> nil then}
{    writeln ('genDelPhiParam node found in ctInp...');}
{  genDelPhiParam (ctInp, pNode);}

end.
