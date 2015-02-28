
PImage p;
PImage p2;
PFont f;


void setup() {
  size(400, 300);
  smooth();
  
  p=loadImage("federer-usopen.jpg");
  p2=loadImage("federer-usopen2-01.jpg");
  f=loadFont("HelveticaNeue-Bold-48.vlw");
}

void draw() {
  image(p,0,0);

if (mouseX <= width/2) {
  
  image(p2,0,0);
  textFont(f, 20);
  text("Huh WTF?!", 50,100);
}
else {
  image(p,0,0);
}}

