
//Complexity
//Draw a few circles 
//Test 018 [Date:20131204] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 林瑞勛

int _num = 10;
Circle[] _circleArr = {
}; 

void setup() {
  size(600, 300);
  background(255);
  smooth();
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
    _circleArr =(Circle[])append(_circleArr, thisCirc);
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
    radius = random(30) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(200);
    xmove = random(10)-5;
    ymove = random(5);
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 5, 5);
  }
  void updateMe() {
    x += xmove;
    y += ymove;

    if (x > width-radius) { 
      x=width-radius;
      xmove = -xmove;
    }
    if (x <= radius) { 
      x=radius;
      xmove = -xmove;
    }
    if (y > height-radius) { 
      y=height-radius;
    }
    if (y <= radius) { 
      y=radius;
      ymove = -ymove;
    }
    
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        if ((dis-radius-otherCirc.radius) < 0) {
          touching = true;
          break;
        }
      }
    }
    if (touching) {
      if (alph > 0) { 
        alph--;
      }
    } 
    else {
      if (alph<255) { 
        alph += 2;
      }
    }
    drawMe();
  }
}



