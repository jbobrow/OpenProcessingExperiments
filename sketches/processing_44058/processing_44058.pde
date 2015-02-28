
PImage img;
PFont font;
float angle = 0.1;


void setup() {
  img=loadImage("fan.jpg");
  size(425, 300);
  smooth();
}

void draw() {
 image(img, 0,0);
 
  translate(100, 75);
  rotate(angle);
  font = loadFont("Helvetica-Light-18.vlw");
  textFont(font);
  fill(255,20);
  text("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO", 0,0);
  
  translate(300, 200);
  angle += .4;
  font = loadFont("Helvetica-Bold-48.vlw");
  textFont(font);
  fill(255,50);
  text("OOOOOOOOOOO",-200, -149);
  
}


