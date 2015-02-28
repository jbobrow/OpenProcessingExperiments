
Fish[] fishy=new Fish[20];
void setup() {
  size(500, 500);
  float x = 70;
  float y = 280;
  for (int i =0; i<20;i++) {
    fishy[i] = new Fish (color(random(50), random(255), random(255)), x, y, 2);
    x+=random(width);
    y+=random(height);
    if (x> width) {
      x=random(width);
      y=random(height);
    }
  }
}
void draw() {
  background(#629DE3);
  rectMode(500);
  for (int i =0; i<20;i++) {
    fishy[i].display();
    if (fishy[i].hitTest(mouseX, mouseY)) {
      fishy[i].y-=height;
    }
       fishy[i].swim();
  }
}

class Fish { 
  color c;
  float x;
  float y;
  float xspeed;
  boolean hitTest(float mX, float mY)
  {
    if (dist(x, y, mX, mY)<50)
      return true;
    else return false;
  }
  Fish(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    x = tempXpos;
    y = tempYpos;
    xspeed = tempXspeed;
  }
  void display() {
    stroke(0);
    fill(c);
    triangle(x, y, x+25, y+20, x+25, y-20);
    ellipse(x, y, 30, 25);
    fill(255);
    ellipse(x-5, y-3, 10, 10);
    frameRate(35);
  }
  void swim() {
    y+= random (-.5,.5);
    x = x -= xspeed;
    if (x < -10) {
      x = width;
      x += random (-100,100);
      y =random(height);
     
    }
  }
}


