
//http://www.openprocessing.org/visuals/?visualID=39630
float r = 136;
float g = 13;
float b = 39;
void setup() {
  size(600, 450);
  background(0);

 img= loadImage("1.jpg");
 background(img);
 img3= loadImage("2.png");
 img4= loadImage("4.png");
 img5= loadImage("5.png");
 img6= loadImage("6.png");
 cursor(img3);

}
 
 
void draw() {
   // colormode range set to size of sketch
  strokeWeight(5);
  strokeJoin(ROUND);
  stroke(r, g, b); // change the stroke Hue
  line(pmouseX, pmouseY, mouseX, mouseY);
if (keyPressed) {
  if (key == 'p') {
   cursor(img4);
   r = 133;
  g= 50;
 b= 116;
}
}

if (keyPressed) {
  if (key == 'y') {
   cursor(img5);
   r = 246;
  g= 216;
 b= 4;
}
}
if (keyPressed) {
  if (key == 'b') {
   cursor(img6);
   r = 30;
  g= 115;
 b= 169;
}
}


 
// save the image press any key
if (keyPressed) {
  if (key == ' '){
  background(img);
 
}
}
}

PImage img;
PImage img3;
PImage img4;
PImage img5;
PImage img6;


