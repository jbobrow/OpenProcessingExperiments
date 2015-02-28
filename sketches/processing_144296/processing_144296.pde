
// SOS iDesign
// KU DYNAMIC MEDIA
// Eunjin Park
 
void setup() {
  size(600, 600);
  smooth();
  background(255);
  frameRate(1);
}
 
void draw() {

  noStroke();
  fill(212, 244, hour()*4); 
  ellipse(300, 300, hour()*25, hour()*25);
 
  fill(217, minute()*4,250);
  ellipse(300, 300, minute()*10, minute()*10);
 
 strokeWeight(2);
  stroke(255);
  fill(150);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*second()));
  ellipse(150, 150, 80, 80);
  popMatrix();

}
