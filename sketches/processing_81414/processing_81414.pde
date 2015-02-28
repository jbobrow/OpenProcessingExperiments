
// Robot 4: Media from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010
// recoded by Programming AtTemp 2012


PShape bot1;
PShape bot2;
PShape bot3;
PImage landscape;

float easing = 0.05;
float offset = 0;

PImage webImg;

void setup() {
  size (720, 480);
  String url = "http://processing.org/img/processing_cover.gif";
  // Load image from a web server
  webImg = loadImage(url, "gif");
}

void draw() {
  background(0);
  image(webImg, 0, 0);
}

//void setup() {
  //size(720, 480);
  //String urlLandscape = "http://1.bp.blogspot.com/-6qloRAZZaJU/ULbzo0o1y5I/AAAAAAAAMtE/eTN62z3H6xc/s1600/alpine.png";
  //bot1 = loadShape("https://docs.google.com/open?id=0BysMfTbvAUUVRGxOcUZ1Q0xGSFk");
  //bot2 = loadShape("robot2.svg");
  //bot3 = loadShape("robot3.svg");
  //landscape = loadImage(urlLandscape, "png");
  //smooth();
//}

//void draw() {
  // Set the background to the "landscape" image, this image
  // must be the same width and height as the program
  //background(landscape);
  
  // Set the left/right offset and apply easing to make
  // the transition smooth
  //float targetOffset = map(mouseY, 0, height, -40, 40);
  //offset += (targetOffset - offset) * easing;
  
  // Draw the left robot
  //shape(bot1, 85 + offset, 65);
  
  // Draw the right robot smaller and give it a smaller offset
  //float smallerOffset = offset * 0.7;
  //shape(bot2, 510 + smallerOffset, 140, 78, 248);
  
  // Draw the smallest robot, give it a smaller offset
  //smallerOffset *= -0.5;
  //shape(bot3, 410 + smallerOffset, 225, 39, 124);
//}
