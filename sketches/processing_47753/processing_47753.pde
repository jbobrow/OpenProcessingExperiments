
int _num=10;
Circle[] _circleArr= {
};
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  // frameRate(30);
  drawCircle();
}
void draw() {
 // background(255);
 fill(255,3);
 rect(0,0,width,height);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
void mouseReleased() {
  drawCircle();
}
void drawCircle() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

//-----------------
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
    //  linecol = color(random(255), random(255), random(255));
    fillcol = color(255, 255, 255);
    alph = 0;
    xmove=random(10)-5;
    ymove=random(10)-5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);

    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    // ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xmove*random(xmove);
    y += ymove*random(2);
    if (x > (width-1/2*radius)) { 
      x=0-radius;
    }
    if (x < (0-radius)) { 
      x=width-1/2*radius;
    }
    if (y > (height+radius)) { 
      y=0-radius;
    }
    if (y < (0-radius)) { 
      y=height+radius;
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
          strokeWeight(0.2);
          noFill();
         if(x>250){
          
         // line(x,y,0,y);
          //line(x,y,x,height);
           line(x,y,0,y);
          line(x,y,x,0);
         
          }
          else{
          line(x,y,width,y);
           line(x,y,x,height);
          
          }
          
          //overlap *= -1;
          //ellipse(midx, midy, overlap, overlap);
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
    //drawMe();
  }
}


