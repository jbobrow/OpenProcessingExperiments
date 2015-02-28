


Plus1[] p1 = new Plus1[75];
Plus2[] p2 = new Plus2[75];
PImage plus1;
PImage plus2;
PImage plusfill;

void setup() {
  background(255);
  size(800, 600);
  
  for (int i = 0; i < p1.length; i++) {
    p1[i] = new Plus1(i *4 );
  }
  
   for (int i = 0; i < p2.length; i++) {
    p2[i] = new Plus2(i *4 );
  }
}

void draw() {
  
  for (int i = 0; i < p1.length; i++) {
  p1[i].drawplus1();
  p1[i].move();
  p1[i].bottom();
  }
  
  for (int i = 0; i < p2.length; i++) {
  p2[i].drawplus2();
  p2[i].move();
  p2[i].bottom(); 
}

PImage plusfill = loadImage("plusfill.png");
image(plusfill, 0, 0, 800, 600);
  
}

class Plus1 {
  
  float x;
  float y;
  float size;
  float yspeed;
  float xspeed;
  PImage plus1 =loadImage("plus1.png");

  Plus1(float tempD) {
    x = random(width);
    y = 0;
    size = tempD;
    yspeed = random(0.5, 2.5);
  }
  
  void drawplus1() {
    smooth();
    image(plus1, x, y-25, 50, 50);
  }
  
  void move(){
   y = y + yspeed/2;
   x = x + random(-2, 2);
  }
  
  void bottom() {
    if (y > height) {
      y = 0;
    }
  }
}

class Plus2 {
  
  float x;
  float y;
  float size;
  float yspeed;
  float xspeed;
  PImage plus2 = loadImage("plus2.png");

 Plus2(float tempD) {
    x = random(width);
    y = 0;
    size = tempD;
    yspeed = random(0.5, 2.5);
  }

  void drawplus2() {
    smooth();
    image(plus2, x, y-25, 50, 50);
  }
 
  void move(){
   y = y + yspeed/2;
   x = x + random(-2, 2);
  }
  
  void bottom() {
    if (y > height) {
      y = 0;
    }
  }
}



