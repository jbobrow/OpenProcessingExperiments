
// example code from Listing 6.1 of Perrson (2011)
// draw a few circles at the click of the mouse
// added a "Circle" class definition from Listing 6.2 and 6.3
// added the movement manipulation from Listing 6.4
// schien@mail.ncku.edu.tw

// ============== Main Code =================
int _num = 10;          
Circle[] _circleArr = {};  // define an array of circles
void setup() { 
  size(500,300); 
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
    Circle thisCirc = new Circle(); // create an instance
    thisCirc.drawMe();  // ask the instance to draw itself
    _circleArr = (Circle[])append(_circleArr, thisCirc);  // add the new instance to the array
  }
} 

// ============== Object =================

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
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
    drawMe();
  }
}


