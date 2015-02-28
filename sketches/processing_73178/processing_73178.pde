
import peasy.*;

PeasyCam cam;
Cube a,b,c,d,e,f,g,h,i;

void setup(){
  size(1000,500,P3D);

  cam = new PeasyCam(this, 800);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(3000);
  
  //too much (need 27 for a cube)! consider using arrays for this . . .
  a = new Cube(0,100);
  b = new Cube(100,100);
  c = new Cube(-100,100);
  d = new Cube(100,100);
  e = new Cube(-100,100);
  f = new Cube(100,100);
  g = new Cube(-100,100);
  
  
}

void draw(){
  background(35);
  
  a.displayZ();
  b.displayZ();
  c.displayZ();
  
  d.displayX();
  e.displayX();
  
  f.displayY();
  g.displayY();
  
  fill(255,5);
  stroke(255,35);
  box(300);
  
  //filler cubes...
  pushMatrix();
  translate(100,100,100);
  fill(255,35);
  box(100);
  pushMatrix();
  translate(0,0,-200);
  box(100);
  pushMatrix();
  translate(-200,0,0);
  box(100);
  pushMatrix();
  translate(0,0,200);
  box(100);
  pushMatrix();
  translate(0,-200,0);
  box(100);
  pushMatrix();
  translate(0,0,-200);
  box(100);
  pushMatrix();
  translate(200,0,0);
  box(100);
  pushMatrix();
  translate(0,0,200);
  box(100);
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
    
}

void keyPressed(){
  if (key=='e'){
    b.explode();
    c.explode();
    d.explode();
    e.explode();
    f.explode();
    g.explode();
  }else if (key=='c'){
    b.contract();
    c.contract();
    d.contract();
    e.contract();
    f.contract();
    g.contract();
  }
}
  
///////////////>

class Cube{
  int x, w;
  
  Cube(int x_, int w_){
    x = x_;
    w = w_;
  }
  
  void displayZ(){
    pushMatrix();
    translate(0,0,x);
    fill(255,70);
    box(100);
    popMatrix();
  }
  
  void displayX(){
    pushMatrix();
    translate(x,0,0);
    fill(255,70);
    box(100);
    popMatrix();
  }
    
  void displayY(){
    pushMatrix();
    translate(0,x,0);
    fill(255,70);
    box(100);
    popMatrix();
  }
  
  void displayC(){
    pushMatrix();
    translate(x,0,x);
    fill(255,70);
    box(100);
    popMatrix();
  }
  
  void explode(){
    x = x*3;
  }
  
  void contract(){
    x = x/3;
  }
  
}
    

