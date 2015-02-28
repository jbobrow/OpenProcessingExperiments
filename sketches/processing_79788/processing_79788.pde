
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/30991*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
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
    circle.setPosition(width/2+100*sin(radians(i*360/N)),height/2+100*cos(radians(i*360/N)));
    circle.setNoFill();
    circle.setNoStroke();
    
    j.addBody(circle);
    
    world.add(circle);
  }
  
  
  
  circles = new ArrayList();
  for(int i = 0; i<35; i++){
    FCircle c = new FCircle(random(15,100));
    c.setPosition(width/2+random(-2,10),height/2+random(-50,50));
    c.setFill(100+random(150),150,random(255));
    c.setNoStroke();
    circles.add(c);
    world.add(c);
  }
 
  
 
}

void draw() {
  background(0);
  
  for(int i = 0; i<circles.size(); i++){
    FCircle c = (FCircle)circles.get(i);
    c.addForce(50,50);
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




