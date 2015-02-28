
int _num = 15;
Circle[] cArray = {
};
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(255);
  for (int i=0; i< cArray.length; i++) {
    Circle thisCirc = cArray[i];
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
    cArray = (Circle[])append(cArray, thisCirc);
  }
}

//----------------------------------

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(50) + 20;
    linecol = color(255);
    fillcol = color(random(5), random(60,140), random(120,255));
    alph = random(90);
    xmove = random(2) - 5;
    ymove = random(2) - 5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    strokeWeight(random(4));
    noFill();
    ellipse(x, y, 30, 30);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { 
      x=0-radius;
    }
    if (x < (0-radius)) { 
      x=width+radius;
    }
    if (y > (height+radius)) { 
      y=0-radius;
    }
    if (y < (0-radius)) { 
      y=height+radius;
    }
    drawMe();
  }
}

void keyPressed(){
  saveFrame("bubbles-###.jpg");
}

