

ArrayList plist = new ArrayList();
int MAX = 60;
 
void setup() {
  size(400,400);
  background(12);
}
 
void draw() {
  background(255);
  if(mousePressed && mouseButton == RIGHT) {
    background(255);
    boolean clearall = true;
    while(plist.size() > 0) {
      for(int i = 0; i < plist.size(); i++) {
        plist.remove(i);
      }
    }
  }
 
  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i);
    //makes p a particle equivalent to ith particle in ArrayList
    p.run();
    p.update();
    p.gravity();
  }
}
 
void mousePressed() {
  for (int i = 0; i < MAX; i ++) {
    plist.add(new Particle(mouseX,mouseY)); // fill ArrayList with particles
 
    if(plist.size() > 5*MAX) {
      plist.remove(0);
    }
  }
}
class Particle {
  float r = 2;
  PVector pos,speed,grav;
  ArrayList tail;
  float splash = 15;
  int margin = 15;
  int taillength = 15;
 
  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);
 
    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,0.02);
     
    tail = new ArrayList();
  }
 
  void run() {
    pos.add(speed);
 
    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }
 
    float damping = random(-0.5,-0.6);
    if(pos.x > width - margin || pos.x < margin) {
      speed.x *= damping;
    }
    if(pos.y > height -margin) {
      speed.y *= damping;
    }
  }
 
  void gravity() {
    speed.add(grav);
  }
 
  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 150);
      rect(tempv.x,tempv.y,r+50,r+30);
    }
  }
}


