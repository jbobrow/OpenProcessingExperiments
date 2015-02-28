
import fisica.*;
FWorld world;
FBox a;
FBox b;
FBox c;
FRevoluteJoint derp;
FRevoluteJoint derp1;

float x = 200;
float y = 200;
float x2 = 200;
float y2 = 200;
float segLength = 100;

void setup() {
  size(400, 400);
  smooth();

  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
//  world.setGravity(0,0);
  b = new FBox(25, 100);
  b.setPosition(200, 150);
  b.setNoStroke();
  b.setGroupIndex(-1);
  b.setFriction(100);
//  b.setAngularDamping(1);
  world.add(b);
  c = new FBox(25, 100);
  c.setPosition(200, 50);
  c.setNoStroke();
  c.setGroupIndex(-1);
  c.setFriction(100);
//  c.setAngularDamping(1);
  world.add(c);
  a = new FBox(25, 25);
  a.setPosition(width/2, height/2);
  a.setGroupIndex(-1);
  a.setNoStroke();
  a.setRotatable(false);
  a.setFriction(100);
  world.add(a);
  
  derp = new FRevoluteJoint(b, a, (float)width/2, (float)height/2);
  derp.setEnableMotor(true);
  derp.setMaxMotorTorque(900);
  derp.setMotorSpeed(1);
  derp.setDrawable(false);
  world.add(derp);
  derp1 = new FRevoluteJoint(b, c, (float)width/2, height/2-100);
  derp1.setEnableMotor(true);
  derp1.setMaxMotorTorque(900);
  derp1.setMotorSpeed(1);
  derp1.setDrawable(false);
  world.add(derp1);
}

void draw() {
  background(200);
  x2= a.getX();
  y2 = a.getY();
  float dx = mouseX - x;
  float dy = mouseY - y;
  float angle1 = atan2(dy, dx);  
  float tx = mouseX - cos(angle1) * segLength;
  float ty = mouseY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  float angle2 = atan2(dy, dx);  
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;
  
  segment(x, y, angle1); 
  segment(x2, y2, angle2); 
  derp.setMotorSpeed((b.getRotation()-(angle2+(PI/2)))*5);
  derp1.setMotorSpeed((c.getRotation()-(angle1+(PI/2)))*-5);


  world.step();
  world.draw();
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

