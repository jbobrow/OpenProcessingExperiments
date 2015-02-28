
// Día 21, la Aguja y la Trompeta.
// la van ahogando, la van abollando.
// ssbeltran


// - - - - - - - - - - - - - - - - -
// declaro variables

float laPuntaDeLaAgujaQueEsVenenoYEsCuraYReverberaComoUnaTrompeta;
float losQueAunNoDespiertanPeroSuenan;
float losQueAunNoSuenanPeroDespiertan;
float losMetalesQueLaEmpujanYReprimen = 77;
float lasCuerdasQueTranquilizanYMienten = 77.07;
float losVientosQueIgnoranYHuyen = 77.7;

float losTiempos = 0;
float yoNoMeSientoDeAqui = 255;
// - - - - - - - - - - SETUP

void setup (){

size (800,800);
smooth ();
background (losTiempos);


}

// - - - - - - - - - - - DRAW

void draw (){


background (losTiempos);


Adagio ();

 losMetalesQueLaEmpujanYReprimen -= 0.1;
 lasCuerdasQueTranquilizanYMienten -= 0.1;
 losVientosQueIgnoranYHuyen -= 0.1;

}


 void Adagio (){
   
laPuntaDeLaAgujaQueEsVenenoYEsCuraYReverberaComoUnaTrompeta += 0.25;
 losQueAunNoDespiertanPeroSuenan -= 0.15;
 losQueAunNoSuenanPeroDespiertan += 0.16;


  fill(yoNoMeSientoDeAqui);
  triangle (  380+losQueAunNoSuenanPeroDespiertan%lasCuerdasQueTranquilizanYMienten, height, width/2, height/10+laPuntaDeLaAgujaQueEsVenenoYEsCuraYReverberaComoUnaTrompeta%losMetalesQueLaEmpujanYReprimen,420+losQueAunNoDespiertanPeroSuenan%losVientosQueIgnoranYHuyen, height);
  
 }
  



