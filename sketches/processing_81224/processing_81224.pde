
/* @pjs preload="18.jpg"; */ 
//source: http://www.openprocessing.org/visuals/?visualID=39630
PImage img; 
PImage img1;
float r = 120;

void setup() {
size(450, 337);
background(0);
img1= loadImage("pencil.png");
smooth();
img= loadImage("18.jpg");
noStroke();
image(img,0,0);
cursor (img1);
r = 0;
 
}

 
void draw() {
// line set to size of sketch
  strokeWeight(2);
  strokeJoin(ROUND);
  stroke(r);
  line(pmouseX, pmouseY, mouseX, mouseY);



}

void keyPressed(){
// when pressed space, clears canvas
  if (keyPressed) {
  if (key == ' ') {
  background(0);
  image(img,0,0);
  }}
}




