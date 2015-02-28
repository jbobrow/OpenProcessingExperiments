
/* @pjs preload= "Deb_Volume_02.png"; */


PImage img = loadImage("Deb_Volume_02.png");

void setup() { 
  size(670, 700);
  strokeWeight(1); 
  smooth(); 
  stroke(0, 102);
  noStroke();
} 
void draw() { 
  image(img, mouseX, mouseY);
  noFill();
  stroke(255, 255, 255);
  line(mouseX, 600, pmouseX, 80); 
  //  stroke(0, 0, 0);
  //  ellipse(mouseX, mouseY, pmouseX, pmouseY);
} 


