
/*

Light Switch Disco Dance
Daria Lanz
daria@darialanz.com
June 2009
*/

PImage myImage;

boolean button = false;

int x = 300;
int y = 50;
int w = 100;
int h = 75;

void setup() {
  size(600,600);
};

void draw() {
  
  if (button) {
    background(random(255), random(255), random(255));
    myImage = loadImage("dancers.png");
    image(myImage,0,0);
    stroke(0);
  } else {
    background(0);
    stroke(255);
  };
  
  fill(255,0,0,150);
  ellipse(x,y,h,h);
  
};

void mousePressed() {
  
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  };
  
};

