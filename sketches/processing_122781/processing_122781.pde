
//Kang-Yu Om Liu 
//moving circle
//20131204

int _num = 15;
Circle[] _circleArr = {
};//array name

void setup() {
  size(700, 300);
  background(255);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  clearBackground();
  for (int i=0; i<_circleArr.length; i+=2) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  drawCircles();
}

void clearBackground() {
  background(255, random(162, 200));
}

void drawCircles() { 
  for (int i=0; i<_num; i+=2) { 
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, thisCirc);//new add
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
    rectcol = color(random(50), random(0), random(25));
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
    fill(rectcol, 20);
    noStroke();
    rectMode(CENTER);
    rect(x, y, radius*3, radius/6);
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
    
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i+=2) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x+otherCirc.x)/2;
          midy = (y+otherCirc.y)/2;
          stroke(0,100);
          noFill();
          overlap *= 3;
         rect(midx, midy, radius*2, radius*2);
          touching = true;
   
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


