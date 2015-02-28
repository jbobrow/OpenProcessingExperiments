
// Digital world : use squares to mimic the digital world in computer
// Chang Kuo Ping from Industrial Design

int _num = 10;
Circle[] _circleArr = {
};
void setup() {
  size(500, 300);
  background(0);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(0);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, 
    thisCirc);
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
    radius = random(100) + 10;
    linecol = color(random(255), random(255), 
    random(255));
    fillcol = color(random(255), random(255), 
    random(255));
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    if(keyPressed){
    fill(255);
    }else{   
    fill(fillcol, alph);
    }
    rect(x, y, radius, radius);
    stroke(linecol, 150);
    noFill();
    //ellipse(x, y, 10, 10);
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
      y=0-radius;
    }
    if (y < (0-radius)) { 
      y=height+radius;
    }
    drawMe();
  }
}



