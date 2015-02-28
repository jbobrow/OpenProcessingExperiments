
PImage img;

void setup(){
  size(400, 380);
  img = loadImage("droplet.jpg");
  smooth();
  frameRate(20);
}
 
void draw() {
  float diameter = random(300);
  noFill();
  image(img,-44,0);
  ellipse(200, 190, diameter, diameter/2);
  ellipse(200, 190, diameter, diameter/2);
  ellipse(200, 190, diameter, diameter/2);
  ellipse(200, 190, diameter, diameter/2);
  ellipse(200, 190, diameter, diameter/2);
  ellipse(200, 190, diameter, diameter/2);
  strokeWeight(random(1,3));
  stroke(255,255,255);
}
 
void mouseMoved() {
  strokeWeight(random(5,50));
  stroke(255,255,255,random(1,100));
}
 


