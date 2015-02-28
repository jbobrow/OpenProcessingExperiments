
PImage img;
Rain[] rain = new Rain[200];
 
void setup() {
  size(500, 300);
  img = loadImage("pumpkins.JPG"); 
  smooth();
 
  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(1));
  }
}
 
 
void draw() {
  image(img,0,0);
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
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
 
  void display() {
    stroke(255,random(50,150));
    line(x,y,x,y + random(40));
  }
}


