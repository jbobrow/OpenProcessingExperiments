
float angle = 0.0;
float offsetX = 300;
float offsetY = 250;
float scalar = 200;
float speed = 0.05;
float x;
float y;
int cnt = 0;
 
PImage backg;
PImage doll;
PImage clothes1;
PImage clothes2;
PImage clothes3;
PImage tara;
  
void setup() {
  size(600, 300);
  smooth();
  backg = loadImage("backg.jpg");
  doll = loadImage("doll.png");
  clothes1 = loadImage("1_1.png");
  clothes2 = loadImage("2_2.png");
  clothes3 = loadImage("3_2.png");
  tara = loadImage("tara.png");
  imageMode(CENTER);
   
  x = offsetX + cos(angle) * scalar;
  y = offsetY + sin(angle) * 20;
}
  
void draw() {
  background(255);
  image(backg, 300, 150, width, height);
   
 
  // front
  if(sin(angle) < 0) {
    image(doll, 300, 230);
    x = offsetX + cos(angle) * scalar;
    y = offsetY + sin(angle) * 20;
    image(clothes2, x, y);
    if(x > 296 && x < 306) {
      cnt++;
      if(cnt == 15) {
        cnt = 0;
        angle += speed;
      }
    } else {
      angle += speed;
    }
  }
  // back
  else {
    x = offsetX + cos(angle) * scalar;
    y = offsetY + sin(angle) * 20;
    image(clothes2, x, y);
    image(doll, 300, 230);
    angle += speed;
  }
  
 
 
 
 
   
/*
  float i = random(3);
  float x = 0;
  float y = 0;
  float d;
   
  x = random(200, 400);
  y = random(100, 200);
   
  if(int(i) == 1)  {
      image(clothes1, 303, 189);
      image(clothes2, 303-x, 189+y/2);
      image(tara, 303+x/2, 198-y);
      image(clothes3, 303+x/2, 198-y/3);
  } else if(int(i) == 2) {
      image(clothes2, 295, 153);
      image(tara, 295, 35);
      image(clothes1, 295+x, 153-y);
      image(clothes3, 295-x/6, 153+y/3);
  } else if(int(i) == 3) {
      image(clothes3, 302, 170);
      image(clothes1, 302+x, 170+y);
      image(clothes2, 302-x, 170+y/2);
      image(tara, 302+x/2, 170-y);
  } else {
      x = random(150, 450);
      y = random(50, 250);
      image(clothes1, x, y);
      image(clothes2, y, x);
      image(tara, 20+2*4, 35+y);
      image(clothes3, 302-y, 170+y*3);
  }
*/
}


