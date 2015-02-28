
void setup() {
  //size of the project
  size(700,700);
  //the backgroud colour
  background(0);
}
 
void draw() {
 // makes the outline stroke smooth
  smooth();
  //Don't colour in the circle
  noFill();
  //hoe thick the outline stroke is
  strokeWeight(1);
  //makes the colour for the strokes random
  stroke(random(255),random(255),random(255), 50);
  //shape of the image 
  ellipse(mouseX,mouseY,mouseY,mouseX);
}
 
void mousePressed() {
  background(mouseX/2,mouseY/2,50,100);
}
 
void keyPressed() {
  background(0);
}

