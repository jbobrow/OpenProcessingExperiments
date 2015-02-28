
// Emergence_Practice
// Fall_fallin_Fallen
// Try to create a bird view watching a moving chandelier
// Hanging light bulbs which controled by cable are jumping 
// The size of the light bulbs change
// Reference: http://www.openprocessing.org/sketch/122766
// Su Hsiu Pai shhsiupai"gmail.com

int _num=10;
Circle[]_circleArr= {
};

void setup() {
  size(1200, 600);
  background(0);
  smooth();
  strokeWeight(1);
  fill(150, 150);
  drawCircles();
}

void draw() {
  background(0);
  for (int i = 0; i<_circleArr.length; i++) {
    Circle  thisCirc =_circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num;i++) {
    Circle thisCirc= new Circle();
    thisCirc.drawMe();
    _circleArr=(Circle[])append(_circleArr, thisCirc);
  }
}

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  float colorctrl;
  Circle() {
    x= random(width);
    y= random(height);
    radius = random(100)+5;
    colorctrl = random(255);
    fillcol= color(colorctrl, colorctrl-random(80), random(0));
    alph=random(20, 100);
    xmove = random(10)-5;
    ymove = random(10)-5;
  }




  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    float dis_M = dist(x, y, width/2, height/2);

    ellipse(x, y, radius+dis_M/2, radius+dis_M/2);
   
    stroke(linecol, 150);
    noFill();
   
  }

  void updateMe() {
    x += xmove;
    y += ymove;

    if (radius>30) {
      if (x>(width+radius)) {
        x=0-radius;
      }
      if (x<(0-radius)) {
        x=width+radius;
      }
      if (y>(height+radius)) {
        y=0-radius;
      }
      if (y<(0-radius)) {
        y=height+radius;
      }
    }
    else {
      if (x > (width-radius)) {
        x = width-radius;
        xmove = -xmove;
      }
      if (x < (radius)) {
        x = radius;
        xmove = -xmove;
      }
      if (y > (height-radius)) {
        y = height-radius;
        ymove = -ymove;
      }
      if (y < (radius)) {
        y = radius;
        ymove = -ymove;
      }
    }







    boolean touching = false;
    for (int i = 0; i <_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis-radius -otherCirc.radius;
        if (overlap<0) {
          float midx, midy;
          float dis_M = dist(x, y, width/2, height/2);
          midx = (x+otherCirc.x)/2;
          midy=(y+otherCirc.y)/2;

          overlap *= -1;
          //ellipse(midx, midy, overlap, overlap);
          stroke(255, 90);
          noFill();
          //line(x,y,otherCirc.x, otherCirc.y);
          beginShape();
          vertex(x, y);
          bezierVertex(width/2, height/2, (x+otherCirc.x)/2, (y+otherCirc.y)/2, otherCirc.x, otherCirc.y);
          endShape();
          fill(255, 150);
          ellipse((x+otherCirc.x)/2, (y+otherCirc.y)/2, 10-dis_M*0.01, 10-dis_M*0.01);
        }
      }
    }



    drawMe();
  }
}




