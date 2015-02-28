
// Demo Program for the lecture on "Emergence"
// a program to draw circles using objects
// adopted from Pearson 2011
// for Design Programming Design, Fall 2013 NCKU
// schien@mail.ncku.edu.tw
//by jcL


int _num = 10;
Circle[] _circleArr= {
};//part 1
void setup() { 
  size(700, 200); 
  background(255); 
  strokeWeight(1); 
  //fill(150, 50); 
  drawCircles();
} 

void draw() { 
  //background(255);
  //!!for loop's second defined
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
    //new is the keypoint
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, 
    thisCirc);
  }
}


class Circle {
  //object properties
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;//part2
  //object constructor(object itself)
  Circle() {
    x = random(110,width+110);
    y = random(110,height+110);
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    //part 2
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }
  //object method
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius+10, radius+10);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, radius, radius);
    ellipse(x, y, radius, radius);
  }
  //object move way
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width-radius)) { 
     xmove=-xmove;
     }
     if (x < (radius)) { 
     xmove=-xmove;
     }
    if (y > (height-radius)) { 
      ymove=-ymove;
    }
    if (y < (radius)) { 
      ymove=-ymove;
    }
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(0, 100);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
          /*if ((dis-radius-otherCirc.radius) < 0) {
            touching = true;
            break;*/
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



