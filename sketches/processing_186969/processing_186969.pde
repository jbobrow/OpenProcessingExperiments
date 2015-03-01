
Interceptor mig29;



void setup () {
size (800,800);
frameRate(30);
mig29 = new Interceptor (300, 300, 5);
}




void draw () {
background (50,40,70);

mig29.script();
}
void displayFlame (int x, int y, float w, float h, int dir) {
  int angle = 0;
  pushMatrix();
  pushStyle();
  
//  translate (x+w/2, y);
  
  if (dir == 12) {angle = -90; translate (x, y-w/2);}
  if (dir == 3) {angle = 0; translate (x+w/2, y);}
  if (dir == 6) {angle = 90; translate (x, y+w/2);}
  if (dir == 9) {angle = 180;translate (x-w/2, y);}
  
  noStroke();  
  
  rotate (radians(angle));
  
  fill (73, 126, 219, random (90,105));
  ellipse (0,0, random (w*0.9, w), random (h*0.9, h*1.1));
  
  fill (73,126,219, random (155,165));
  ellipse (0 - w/4,0,w/2,random (h*0.5, h*0.7));
  popStyle();
  popMatrix();
  
}
class Interceptor extends Plane {
  
  
  
Interceptor (int _x, int _y, int _s) {
  
  super(_x, _y, _s);
  String url = "http://www.alnaumov.com/uploads/2/5/1/0/25105519/4033018_orig.png";
  model = loadImage(url,"png");

}

void show() {

float theta = velocity.heading2D();

pushStyle();
pushMatrix();
translate (location.x, location.y);
  
  rotate(theta);
  imageMode(CENTER);
  image (model, 0,0,s*10,s*10);
 


  
popStyle();
popMatrix();


for (int i = pathLength - 2; i > 0; i --) {

  strokeWeight (tracerS - i*tracerS/pathLength);
  stroke(255,0,0, 255 - i*255/pathLength);
  line (pathX[i], pathY[i], pathX[i+1], pathY[i+1]);

}
}

void script() {
super.control();
super.update();
this.show();

super.updateTracer();

}

}

















abstract class Plane
{
PVector location = new PVector (0,0);
PVector velocity = new PVector (0,0);
PVector acceleration = new PVector (1,1);
PVector thrust = new PVector  (0,0);

int pathLength = 20;
float [] pathX = new float [pathLength];
float [] pathY = new float [pathLength];
int tracerS = 3;

PImage model;

int s;
int mass = 1;
float maxAcc = 0.05;
float maxVel = 2;
float maxThrust = 4;


Plane (int _x, int _y, int _s) {

  location.x = _x;
  location.y = _y;
  s = _s;

  
}


void update () {
  velocity.add (acceleration);
  location.add(velocity);
  acceleration.mult(0);
  velocity.limit (maxVel);

  if (location.x > width) {location.x = 0;}
  if (location.x < 0) {location.x = width;}
  if (location.y > height) {location.y = 0;}
  if (location.y < 0) {location.y = height;}
  
  pathX [0] = location.x;
  pathY [0] = location.y;
  
}

void control () {
  if (keyPressed) {
    if (key == 'd') {
      acceleration.set (velocity.x, velocity.y);   
      acceleration.rotate(HALF_PI);
      acceleration.normalize();
      acceleration.limit(maxAcc);
      acceleration.mult(1/mass);  
      }

  if (key == 'a') {
      acceleration.set (velocity.x, velocity.y);   
      acceleration.rotate(-HALF_PI);
      acceleration.normalize();
      acceleration.limit(maxAcc);
      acceleration.mult(1/mass);  
      }
  
  if (key == 'w') {
      thrust.set (velocity.x, velocity.y);
      thrust.normalize();
      thrust.mult(maxThrust);
      velocity.add (thrust);  
      }
  
   if (key == 's' && velocity.mag() > thrust.mag()) {
        
      thrust.set (velocity.x, velocity.y);
      thrust.normalize();
      thrust.mult(maxThrust);
      velocity.sub (thrust);  
      }  
}
}

abstract void show();


void updateTracer () {
for (int i = pathLength - 2; i >= 0; i --) {
  pathX [i+1] = pathX[i];
  pathY [i+1] = pathY[i];
}  

 
}  




}


