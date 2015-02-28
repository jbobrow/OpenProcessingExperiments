
// Fall, Falling, Fallen
// Rainy day , rainwater fall on the water .
// Collision of water and water produce ripple . 
// lin wenyu  (ken3101462@gmail.com)

int _num = 5;
Circle[] _circleArr= {
};

void setup() {
  size(800, 300);
  background(250);
  frameRate(15);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  //background(0);
  for (int i=0;i<_circleArr.length;i++) {
    Circle thisCirc=_circleArr[i];
    thisCirc.updateMe();
  }
  fill(250, 100);
  rect(0, 0, width, height);
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
    x = random(110, width-110);
    y = random(110, height-110);
    radius = random(80)+10 ;
    //linecol = color(240, random(40, 100), 50);
    fillcol = color(100, random(50, 150), 250, 50);
    alph = random(200);
    xmove=random(20)-10;
    ymove=random(20)-10;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius, radius/3);
    //stroke(linecol, 150);
    //noFill();
    //ellipse(x, y, 10, 10);
    //rect(x, y, x+10, y+10);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width-radius/2)) { 
      //      x=0-radius;
      xmove=-xmove;
    }
    if (x < (0+radius/2)) { 
      //      x=width+radius;
      xmove=-xmove;
    }
    if (y > (height-radius/2)) { 
      //      y=0-radius;
      ymove=-ymove;
    }
    if (y < (0+radius/2)) { 
      //      y=height+radius;
      ymove=-ymove;
    }
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius/2 - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(50, 50);
          noFill();
          overlap *= 3;
          ellipse(midx, midy, overlap, overlap/3);//ripple
          stroke(0, random(10, 50));//rain line
          line(midx, midy, midx-20, midy-20);
          line(midx-22, midy-22, midx-50, midy-50);
          line(midx-52, midy-52, midx-70, midy-70);
          if ((width-mouseX)<=width/2 && (height-mouseY)<height) {
            stroke(0, random(40, 50));
            line(mouseX/2+midx, mouseY/2+midy, mouseX/2+midx-60, mouseY/2+midy-60);
            line(mouseX/2+midx-64, mouseY/2+midy-64, mouseX/2+midx-140, mouseY/2+midy-140);//rain line
            ellipse(mouseX/2+midx, mouseY/2+midy, overlap, overlap/3);//ripple
          } 
          else {
            stroke(0, random(40, 50));
            line(mouseX+midx, mouseY+midy, mouseX+midx-40, mouseY+midy-40);//rain line
            ellipse(mouseX/2+midx, mouseY/2+midy, overlap, overlap/3);//ripple
          }
        }
      }
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        if ((dis-radius/2-otherCirc.radius) < 0) {
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



