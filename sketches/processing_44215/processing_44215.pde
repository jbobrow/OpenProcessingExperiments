
Face[] faces = new Face[100];

void setup() {
  size(600, 600);
  smooth();
  for (int i = 0; i < faces.length; i++){
    faces[i] = new Face(color(255,0,random(255)), random(width), random(height), 45, 45, 16);
  }
}


void draw() {
  background(100);
  for (int i = 0; i<faces.length; i++){
    faces[i].display();
    faces[i].move();
  }
}

class Face {
  color c;
  float x, y, w, h, eyeSize;
  float xspeed, yspeed;

  Face(color tempC, float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    c=tempC;
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    eyeSize=tempEyeSize;
    xspeed=random(-5, 5);
    yspeed=random(-5, 5);
  }

  void move() {
    x += xspeed;
    y += yspeed;
    if (x>width || x<0) {
      xspeed*=-1;
    }

    if (y>height || y<0) {
      yspeed*=-1;
    }
  }
  
  void display() {
    fill(c);
    ellipseMode(CENTER);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    ellipse(x, y-h, w*1.7, h*1.7);
    fill(random(255));
    ellipse(x-w/3, y-h-18, eyeSize, eyeSize);
    ellipse(x+w/3, y-h-18, eyeSize, eyeSize);
    stroke(255);
    fill(random(255));
    rect(x, y-35, w/2, h/2);

  }
}
