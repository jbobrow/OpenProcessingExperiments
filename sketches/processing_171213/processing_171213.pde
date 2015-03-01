
Laser laser = new Laser();
Mirror mirror = new Mirror();

void setup(){
  size(400,400);
  background(0);
  noStroke();
  noSmooth();
  frameRate(30);
}

void draw(){
  background(0);
  fill(255);
  noStroke();
  rect(20,200,40,20);
  laser.update();
  laser.display();
  mirror.display();
}
class Laser {
  float pX, pY;
  float theta0 = -0.9;
  float theta;
  float x = 40;
  float y = 200;
  float[] points = new float[4];
  int a = 1;

  Laser(){
  }
  
  void update() {
    pX = x;
    pY = y;
    theta = theta0;
    while (x < width && x > 0 && y < height && y > 0) {
      x += cos(theta);
      y -= sin(theta);
      if( round(height-y) < round(-x + 394) && round(height-y) > round(-x + 390)) {
        points = append(points, pX);
        points = append(points, pY);
        points = append(points, x);
        points = append(points, y);
        pX = x;
        pY = y;
        theta = 5*PI/4 + (PI/4 - theta0);
      }
    }
    points = append(points, pX);
    points = append(points, pY);
    points = append(points, x);
    points = append(points, y);
    x = 40;
    y = 200;
    theta0 += 0.005;
  }
  
  void display() {
    for (int i = 0; i < points.length -3; i += 4) {
      stroke(255,0,0);
      line(points[i], points[i+1], points[i+2], points[i+3]);
    }
    points = new float[4];
  }
  
}
class Mirror {
  float x = 200;
  float y = 200;
  float theta = PI/4;
  
  Mirror() {
  }
  
  void display() {
    rectMode(CENTER);
    pushMatrix();
    translate(x,y);
    rotate(theta);
    fill(255,255,255);
    noStroke();
    rect(0,0,800,10);
    popMatrix();
  }
  
  
}


