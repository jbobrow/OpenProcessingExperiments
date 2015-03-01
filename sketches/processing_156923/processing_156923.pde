
ArrayList<Object> objects;
boolean right, left, up, down;

int numObjects = 60;
int radius = 200;
float rotAngle = 0;
int num = 0;
int counter = 0;
int counterY = 0;
float rotInc = 0.003;
color c;

void setup() {
  size(600, 600);
  smooth();
  objects = new ArrayList<Object>();

  for (int i = 0; i < numObjects; i++) {
    objects.add(new Object(i*TWO_PI/numObjects, radius));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(rotAngle);
  rotAngle += rotInc;

if (mouseX == pmouseX) {
    if (counter > 300) {
      num = 0;
      counter = 0;
    }
    counter++;
  }
  
  if (mouseY == pmouseY) {
    if (counterY > 200) {
      c = color(255, 255, 255);
      counterY = 0;
    }
    counterY++;
   
  }
    
 

  switch(num) {
  case 0:
    stroke(255);
    fill(c, 100);
    for (Object o : objects) {
      o.update();
      line(0, 0, o.position.x, o.position.y);
      ellipse(o.position.x, o.position.y, 10, 10);
      
    }
    
    break;

  case 1:

    stroke(255);
    fill(c, 100);
    beginShape(TRIANGLE_STRIP);
    for (Object o : objects) {
      o.update();
      vertex(o.position.x, o.position.y);
    }
    endShape();

    break;
  case 2:
    stroke(255);
    fill(c, 50);
    beginShape(TRIANGLE_FAN);
    for (Object o : objects) {
      o.update();
      bezier(o.position.x, o.position.y, o.radius/2*cos(o.theta+PI/3), o.radius/2*sin(o.theta+PI/3), o.radius/3*cos(o.theta-PI/3), o.radius/3*sin(o.theta-PI/3), 0, 0);
    }
    endShape(CLOSE);
    break;
  }
}

class Object {

  PVector position;
  float theta;
  float angle = 0;
  float radius;
  float rint, thetaint;
  float amp = random(100);
  float angleAmp = random(-1,1);
  float angVel = PI/200*int(random(-4, 4));

  Object(float theta_, int radius_ ) {
    theta = theta_;
    thetaint = theta_;
    rint = radius_;
    radius = radius_;
    position = new PVector(radius*cos(theta), radius*sin(theta));
  }

  void update() {
    radius = rint + amp*sin(angle);
    theta = thetaint + angleAmp*sin(angle+PI/4);
    position.x = radius*cos(theta);
    position.y = radius*sin(theta);
    angle += angVel;
  }

  void display() {
    fill(255);
    ellipse(position.x, position.y, 20, 20);
  }
}


void mouseMoved() {
  //if equal case
  
  if (mouseX > pmouseX) {
    if (left = true) {
      num = 1;
    }
    left = false;
    right = true;
  }
  if (pmouseX > mouseX) {
    if (right = true) {
      num = 2;
    }
    right = false;
    left = true;
  }

  if (mouseY > pmouseY) {
    if (up = true) {
       c = color(39, 210, 255);
    }
   
    up = false;
    down = true;
  }
  if (pmouseY > mouseY) {
    if (down = true) {
      c = color(200, 250, 5);
    }
     
    down = false;
    up = true;
  }
}
