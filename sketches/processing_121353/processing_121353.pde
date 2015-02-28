
import org.jbox2d.p5.*;
float x;
float vx;
float w = 700;
Physics physics;

void setup() {
  size(400, 800);
  frameRate(100);
  background(255);
  physics = new Physics(this,width, height);
  physics.setDensity(1.0);  

}

void draw() {
fill(252);
rect(-25,-25,450,850);
  x = 200;
  x +=vx;
  vx = 2;
  noStroke();
  fill(57,190,255);
  ellipse(200, 150, w,w);
  w  = w + 0.05;

  if(mousePressed) {
  fill(57,190,255);
  physics.createCircle(random(190,200), 150, 5);
  w = w - 0.3;
}
}
//
//void display() {
//    fill(175);
//    stroke(0);
//    rectMode(CENTER);
//    rect(100,100,100,100);
//  }



