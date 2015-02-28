
//Sol
float dS=10;
int centro=250;
//Mercurio
float aM=41.3571*2;
float bM=40.4664*2;
float cM=8.52;
float dM=3.485;
float iM=360;
float decM=1;
//Venus
float aV=77.257*2;
float bV=77.255*2;
float cV=0.5408;
float dV=8.645;
float iV=360;
float decV=0.391;
//Tierra
float aT=106.857*2;
float bT=106.837*2;
float cT=1.8165;
float dT=9.111;
float iT=360;
float decT=0.240;
//Marte
float aMa=162.8502*2;
float bMa=162.1428*2;
float cMa=14.145;
float dMa=4.843;
float iMa=360;
float decMa=0.128;

float global=0;

void setup(){
  size(500,510);
}

void draw(){

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
  //Mercurio
  float anguloM=radians(iM);
  float xM=centro+cM+(cos(anguloM)*aM/2);
  float yM=centro+(sin(anguloM)*bM/2);
  fill(255);
  ellipse(xM,yM,dM,dM);
  text("Mercurio",xM,yM,2);
  iM-=decM;
  //Venus
  float anguloV=radians(iV);
  float xV=centro+cV+(cos(anguloV)*aV/2);
  float yV=centro+(sin(anguloV)*bV/2);
  fill(255);
  ellipse(xV,yV,dV,dV);
  text("Venus",xV,yV,2);
  iV-=decV;
  //Tierra
  float anguloT=radians(iT);
  float xT=centro+cT+(cos(anguloT)*aT/2);
  float yT=centro+(sin(anguloT)*bT/2);
  fill(255);
  ellipse(xT,yT,dT,dT);
  text("Tierra",xT,yT,2);
  iT-=decT;
  //Marte
  float anguloMa=radians(iMa);
  float xMa=centro+cMa+(cos(anguloMa)*aMa/2);
  float yMa=centro+(sin(anguloMa)*bMa/2);
  fill(255);
  ellipse(xMa,yMa,dMa,dMa);
  text("Marte",xMa,yMa,2);
  iMa-=decMa;
  global+=87.9/360;
  text("Tiempo transcurrido: "+round(global)+" dias.",10,440,5);
  text("Periodo de traslacion de Mercurio: 87.9 dias.",10,455,1);
  text("Periodo de traslacion de Venus: 224.7 dias.",10,470,1);
  text("Periodo de traslacion de la Tierra: 365.2 dias.",10,485,1);
  text("Periodo de traslacion de Marte: 686.9 dias.",10,500,1);
}


