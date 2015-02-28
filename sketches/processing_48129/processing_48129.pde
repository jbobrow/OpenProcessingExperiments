
//author:Robertlun,ncku arch
//purpose: homework.fall,falling,fallen
//concept:press mouse adding flashing eggs!
//reference: from the teacher"Sheng-Fen Nik Chien."


// THE MAIN PART
int _num = 3;         
Circle[] _circleArr = {};  
void setup() {
  size(700,400);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
 
void draw() {
  background(255);
  for(int i=0; i<_circleArr.length; i++) {
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
 
// THE OBJECT PART
 
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
    linecol = color(0, 0, random(255));
    fillcol = color(0, 0, random(255));
    alph = random(255);
    //xmove = random(5) - 5;
    ymove = random(7) - 7;
  }
 
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    noStroke();
    fill(random(255), alph);
    ellipse(mouseX, mouseY, radius, radius);
    noStroke();
    fill(random(255), alph);
    ellipse(x, y, radius*3, radius*3);
  }
   
  void updateMe() {
    x -= xmove;
    y -= ymove;
    //if (x > (width+radius)) { x = 0 - radius; }
    //if (x < (0-radius)) { x = width+radius; }
    if (y > (height-radius)) { y = height- radius; }
    //if (y < (0-radius)) { y = height+radius; }
    
    // THE LINE BETWEEN EACH EGG
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x);
          midy = (y + otherCirc.y);
          stroke(255, 100);
          noFill();
          overlap *= -10;
          line(midx, midy, overlap,midx);
        }
      }
    }
    drawMe();
  }
}


