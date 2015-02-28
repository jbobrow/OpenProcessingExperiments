
Follow[] me;
boolean m = true;
int stage = 0;
int number = 5000;
 
void setup() {
  size(500, 500);
  smooth();
  noStroke();
 
  me = new Follow[number];
 
  for (int i=0; i<number; i++)
  {
    me[i] = new Follow();
    me[i].pos.x = random(1000);
    me[i].pos.y = random(1000);
    me[i].d = 10;
    me[i].r = (int) random(255);
    me[i].g = (int)random(250,230);
    me[i].b = (int) random(150,230);
    me[i].al = 60;
  }
}
 
void draw() {
  fill(0,5);
  rect(0,0,width,height);
  for (int i=0; i<me.length; i++)
  {
    //me[i].update();
    me[i].bound();
    me[i].move();
    me[i].show();
  }
}
 
class Follow
{
  int d;
  int r, g, b, al;
  //
  PVector pos;
  PVector v;
  PVector acc;
  float ts;
 
  Follow() {
    pos = new PVector(random(width), random(height));
    v = new PVector(0, 0);
    ts = 100;
  }
 
  void show()
  {
    //println(v);
    //println(pos);
    fill(r, g, b, al);
    ellipse(pos.x, pos.y, d, d);
  }
 
  void update3() {
    v = new PVector(0, 0);
  }
 
  void update2() {
    PVector screen = new PVector(width/2, height/2);
    PVector dir = PVector.sub(screen, pos); 
    dir.normalize();    
    dir.mult(100);      
    acc = dir; 
    v.add(acc);
    v.limit(ts);
    pos.add(v);
  }
 
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, pos); 
    dir.normalize();    
    dir.mult(0.5);      
    acc = dir; 
    v.add(acc);
    v.limit(ts);
    pos.add(v);
  }
 
  void move()
  {
    if (m) {
      //pos.x += 2 * v;
      //pos.y += 2 * v;
      update2();
    }
    if (mousePressed) {
      m = false;
      update();
    }
    else {
      m = true;
    }
  }
 
  void bound() {
    if (pos.x>width) {
      pos.x = 0;
      if (mousePressed ==false){
      v = new PVector(0, 0);
      }
    }
    if (pos.x<0) {
      pos.x = width;
      if (mousePressed ==false){
      v = new PVector(0, 0);
      }
    }
    if (pos.y>height) {
      pos.y=0;
      if (mousePressed ==false){
      v = new PVector(0, 0);
      }
    }
    if (pos.y<0) {
      pos.y=height;
      if (mousePressed ==false){
      v = new PVector(0, 0);
      }
    }
  }
}
 
void mouseReleased() {
  for (int i=0; i<number; i++)
  {
    me[i].update3();
    me[i].pos = new PVector(random(width), random(height));
  }
}

