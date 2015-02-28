
PVector b=new PVector(0,0,1);
//direction of the magnetic field
Particle partic,partic1,partic2;
PVector v1;
PVector ort1;
PVector nulli=new PVector(0,0,0);
int zeit=0;
boolean splitted=false;

void setup() {

  size(600,400);
  frameRate(60);
  smooth();
  rectMode(CENTER);
  v1=new PVector(12,0,0);
  background(255);
  ort1=new PVector(0,300,0);
  partic=new Particle(0,50,v1, ort1);
  partic1=new Particle(0,0,nulli,ort1);
  partic2=new Particle(0,0,nulli,ort1);

}

void draw() {
  partic.update();
  partic.display();
  partic1.update();
  partic1.display();
  partic2.update();
  partic2.display();
  if(int(random(0,100))%51==0&&splitted==false){
    //one percent chance per frame to splitt  up
    splitt();
    zeit=0;
    splitted=true;
  }
  zeit=zeit+1;
  if(splitted&&zeit>200){
    //a new particle 200 frames after splitting up
    NEU();
    splitted=false;
  }
}
void mousePressed(){
  background(255);
}
void NEU() {
  partic.ort.x=00;
  partic.ort.y=50+random(0,300);
  partic.ort.z=0;
  partic.v.x=12;
  partic.v.y=random(-4,4);
  partic.v.z=0;
  partic.masse=50;
  partic.ladung=int(random(-2,2));

  partic1.ort.x=0;
  partic1.ort.y=200;
  partic1.ort.z=0;
  partic1.v.x=0;
  partic1.v.y=0;
  partic1.v.z=0;
  partic1.masse=50;
  partic1.ladung=0;

  partic2.ort.x=0;
  partic2.ort.y=200;
  partic2.ort.z=0;
  partic2.v.x=0;
  partic2.v.y=0;
  partic2.v.z=0;
  partic2.masse=50;
  partic2.ladung=0;
}


void splitt(){
  float v1x=random(-12,12)+partic.v.x;
  float v1y=random(-12,12)+partic.v.y;
  PVector v1=new PVector(v1x,v1y,0);
  PVector ort1=new PVector(partic.ort.x,partic.ort.y,partic.ort.z);

  partic1.ladung=int(random(2,4.4));
  partic1.masse=random(0.3,0.6)*partic.masse;
  partic1.v.set(v1);
  partic1.ort.set(ort1);


  float m2=partic.masse-partic1.masse;
  float v2x=-partic1.v.x*partic1.masse/m2;
  float v2y=-partic1.v.y*partic1.masse/m2;
  float q2=partic.ladung-partic1.ladung;
  PVector v2=new PVector(v2x,v2y,0);

  partic2.ladung=q2;
  partic2.masse=m2;
  partic2.v.set(v2);
  partic2.ort.set(ort1);
 //total momentum, mass and charge preserved
 
 //now taking partic out of the game for restart
  partic.v.x=0;
  partic.v.y=0;
  partic.ort.x=0;
  partic.ort.y=0;
  partic.ladung=0;
  partic.masse=1;
  
 
}


PVector bb1(float x, float y){
  //magnetfeld um den senkrecht (z) verlaufenden stromleiter
  //in kreisen, quadratisch abnehmend
  int xx=int(x);
  int yy=int(y);
  PVector up=new PVector(0,0,1);
  PVector bb=new PVector(0,0,0);
  float stark=500/(0.01+dist(200,200,x,y)*dist(200,200,x,y));

  PVector richt=new PVector(0,0,0);
  xx=xx-200;
  yy=yy-200;
  richt.set(xx,yy,0);
  richt.normalize();
  richt=richt.cross(up);
  richt.mult(stark);
  return richt;
}

PVector bb2(float x, float y){
  PVector bb2=new PVector(0,0,1);
  return bb2;
}







