
//rafiAlam
//creativeComputing
//sin and cos

int numObj=20;
float degrees = 360/numObj;
float angleOffset = 0;
float distance = 0;

Object[] Circle = new Object[numObj];

void setup() {
  size(500, 500);
  noStroke();  
  for (int i=0; i<numObj; i++) {
    Circle[i] = new Object (width/2, height/2, 20, 20);
  }
}


void draw() {
  background(60,60,80);
  for (int i=0; i<numObj; i++) {
    float xOffset = cos (radians(degrees * i + angleOffset)) * distance;
    float yOffset = sin (radians(degrees * i + angleOffset)) * distance;
    //        ellipse(width/2 + xOffset, height/2 + yOffset, 20, 20);
    
    stroke(255);
    strokeWeight(5);
//    line(width/2,height/2,Circle[i].x,Circle[i].y);
    line(mouseX,mouseY,Circle[i].x,Circle[i].y);

    Circle[i].display();
    Circle[i].x = width/2 + xOffset;
    Circle[i].y = height/2 + yOffset;
    distance+=.05;
  }


  for (int i=0; i <numObj; i++) {
    if (dist(Circle[i].x,Circle[i].y,width/2,height/2)>width) {
      Circle[i].x = width/2;
      Circle[i].y = height/2;
      distance = .1;
    }
  }
  angleOffset -=2;
}


class Object {
  float x;
  float y;
  float w;
  float h;
  Object (float start_x, float start_y, float start_w, float start_h) {
    x = start_x;
    y = start_y;
    w = start_w;
    h = start_h;
  }

  void display() {
    ellipse(x, y, w, h);
  }
}


void keyPressed() {
  if (key == ' ') {
    distance=0;
  }
}
