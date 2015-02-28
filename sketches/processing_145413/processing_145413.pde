
PImage img;
PImage pic;
float mako = 0;
int lastX = 200;
int lastY = 200;
int hue1 = 359;
int hue2 = 40;
int hue3 = 82;

void setup() {
  img=loadImage("GlitchForrest.png");
  pic = loadImage("Pixels.jpg");
  size(800,450);
  smooth();
  noStroke();
  noFill();
  frameRate(20);
  colorMode(HSB,360,99,57);
}
void draw() {
  image(img,0,0);
  int randomX;
  int randomY;
  int randomH;
  int randomW;
  
 int mako = int(random(359));
  
 randomH = int(random(200));
 randomW = int(random(150));
 
 randomY = int(random(400));
 randomX = int(random(800));
 
 fill(mako,99,57);
 rect(randomX,randomY, randomW, randomH);

 
 if (second() % 4 == 0) {
   image(pic,randomX,randomY);
   rotate(random(PI));
   filter(POSTERIZE,5);
 }
}


