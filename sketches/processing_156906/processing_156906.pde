
ArrayList<Object> objects;
float tail = 0.1;
float tailNum = 10;
float numObjects = 3;


void setup() {
  size(600, 600);
  smooth();
  objects = new ArrayList<Object>();
}

void draw() {
  background(0);

  for (int i = objects.size ()-1; i >= 0; i--) {
    Object o = (Object) objects.get(i);
    o.display();
    o.update();
    if (o.isDead()) {
      objects.remove(i);
    }
  }
  fill(0);
  rect(0, 0, 20, 20);
  
}

void mouseMoved() {
  float len = sqrt((mouseX-pmouseX)*(mouseX-pmouseX) +(mouseY-pmouseY)*(mouseY-pmouseY));
  if (len > 50) {
    if (mouseX > pmouseX){
      if (mouseY > pmouseY) {
      float angle = acos((mouseX - pmouseX) / len);
      } else if (pmouseY > mouseY) {
        float angle = -acos((mouseX - pmouseX) / len);
      }
    } else if (mouseX < pmouseX){
      if (mouseY > pmouseY) {
      float angle = acos((mouseX - pmouseX) / len);
      } else if (pmouseY > mouseY) {
        float angle = -acos((mouseX - pmouseX) / len);
      }
    }

    for (int i = 0; i < numObjects; i++) {
      objects.add(new Object(mouseX, mouseY, angle, int(random(100))));
    }
  }
}

class Object {

  PVector position;
  float direction;
  int radius;
  float theta1;
  float theta2;
  float thetaInc = PI/100;
  int c = 255;
  float size;

  Object(float x_, float y_, float dir, int rad) {
    position = new PVector(x_, y_);
    direction = dir;
    radius = rad;
    theta1 = dir;
    theta2 = dir;
    c = 255;
    size = map(radius, 0, 100, 5, 30);
  }

  void update() {
    theta1 += thetaInc;
    theta2 -= thetaInc;
  }

  void display() {
    noStroke();

    if (theta1 > 3*PI/2) {
      c -= 250 / ((PI/2) / thetaInc);
    }

    fill(c, 100);


    for (int i = 0; i < tailNum; i++) {
      pushMatrix();
      translate(position.x - radius*cos(direction - PI/2), position.y - radius*sin(direction - PI/2));
      ellipse(radius*cos(theta1 - PI/2 - tail*i), radius*sin(theta1- PI/2 - tail*i ), size-size/tailNum*i, size-size/tailNum*i);
      popMatrix();
    }

    for (int i = 0; i < tailNum; i++) {
      pushMatrix();
      translate(position.x + radius*cos(direction - PI/2), position.y + radius*sin(direction - PI/2));
      ellipse(radius*cos(theta2 + PI/2 + tail*i), radius*sin(theta2 + PI/2+ tail*i), size - size/tailNum*i, size - size/tailNum*i);
      popMatrix();
    }
  }

  Boolean isDead() {
    if (theta1 > TWO_PI || theta1 < -TWO_PI) {
      return true;
    } else {
      return false;
    }
  }
}

