
int swirls = 50;
//Change false to true for a "head" on the end of each worm.
boolean head = true;
Swirly[] swirl;

void setup() {
  size(500, 500);
  swirl = new Swirly[swirls];
  for(int i=0; i<swirls; i++) {
    swirl[i] = new Swirly(random(0, width), random(0, height));
  }
}

void draw() {
  background(255);
  for(int i=0; i<swirls; i++) {
    swirl[i].draw();
  }
}

class Swirly {
  float turniness, angle, x, y;
  float[][] points = new float[2][0];
  int trailsize = 100;
  color swirlcolor = color(random(0, 255), random(0, 255), random(0, 255));
  
  Swirly(float tempx, float tempy) {
    x = tempx;
    y = tempy;
    turniness=1/random(25, 50);
    angle=random(0, 1);
  }
  
  void draw() {
    calc();
    
    points[0] = append(points[0], x);
    points[1] = append(points[1], y);
    if(points[0].length>trailsize) {
      points[0] = subset(points[0], points[0].length-trailsize);
      points[1] = subset(points[1], points[1].length-trailsize);
    }
    
    noFill();
    stroke(swirlcolor);
    for(int i=0; i<points[0].length; i++) {
      point(points[0][i], points[1][i]);
      if(head) {
        ellipse(points[0][points[0].length-1], points[1][points[1].length-1], 10, 10);
      }
    }
  }
  
  void calc() {
    if(random(0, 50) < 1) {
      if(random(0, 1) < 0.5) {
        turniness=1/random(25, 50);
      } else {
        turniness=1/random(-25, -50);
      }
    }
    if(x<0) {
      x=width;
    }
    if(x>width) {
      x=0;
    }
    if(y<0) {
      y=height;
    }
    if(y>height) {
      y=0;
    }
    angle += turniness;
    x += sin(angle);
    y += cos(angle);
  }
}

