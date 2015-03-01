
// Author Kyle K
// Jun 6 2014
//
// Tweak of http://www.openprocessing.org/sketch/149560
//

ArrayList<Epitrochoid> e;
 
void setup() {
  e = new ArrayList();
  size(800, 600);
  background(255);
  frameRate(30);
  for(int i=0;i<5;i++){
    Epitrochoid ep = new Epitrochoid(new PVector(random(width),random(height)),random(12 ));
    e.add(ep);
  }
}

 
void draw() {
  background(255);
 
  for(Epitrochoid ep: e){
    ep.display(); 
  }

}

void mousePressed(){
 if(mouseButton == LEFT){
   Epitrochoid ep = new Epitrochoid(new PVector(mouseX,mouseY),random(12));
   e.add(ep);
 } else {
   if(e.size()!=0){
   int index = e.size()-1;
   e.remove(index);}
 }
 
}
 

 

   
  

class Epitrochoid{
  
  PVector loc;
  PVector vel;
  float R,r, theta, thetaInc, RInc, rInc, perInc, size, rdRatio, RInitial, rInitial, RrRatio;
  int orbits;
  float opacity;
  float bumpX, bumpY;
  
 Epitrochoid(PVector loc, float size){
   this.loc = loc;
   this.vel = new PVector(random(-size,size),random(-size,size));
   this.size = size;
  
  rInitial = 5;

  RrRatio = 2;
  theta = 0;
  rdRatio = 0.02;  
  opacity = random(30,90);

  thetaInc = PI/60;
  RInc = 5;
  rInc = random(18,25);
  bumpY = random(35,43);
  bumpX = random(15,25);
  R = bumpX;
  perInc =random(0.8,1.4);
  orbits = round(random(5));
 } 
 
 void update(){

    if(loc.x<0 || loc.x>width){
      vel.x*=-1;
      bumpX = random(11,25);
      bumpY = random(32);
    }
    if(loc.y<0 || loc.y>width){
      vel.y*=-1;
      bumpX = random(15,25);
      bumpY = random(35,33);
    }

     loc.add(vel);
 }
 
 void display() {
  update();
  R = bumpX;
  r = R / bumpY;

  pushMatrix();

  for(Epitrochoid ep: e){
   stroke(0,85);
   float d = PVector.dist(loc ,ep.loc );
   if(d>0 && d<350){
      if(d<(size+size)*4){
     vel.x*=-1;vel.y*=-1;
      ep.vel.x*=-1;ep.vel.y*=-1;
      bumpX = random(15,25);
      bumpY = random(35,33);
      loc.add(vel);
      ep.loc.add(ep.vel); 
   }
      line(loc.x,loc.y,ep.loc.x,ep.loc.y);
   }
   
  
  }
  translate(loc.x,loc.y);
  noFill();
  stroke(35, opacity);
  
  for (int i = 0; i < orbits; i++) {
    for (float angle = 0; angle  < 2*PI; angle += thetaInc) {
 
      float d = r/rdRatio;
      float xx = (R+r)*cos(angle) - d*cos((R+r)*angle / r);
      float yy = (R+r)*sin(angle) - d*sin((R+r)*angle / r);
      ellipse(xx, yy, size, size);
    }

    R*=perInc;
    r*=perInc;
  }
  popMatrix();
}

}


