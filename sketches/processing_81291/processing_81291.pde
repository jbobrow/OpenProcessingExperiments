
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="berlin-1.jpg"; */ 
/* @pjs transparent=true; */

PImage img;
PImage bg;
float a = +2;
float b = +2;

void setup() {
  size(500, 388, P3D);
  img = loadImage("recordalone.gif");
 
  bg = loadImage("recordfromtop.jpg");
  noStroke();
 
 imageMode(CORNERS);
}

void draw() {
  background(bg);
  
  translate(width / 2, height / 2); /*changes the positon on screen*/
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateZ(PI/7);
  beginShape();
  texture(img);
  vertex(-150, -150, 0, 0, 0); /*changes the angle at middle*/
  vertex(150, -150, 0, img.width, 0);
  vertex(150, 150, 0, width, height);
  vertex(-150, 150, 0, 0, img.height);
  endShape();
  
}

/*Source: http://www.processing.org/learning/topics/texturequad.html*/

