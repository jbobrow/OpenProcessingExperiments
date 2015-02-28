
PImage img;
PFont font;
float angle = 0.1;


void setup() {
  img=loadImage("fan.jpg");
  size(850, 600);
  smooth();
}

void draw() {
 image(img, 0,0);
 
  translate(200, 150);
  rotate(angle);
  font = loadFont("Helvetica-Light-18.vlw");
  textFont(font);
  fill(255,20);
  text("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO", 0,0);
  
  translate(250, 150);
  angle += .04;
  font = loadFont("Helvetica-Bold-48.vlw");
  textFont(font);
  fill(255,50);
  text("OOOOOOOOOOO",-200, -149);
  
}


