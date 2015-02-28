
//http://www.openprocessing.org/visuals/?visualID=39630
/* @pjs preload="1.jpg,2.png,4.png,5.png,6.png"; */

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

float r = 71;
float g = 175;
float b = 242;
void setup() {
  size(600, 450);
  background(0);


 img= loadImage("1.png");
 background(img);
 
 img2= loadImage("2.png");
 img3= loadImage("3.png");
 img4= loadImage("4.png");
 img5= loadImage("5.png");
 
 cursor(img2);
}
 
 
void draw() {
   // colormode range set to size of sketch
  strokeWeight(20);
  strokeCap(SQUARE);
  stroke(r, g, b); // change the stroke Hue
  line(pmouseX, pmouseY, mouseX, mouseY);

if (keyPressed) {
  if (key == '1') {
   cursor(img2);
r = 71;
g = 175;
b = 242;
 
 
}
}

if (keyPressed) {
  if (key == '2') {
   cursor(img3);
   r = 105;
  g= 240;
 b= 53;
}
}


if (keyPressed) {
  if (key == '3') {
   cursor(img4);
   r = 240;
  g= 53;
 b= 237;
}
}

if (keyPressed) {
  if (key == '4') {
   cursor(img5);
   r = 240;
  g= 156;
 b= 22;
}
}


 
// save the image press any key
if (keyPressed) {
  if (key == ' '){
  background(img);
 
}
}
}



