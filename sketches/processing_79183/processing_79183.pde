
//http://www.openprocessing.org/visuals/?visualID=39630

void setup() {
  size(600, 450);
  background(0);

  colorMode(HSB); // colormode range set to size of sketch
 img= loadImage("1.jpg");
}
 
float Hue = random(1); //random
 
 
void draw() {
  image(img,0,0);
  filter(BLUR);
  colorMode(HSB, 600, 200, 300); // colormode range set to size of sketch
  strokeWeight(mouseX/80);
  strokeJoin(ROUND);
  stroke(Hue+mouseX/40, 100, 500); // change the stroke Hue
  line(pmouseX, pmouseY, mouseX, mouseY);



}
void mousePressed() {
  Hue=random(40, 600);
}
 
// save the image press any key
void keyPressed() {
  background(0);
 
}

PImage img;

