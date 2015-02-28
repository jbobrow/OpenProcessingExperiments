
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Ball a_ball, another_ball, onemore_ball;
 
void setup() {
  size(500,500);
  smooth();
  background(255);
  a_ball = new Ball(100, 100, 1, 3.3);
  another_ball = new Ball(random(width), random(height), random(5), random(5));
  onemore_ball = new Ball(random(width), random(height), random(7), random(5));
}
 
void draw() {
  noStroke();
  fill(0);
  rect(0,0,width,height);
 
 
  a_ball.update();
  another_ball.update();
  onemore_ball.update();
 
  
  a_ball.display();
  another_ball.display();
  onemore_ball.display();
 
 ellipse (mouseX,mouseY,60,60);
}
 
class Ball {
  PVector loc;  // location
  PVector vol;  // velocity
 
  // constructor
  Ball(PVector l, PVector v) {
    loc = l;
    vol = v;
  }
 
  // constructor
  Ball(float x, float y, float xsp, float ysp) {
    loc = new PVector(x, y);
    vol = new PVector(xsp, ysp);
  }
 
  void update() {
    
    if ((xlocation() > width) || (xlocation() < 0)) {
      changeSpeed(new PVector(-1,1));
    }
    if ((ylocation() > height) || (ylocation() < 0)) {
      changeSpeed(new PVector(1,-1));
    }
    loc.add(vol);
  }
 
  void display() {
    stroke(0);
    fill(0,242,200);
    ellipse(loc.x,loc.y,30,30);
  }
 
  float xlocation() {
    return loc.x;
  }
 
  float ylocation() {
    return loc.y;
  }
 
  PVector changeSpeed(PVector a) {
    vol.mult(a);
    return vol;
  }
}
//if (xlocation = 0 or 500)


