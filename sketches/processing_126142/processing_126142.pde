
//Clark Li
//This practice try to make the image when something falling down on water, and the ripple what it maked.

int _num = 10;
Circle[]_circleA= {
};
float xstart, xnoise, ystart, ynoise;
void setup() {
  size(800, 400);
  background(200);
  frameRate(24);
  xstart = random(10);
  ystart = random(10);
  smooth(20);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}


void draw() {
  background(200);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }


  for (int i=0; i<_circleA.length; i++) {
    Circle thisCirc =_circleA[i];
    thisCirc.updateMe();
  }
}


void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  noStroke();
  fill(grey, alph);
  ellipse(0, 0, edgeSize, edgeSize/2);
  popMatrix();
}
void mousePressed() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleA=(Circle[])append(_circleA, thisCirc);
  }
}
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 2;
    linecol = color(255, random(255));
    fillcol = color(255, random(255));
    alph = random(255);
    xmove=random(5)-2;
    ymove=random(5)+2;
  }
  
  
  void drawMe() {  //real circle
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    //noStroke();
    //fill(200,50);
    //ellipse(x+random(100), y-random(100), radius*3, radius*3);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { 
      x=0-radius;
    }
    if (x < (0-radius)) { 
      x=width+radius;
    }
    if (y > (height+radius)) { 
      y=0+radius;
    }
    if (y < (0-radius)) { 
      y=0;
    }
    boolean touching = false;
    for (int i=0; i<_circleA.length; i++) {
      Circle otherCirc = _circleA[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          float mid2x, mid2y;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(0, 100);
          fill(random(15));
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
          mid2x = (x+150 + otherCirc.x)/2;
          mid2y = (y+150 + otherCirc.y)/2;
          stroke(30, 100);
          noFill();//(random(10));
          overlap *= 5;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
    drawMe();
  }
}



