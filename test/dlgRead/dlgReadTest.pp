program dlgReadTest;

{$H+}

uses
  ioDrv, condText, dlgRead;

begin   {program dlgReadTest}
  dlgrl.setOutputLevel (c_outLvl_extense);

  dlgRead_test ('dlgReadFile');
end.

