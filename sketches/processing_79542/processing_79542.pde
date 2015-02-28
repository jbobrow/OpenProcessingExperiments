
import fisica.*;
 
FWorld world;
FBox caja;
 
ArrayList circles;
 
float x, y;
int N = 50;
 
void setup() {
  size(400, 400);
  smooth();
   
  Fisica.init(this);
   
  world = new FWorld();
  world.setGravity(0,0);
  world.setEdges();
   
  FConstantVolumeJoint j = new FConstantVolumeJoint();
  for(int i = 0; i<N; i++){
    FCircle circle = new FCircle(10);
    circle.setFill(255,100,100);
    circle.setPosition(width/2+100*cos(radians(i*360/N)),height/2+100*sin(radians(i*360/N)));
    circle.setNoFill();
    circle.setNoStroke();
     
    j.addBody(circle);
     
    world.add(circle);
  }
  j.setNoFill();
  j.setStrokeWeight(5);
  j.setStroke(255,0,50);
  world.add(j);
   
   
  circles = new ArrayList();
  for(int i = 0; i<50; i++){
    FCircle c = new FCircle(random(15,30));
    c.setPosition(width/2+random(-50,50),height/2+random(-50,50));
    c.setFill(100+random(155),150,random(255));
    c.setNoStroke();
    circles.add(c);
    world.add(c);
  }
  
   
  background(255);
}
 
void draw() {
  background(255);
   
  for(int i = 0; i<circles.size(); i++){
    FCircle c = (FCircle)circles.get(i);
    c.addForce(random(-200,200),random(-200,200));
  }
   
  world.step();
  world.draw(this);
}
 
void keyPressed() {
  try {
    saveFrame("screenshot.png");
  }
  catch (Exception e) {
  }
}
