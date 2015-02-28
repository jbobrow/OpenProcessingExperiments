
/*@pjs preload="apple_white.png";*/
/*@pjs preload="apple_logo.png";*/

PImage img;
PImage img2;
int a = 0;
int b = 0;
int c = 0;
int d, e;
int x = 0;
int y = 0;
int speed = 3;
int speed02 = 2;
int eSize = 10;

void setup() {
  stroke(222, 222, 222);
  smooth();
  noFill();
  size(450,450);
  img = loadImage("apple_white.png");
  img2 = loadImage("apple_logo.png");
  frameRate(30);
}

//apple move
void draw() {
  background(255);
  for(e = 0; e <= height; e +=50) {
    for(d = 0; d <= width; d +=50) {
      ellipse(d, e, eSize, eSize);
    }
  }
  image(img2, x, y, 249, 300);
  image(img, x, y, 249, 300);
  x = x + speed;
  y = y + speed02;
  if (x > 201 || x < 0) {
    speed = -speed;
  }
  if (y > 150 || y <= 0) {
    speed02 = -speed02;
  }
}

//logo display
void mouseDragged() {
  image(img2, x, y, 249, 300);
  tint(a, b, c);
}

//apple clear
void mousePressed() {
  image(img, x, y, 249, 300);
  tint(a, b, c, 0);
}

void mouseReleased() {
  image(img, x, y, 249, 300);
  tint(a, b, c);
}

//color change
void mouseMoved() {
  tint(a, b, c);

  a ++;
  if(a > 255){
    a = -a;
  }
    
  b += 5;
  if(b >255){
    b = -b;
  }
    
  c += 10;
  if(c > 255){
    c = -c;
  }
}



