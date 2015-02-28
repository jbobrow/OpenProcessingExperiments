
// **TURKS AND CAICOS LANDSCAPE + RAIN**

PImage img0; PImage img1; PImage img2; PImage img3;
Rain[] rain = new Rain[500];

void setup() {
  size(400,720);
  img0 = loadImage("sea.jpg");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(5));
}
}
 
 
void draw() {

// tint image to simulate dark skies when mouse clicked
if (mousePressed == true) {
    tint(#C0C0C0);
  } else {
     tint(#FFFFFF);
  }

// tree images move with mouse movement at different fractions to simulate distance
image(img0, 0, -20+mouseY/50);
image(img1, 0, 100+mouseY/8);
image(img2, 0,  120+mouseY/5);
image(img3, 0,  120+mouseY/1.8);
  
// rain when mouse clicked
if (mousePressed == true) {
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
    }
  }
}
 
 
class Rain {
  float x, y, s;
 
  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
 
  void move() {
    y += s;
    if (y > height) y = 0;
  }
 
// modified rain colour, opacity and line length
  void display() {
    stroke(255,random(30,150));
    line(x,y,x,y + random(15));
  }
}


