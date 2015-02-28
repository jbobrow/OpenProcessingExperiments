
Face face1;
Face face2;
Face face3;


void setup() {
  size(400, 400);
  face1=new Face(color(72, 222, 234), 150, 100, 60, 60, 16);
  face2=new Face(color(96, 245, 206), 350, 350, 60, 60, 16);
  face3=new Face(color(164, 255, 139), 200, 250, 60, 60, 16);
}


void draw() {
  background(197,136,214);
  face1.move();
  face1.display();
  face2.move();
  face2.display();
  face3.move();
  face3.display();
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
    strokeWeight(1.5);
    stroke(255);
    ellipse(x, y-h, w*1.5, h*1.5);
    fill(117, 203, random(255));
    ellipse(x-w/3, y-h-15, eyeSize, eyeSize);
    ellipse(x+w/3, y-h-15, eyeSize, eyeSize);
    stroke(255);
    fill(255,49,random(255));
    rect(x, y-40, w/2, h/2);

  }
}

