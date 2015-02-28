
size(200,200);
background(92);

int    popNyc         = 8244910;
int    popOpo         = 303424; // http://pordata.pt/Municipios/Populacao+residente+segundo+os+Censos+total+e+por+sexo-17 (Grande Porto)
float  genderPref     = 0.5;
float  singlePop      = 0.44;
float  singlPopOnline = 0.37;
float  ageRange       = 0.247;
float  commonLang     = 0.96;
float  attract0       = 0.13;
float  attract1       = 0.13;
float  wentToUni      = 0.324; // wtf?
int    resultOpo      = round(popOpo*genderPref*singlePop*singlPopOnline*ageRange*commonLang*attract0*attract1*wentToUni);
int    resultNyc      = round(popNyc*genderPref*singlePop*singlPopOnline*ageRange*commonLang*attract0*attract1*wentToUni);
String result         = "NYC ♥ "+resultNyc+"\nOPO ♥ "+resultOpo;

text(result, width/2-textWidth(result)/2, height/2-textAscent());
