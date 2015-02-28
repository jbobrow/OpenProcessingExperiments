
float aL=384.401;
float bL=383.807;
float cL=21.361;
float dL=34.76;
float dT=127.56;
float i=360;
float global=0;
float mes=0;

void setup()
{
  size(1000,1000);
}

void draw(){
  
  background(0);
  fill(#101999);
  noStroke();
  ellipse(500,500,dT,dT);
  stroke(255);
  noFill();
  ellipse(500+cL,500,aL*2,bL*2);
  float angulo=radians(i);
  float xL=500+cL+(cos(angulo)*aL);
  float yL=500+(sin(angulo)*bL);
  fill(255);
  ellipse(xL,yL,dL,dL);
  i-=0.5;
  global+=0.5;
  float tiempo=global/12.8;
  text("Tiempo: "+round(tiempo)+" dias, mes: "+round(mes),30,30);
  text("Periodo de traslacion de La Luna: 28 dias",30,50);
  if(i==0){
    mes++;
    i=360;
  }
  
}

