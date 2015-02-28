
int _num = 10;
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    
    thisCirc.drawMe();
  }
}

class Circle {
  float x, y;
  float radius;
  float mx=mouseX;
  float my=mouseY;
  color linecol, fillcol;
  float alph;
  Circle() {
    x = mx+random(300);
    y = my+random(300);
    radius = random(50) + 15;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    fill(255);
    noStroke();
    ellipse(x, y, 20, 20);
    fill(255,2);
    rect(0,0,width,height);
  }
}
void keyPressed(){  

  saveFrame("w.jpg");  

} 



