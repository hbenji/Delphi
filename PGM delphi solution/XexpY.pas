{///////////////////////////////////////////////////////}
{//// Calcul de  X**Y  (X à l'exposant Y) //////////////}
{///////////////////////////////////////////////////////}
{////  Etape 1 :   fixer la technique d'arrondi  ///////}
{///////////////////////////////////////////////////////}
       fstcw dwCtrl             { décharge le CtrlW dans dwCtrl }
       mov dx, dwCtrl           {    puis le passer dans DX     }
       and dx, not 0C00h        { RAZ bits 10 et 11 }
       or dx, 0400h             { b10=0  et  b11=1  : round down }
       xchg dx, dwCtrl          { XCHG => DX sauvegarde old CtrlW }
       push dx
       fldcw dwCtrl             { LOAD new CtrlW }
{///////////////////////////////////////////////////////}
{////  Etape 2 :   Z = Y*LOG2(X)    par  FYL2X  ////////}
{///////////////////////////////////////////////////////}
       fld  deY                 { empile deY -> ST }
       fld  deX                 { empile deX -> ST }
     fyl2x                           { réduction TOS }
{///////////////////////////////////////////////////////}
{////  Etape 3 :   séparer Z en ses parties     ////////}
{///////////////////////////////////////////////////////}
       fst dqZ                  { sauver Z }
       fld dqZ                  { pile :  st=Z  st(1)=Z }
     frndint                    { arrondir TOS :  st=I  st(1)=Z }
       fst dqIntgr              { sauver I }
     fsub                       { faire Z-I -> F=st  (réduction TOS) }
       fstp dqFrctn             { sauver F }
{///////////////////////////////////////////////////////}
{////  Etape 4 :   calculer  2**Z = 2**(I+F)    ////////}
{///////////////////////////////////////////////////////}
       fld dqIntgr              { st=I }
       fld dqFrctn              { st=F  st1=I }
     f2xm1                      { calcul de  2**F-1 -> st }
       fld1                     { st=1  st1=2**F-1  st2=I }
       fadd                     { st=2**F  st1=I }
     fscale                     { I décalages; st=2**Z }
{///////////////////////////////////////////////////////}
{////  Etape 5 :   L'état du registre de contrôle   ////}
{///////////////////////////////////////////////////////}
       pop dx
       mov dwCtrl, dx           { récupère old CtrlW }
       fldcw dwCtrl             { recharge old CtrlW }
{///////////////////////////////////////////////////////}
{////////////           Fin         ////////////////////}
{///////////////////////////////////////////////////////}
