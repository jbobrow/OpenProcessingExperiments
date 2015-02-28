
Follow[] me;
boolean m = false;
int stage = 0;
int number = 4500;
void setup() {
  size(400, 400);
  smooth();
  noStroke();
  me = new Follow[number];
  for (int i=0; i<number; i++){
    me[i] = new Follow();
    me[i].pos.x = random(200);
    me[i].pos.y = random(200);
    me[i].d = 3;
    me[i].r = 2;
    me[i].g = (int)random(100,700);
    me[i].b = 255;
    me[i].al = 60;
  }
}
void draw() {
  fill(23);
  rect(0,0,width,height);
  for (int i=0; i < me.length; i++){
    me[i].bound();
    me[i].move();
    me[i].show();
  }
}
class Follow{
  int d;
  int r, g, b, al;
  PVector pos;
  PVector v;
  PVector acc;
  float ts;
  Follow() {
    pos = new PVector(random(width), random(height));
    v = new PVector(0, 0);
    ts = 10;
  }
  void show(){
    fill(25,255, 233, al);
    rect(pos.x, pos.y, d, d);
    rect(pos.x, 222, d, d);
    rect(pos.x, 0, d, d);
    rect(222, pos.y, d, d);
    rect(0, pos.y, d, d);
  }
  void update3(){
    v = new PVector(0, 0);
  }
  void update2() {
    PVector screen = new PVector(width/2, height/2);
    PVector dir = PVector.sub(screen, pos); 
    dir.normalize();    
    dir.mult(1.0);      
    acc = dir; 
    v.add(acc);
    v.limit(ts);
    pos.add(v);
  }
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, pos); 
    dir.mult(1.9);    
    dir.mult(1.9);      
    acc = dir; 
    v.add(acc);
    v.limit(ts);
    pos.add(v);
  }
  void move(){
    if (m){
      update2();
    }
    if (mousePressed){
      m = true;
      update();
    }
    else {
      m = true;
    }
  }
  void bound() {
    if (pos.x>width) {
      pos.x = 0;
      if (mousePressed ==true){
        v = new PVector(0, 0);
      }
    }
    if (pos.y>height) {
      pos.y=0;
      if (mousePressed ==true){
        v = new PVector(0, 0);
      }
    }
  }
}
void mouseReleased() {
  for (int i=0; i<number; i++){
    me[i].pos = new PVector(random(width), random(height));
  }
}



