
//Kang-Yu Om Liu 
//Fall, Falling, Fallen
//20131211
//reference 'Getting Started with Processing',Casey Reas & Ben Fry

float angle = 0.0;
float offset = 150;
float scalar = 30;
float speed = 0.05;

int _num = 7;
Circle[] _circleArr = {
};//array name

void setup() {
  size(700, 300);
  background(119, 145, 138);
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
  background(119, 145, 138, random(22, 100));
  noStroke();
  fill(212,141,45,30);
  ellipse(50,50,200,200);
  ellipse(150,150,300,300);
  ellipse(350,150,400,400);
  ellipse(550,100,250,250);
  ellipse(650,250,250,250);
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
  color yellowcol;
  float alph;
  float xmove, ymove;

  //object constructor
  Circle () {
    x =random(width);
    y =random(height);
    radius = random(110)+10;
    linecol = color(random(47,152), random(76,177), random(90,187));
    fillcol = color(random(162, 223), random(57, 117), random(72, 129));
    yellowcol = color(random(209, 212), random(141, 175), random(45, 86));
    alph = random(100, 155);
    xmove = random(5) - 2;
    ymove = random(5) - 2;
  }

  //object method
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    arc(x, y, 40, 40, 0.52, 5.76);
    fill(fillcol, 23);
    arc(x+12, y+12, 60, 60, 0.52, 5.76);
    stroke(linecol,200);
    noFill();
    arc(x+5,y+2,20,20,0.52,5.76);
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
          midx = (x+otherCirc.x)/1.5;
          midy = (y+otherCirc.y)/1.5;
noStroke();
          fill(yellowcol, random(50,120));
          overlap *= 3;
          arc(midx, midy, 40, 40, 1, 2.20);
          
          fill(255, alph);
float cirx =offset +cos(angle)*scalar;
float ciry =offset +sin(angle)*scalar;
ellipse(cirx+200,ciry,80,80);
fill(212,141,45,10);
ellipse(cirx+200,ciry,100,100);
angle += speed;

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



