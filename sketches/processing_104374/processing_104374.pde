
Planeta miplaneta;
int h=600;
int w=600;

float t=0;
float dt=0.1;
float k=20;
float g=50;
float r=10;

PVector sol=new PVector(w/2,h/2);

void setup() {
  smooth();
  size(w,h,P3D);
  miplaneta=new Planeta();
  //camera(200,200,150,  0,0,0,  1,1,0);
  
}

void draw() {
  background(255);
  PVector fuerza;
  PVector distancia;
  PVector unit;
  PVector grav=new PVector(0,g);
  float elong;

  distancia = PVector.sub(sol,miplaneta.pos);
  unit = PVector.div(distancia,distancia.mag());
  elong = distancia.mag() ;
  fuerza = PVector.mult(unit,k*elong);
  fuerza.add(grav);
  miplaneta.muevete(fuerza);
  miplaneta.dibujaSol();
  miplaneta.dibujate();
  t+=dt;
}

class Planeta {
  PVector pos;
  PVector vel;
  float masa;

  Planeta() {
    pos=new PVector(h/2+random(-10,80),w/2+random(-10,80));
    vel=new PVector(25,25);
 
    masa=100;
  }
  Planeta(PVector initPos, PVector initVel,float initR,float initMasa) {
    pos=initPos;
    vel=initVel;
    r=initR;
    masa=initMasa;
  }
  void muevete(PVector fuerza) {
    vel.add(PVector.mult(fuerza,dt/masa));
    pos.add(PVector.mult(vel,dt));
  }
  void dibujate() {   
    //fill(200,0,0);
    //ellipse(pos.x,pos.y,r,r);
  noStroke();
lights();
translate(pos.x, pos.y, 0);
sphere(r);
  }
  void dibujaSol(){
    fill(230,170,10);
    ellipse(w/2,h/2,25,25);
  }
}


