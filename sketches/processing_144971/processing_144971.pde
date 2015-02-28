
int _num = 10;     
Circle[] _circleArr = {
}; 

void setup() {
  size(600, 600);
  background(255);
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
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


class Circle {
  float x, y, x1, y1, x2, y2;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  float rot;

  Circle() {
    
    x1 = random(width);
    y1 = random(height);
    x2 = random(width);
    y2 = random(height);
  
    linecol = color(241,95,95);
    fillcol = color(241,95,95);
    alph = random(30, 150);

    xmove = random(-10,10);
    ymove = random(-10,10);
    rot=radians(x*2);
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
  ellipse( x1, y1, x2, y2);

    stroke(linecol, 100);
    noFill();
    ellipse(x, y, 100, radius);
    ellipse(x1, y1, radius, 100 );
    ellipse(x2, y2, 100, 100);
  }

  void updateMe() {
    x += xmove;
    y += ymove;
    x1 += xmove*0.1;
    y1 += ymove*0.1;
    x2 += xmove*0.1;
    y2 += ymove*0.1;

    if (x > (width+radius)) {
      x=width+radius;
      xmove= -xmove;
    }
    if (x < (0-radius)) {
      x=0-radius;
      xmove= -xmove;
    }
    if (y > (height+radius)) {
      y=height+radius;
      ymove= -ymove;
    }
    if (y < (0-radius)) {
      y=0-radius;
      ymove= -ymove;
    }

    if (x2 > (width+radius)) {
      x2=width+radius;
      xmove= -xmove;
    }
    if (x2 < (0-radius)) {
      x2=0-radius;
      xmove= -xmove;
    }
    if (y2 > (height+radius)) {
      y2=height+radius;
      ymove= -ymove;
    }
    if (y2 < (0-radius)) {
      y2=0-radius;
      ymove= -ymove;
    }
    drawMe();
  }
}
