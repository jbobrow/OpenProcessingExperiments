
int numParticles = 400;
 
 import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound; 
// !--------------------------------------------------------------!
// IceParticles and BubbleParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];
 
void setup() {
  size(300, 300);
  noStroke();
  smooth();
  minim = new Minim(this);
   mySound = minim.loadFile("06 Up In The Clouds.mp3");
 mySound.play();  
  for (int i = 0; i < p.length; i++) {
    if(random(10) > 5){
      float velX = random(-3, 3);    // set the initial velocities to throw particles from all sides of the origin
      float velY = random(-3, 3);
      p[i] = new BubbleParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
    else{
      float velX = random(-1, 1);  // the ice cubes have a smaller initial velocity than bubbles, which are lighter
      float velY = random(-1, 1);
      p[i] = new IceParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2); 
    }
  }
}
 
void draw() {
  fill(255, 10);
  rectMode(CORNER);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
 
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.025;
 
  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }
 
  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }
 
  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
 
 
class GenParticle extends Particle {
  float originX, originY;
 
  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}
 
class BubbleParticle extends GenParticle {
 
  BubbleParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    gravity = .1;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX + random(-100,100);
      y = originY + random(-100,100);
      vx = random(-3, 3.0);    // bubbles are thrown in all directions, left, right, up, down
      vy = random(-3.0, 3.0);
    }
  }
  void update() {
    if(y + radius > height) vy = -0.5 * vy; // added some slight bounce here
    vy = vy + gravity;
    y += vy;
    x += vx;
  }
  void display() {
    noFill();
    stroke(40,60);
    ellipse(x, y, radius, radius);
  }
}
 
class IceParticle extends GenParticle {
 
  IceParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    gravity = 0.25;  // increase the gravity, so the ice cubes seem heavier
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = mySound.mix.level() * 200;
      vx = random(-3.0, 3.0);      // changed the velocities here to small amounts, so they don't start with much energy
      vy = random(-6.0, -3.0);
    }
  }
 
  void update() {
    if(y + radius > height) vy = -0.5 * vy; // added some slight bounce here
    vy = vy + gravity;
    y += vy;
    x += vx;
  }
 
  void display() {    // to make ice cubes, I rotate a rectangle 45 degrees
    pushMatrix();
    translate(x,y);
    rotate(degrees(random(20,60)));
    rectMode(CENTER);
    stroke(0,40);
    fill(20,210,255,50);
    line(0, 0, 0, 30);
    noStroke();
    popMatrix();
  }
}


