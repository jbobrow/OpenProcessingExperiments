
//Sol
float dS=3;
int centro=350;
//Mercurio
float aM=4.13571*2;
float bM=4.04664*2;
float cM=0.852;
float dM=2;
float iM=360;
float decM=1;
//Venus
float aV=7.7257*2;
float bV=7.7255*2;
float cV=0.05408;
float dV=2;
float iV=360;
float decV=0.391;
//Tierra
float aT=10.6857*2;
float bT=10.6837*2;
float cT=0.18165;
float dT=2;
float iT=360;
float decT=0.240;
//Marte
float aMa=16.28502*2;
float bMa=16.21428*2;
float cMa=1.4145;
float dMa=2;
float iMa=360;
float decMa=0.128;
 //Jupiter
float aJ=55.597*2;
float bJ=55.529*2;
float cJ=2.668;
float dJ=9.992;
float iJ=360;
float decJ=0.020;
//Saturno
float aSa=101.931*2;
float bSa=101.770*2;
float cSa=5.708;
float dSa=8.285;
float iS=360;
float decS=0.0081;
//Urano
float aU=204.972*2;
float bU=204.760*2;
float cU=9.633;
float dU=4.843;
float iU=360;
float decU=0.0028;
//Neptuno
float aN=321.191*2;
float bN=321.177*2;
float cN=2.890;
float dN=4.843;
float iN=360;
float decN=0.0014;

float global=0;

void setup(){
  size(950,700);
}

void draw(){
  float rM=decM,rV=decV,rT=decT,rMa=decMa,rJ=decJ,rS=decS,rU=decU,rN=decN;
  smooth();
  background(0);
  fill(255,255,0);
  noStroke();
  //Sol
  ellipse(centro,centro,dS,dS);
  noFill();
  stroke(255);
  //Orbitas
  ellipse(centro+cM,centro,aM,bM);
  ellipse(centro+cV,centro,aV,bV);
  ellipse(centro+cT,centro,aT,bT);
  ellipse(centro+cMa,centro,aMa,bMa);
  ellipse(centro+cJ,centro,aJ,bJ);
  ellipse(centro+cSa,centro,aSa,bSa);
  ellipse(centro+cU,centro,aU,bU);
  ellipse(centro+cN,centro,aN,bN);
  //Planetas
  //Mercurio
  float anguloM=radians(iM);
  float xM=centro+cM+(cos(anguloM)*aM/2);
  float yM=centro+(sin(anguloM)*bM/2);
  fill(GRAY);
  stroke(GRAY);
  ellipse(xM,yM,dM,dM);
  iM-=decM;
  //Venus
  float anguloV=radians(iV);
  float xV=centro+cV+(cos(anguloV)*aV/2);
  float yV=centro+(sin(anguloV)*bV/2);
  fill(#FF9966);
  stroke(#FF9966);
  ellipse(xV,yV,dV,dV);
  iV-=decV;
  //Tierra
  float anguloT=radians(iT);
  float xT=centro+cT+(cos(anguloT)*aT/2);
  float yT=centro+(sin(anguloT)*bT/2);
  fill(#0000CC);
  stroke(#0000CC);
  ellipse(xT,yT,dT,dT);
  iT-=decT;
  //Marte
  float anguloMa=radians(iMa);
  float xMa=centro+cMa+(cos(anguloMa)*aMa/2);
  float yMa=centro+(sin(anguloMa)*bMa/2);
  fill(#FF3300);
  stroke(#FF3300);
  ellipse(xMa,yMa,dMa,dMa);
  text("Marte",xMa,yMa,2);
  iMa-=decMa;
  //Jupiter
  float anguloJ=radians(iJ);
  float xJ=centro+cJ+(cos(anguloJ)*aJ/2);
  float yJ=centro+(sin(anguloJ)*bJ/2);
  fill(#FF9933);
  stroke(#FF9933);
  ellipse(xJ,yJ,dJ,dJ);
  text("Jupiter",xJ,yJ,2);
  iJ-=decJ;
  //Saturno
  float anguloSa=radians(iS);
  float xSa=centro+cSa+(cos(anguloSa)*aSa/2);
  float ySa=centro+(sin(anguloSa)*bSa/2);
  fill(#FFCC00);
  stroke(#FFCC00);
  ellipse(xSa,ySa,dSa,dSa);
  text("Saturno",xSa,ySa,2);
  iS-=decS;
  //Urano
  float anguloU=radians(iU);
  float xU=centro+cU+(cos(anguloU)*aU/2);
  float yU=centro+(sin(anguloU)*bU/2);
  fill(#9999FF);
  stroke(#9999FF);
  ellipse(xU,yU,dU,dU);
  text("Urano",xU,yU,2);
  iU-=decU;
  //Neptuno
  float anguloN=radians(iN);
  float xN=centro+cN+(cos(anguloN)*aN/2);
  float yN=centro+(sin(anguloN)*bN/2);
  fill(#3300FF);
  stroke(#3300FF);
  ellipse(xN,yN,dN,dN);
  text("Neptuno",xN,yN,2);
  iN-=decN;
  global+=87.9*decM/360;
  fill(255);
  noStroke();
  text("Tiempo transcurrido: "+round(global)+" dias.("+round(global)/365+" años)",600,15,5);
  text("Periodo de traslacion de Mercurio: 87.9 dias.",600,30,1);
  text("Periodo de traslacion de Venus: 224.7 dias.",600,45,1);
  text("Periodo de traslacion de la Tierra: 365.2 dias.",600,60,1);
  text("Periodo de traslacion de Marte: 686.9 dias.",600,75,1);
  text("Periodo de traslacion de Jupiter: 11.8 años.",600,90,1);
  text("Periodo de traslacion de Saturno: 29.4 años.",600,105,1);
  text("Periodo de traslacion de Urano: 84 años.",600,120,1);
  text("Periodo de traslacion de Neptuno: 164.8 años.",600,135,1);
  text("Velocidad x"+rM,600,150,1);

  
  if((keyPressed == true) && (key == '+')){
    decM+=rM;
    decV+=rV;
    decT+=rT;
    decMa+=rMa;
    decJ+=rJ;
    decS+=rS;
    decU+=rU;
    decN+=rN;
  }
  
    
}



