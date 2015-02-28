
PImage img;
int num = 200;
Thing [] Things = new Thing[num];
 
void setup() {
  size(200, 500);
  frameRate(30);
  img = loadImage("1.jpg");
  background(img);
  smooth();
  noStroke();
   float x = 300;
    float y = 600;
  for (int i=0; i<num; i++) {
    Things[i] = new Thing(0,0);
    if (random(2) > 1) {
      Things[i].close1 = true;
    }
    if (img.get(int(x),int(y)) == color (255,255,255)) {
      i--;
    }
    else {
      Things[i] = new Thing(x,y);
    }
  }
}
 
void draw() {
   
  background(img);
 
  for (int i=0; i<num; i+=5) {
    Things[i].display();
    Things[i].move();
  }
} 
 
class Thing {
  float x;
  float y;
  float xv = random(1);
  float yv = random(1);
  boolean close1;
  boolean close2;
 
  Thing(float x_, float y_) {
    x = x_;
    y = y_;
  }
 
  void move() {
    y+=xv;
    x+=yv;
    if (x>width) x = 100;
    if (x<0) x = width;
    if (y>height) y = 500;
    if (y<0) y = height;
    if (img.get(int(x), int(y)) != color(255,0,0)) {     
        yv = yv;
    }
    if (img.get(int(x), int(y)) != color(255,255,255)) {
      if (random(2)>1) {     
        yv = -yv;
      }
      else {
        xv = -xv;
      }
    }    
  }
 
  void display() {
    fill(0,100);
    ellipse(x, y, 10, 10);
  }
}


