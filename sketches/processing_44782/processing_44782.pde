
PImage img;
float b;
 
void setup() {
 
  size(600, 500);
  img = loadImage("DSC00027_01.jpg");
  smooth();
  strokeCap(SQUARE);
 
}
 
void draw() {
 
image (img, 0,0);
  strokeWeight(8);
  map(mouseX, 100, width, 0, PI/20);
  translate(width/2, height/2);
  element(0);
 
}
 
void element(int recursion) {
   
  if (recursion < 12) {
    stroke(255, random(10, 80));
    b++;
    float a = sin(b);
    rotate(a/2000 * PI);
    line(0 + mouseX, 0, 0 + mouseX, height/3);
    pushMatrix();
    translate(0, height/5);
    rotate(noise(-PI/4, PI/4) + mouseX);
    scale(8);
    element(recursion + 1);
    popMatrix();
    pushMatrix();
    translate(0, -height/3);
    rotate(noise(-PI/4, PI/4) + mouseX);
    scale(0.7);
    element(recursion + 1);
    popMatrix();
  }
   
}
//http://www.openprocessing.org/visuals/?visualID=8008

