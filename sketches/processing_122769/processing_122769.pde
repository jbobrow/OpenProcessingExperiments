
//Kang-Yu Om Liu 
//moving circle
//20131204

int _num = 10;
Circle[] _circleArr = {
};//array name

void setup() {
  size(700, 200);
  background(255);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  background(255);
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
    thisCirc);//new add
  }
}

class Circle {
  //Object properties
  float x, y;
  float radius;
  color linecol, fillcol; 
  color rectcol;
  float alph;
  float xmove, ymove;

  //object constructor
  Circle () {
    x =random(width);
    y =random(height);
    radius = random(100)+10;
    linecol = color(random(205), random(0), random(50));
    fillcol = color(random(205), random(0), random(50));
    rectcol = color(random(50),random(0),random(25));
    alph = random(100, 155);
    xmove = random(5) - 2;
    ymove = random(5) - 2;
  }

  //object method
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
    fill(rectcol,20);
    noStroke();
    rectMode(CENTER);
    rect(x,y,radius*3,radius/6);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > width-radius) { 
      x=radius;
     xmove =-xmove;
    }
    if (x < radius) { 
      x=radius;
      xmove = -xmove;
    }
    if (y > (height-radius)) { 
      y=height-radius;
      ymove =-ymove;
    }
    if (y < radius) { 
      y=radius;
      ymove = -ymove;
    }
    drawMe();
  }
}



