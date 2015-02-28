

int N = 3; // regular N-sided polygon
float q = 0.5; // internal division ratio

int speed = 10;

//////////////

int r=200;

PVector[] v;
Jumper[] jumper;

void setup(){
  background(0);
  
  size(500,500);
  
  v = new PVector[N];
  for(int i=0; i<N; i++){
    v[i] = new PVector(width/2+r*sin(i*TWO_PI/N), height/2-r*cos(i*TWO_PI/N));
  }
  
  jumper = new Jumper[speed];
  for(int i=0; i<speed; i++){
    jumper[i] = new Jumper();
  }
  
  colorMode(HSB);
}

void draw(){
  for(int i=0; i<speed; i++){
    jumper[i].drawPoint();
  }
}

class Jumper{
  PVector pos;
  
  Jumper(){
    pos = v[0];
  }
  
  public void drawPoint(){
    int num = (int)random(0,N);
    PVector vs = v[num];
    
    stroke((float)num*255/N, 255, 255);
    
    PVector vp = PVector.mult(pos,q);
    PVector vg = PVector.mult(vs,1-q);
    
    pos = PVector.add(vp,vg);
    
    point(pos.x, pos.y);
  }
}
