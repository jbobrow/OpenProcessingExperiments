
void setup() {
  size(600, 400);
  
  noCursor();
}
 
void draw() {
  background(0);

  //Eye ball
  fill(255);
  ellipse(224, 147, 40, 40);
  ellipse(362, 147, 40, 40);
  
  //Pupils
  fill(0);
  float mx1 = constrain(mouseX, 212, 237);
  float my1 = constrain(mouseY, 135, 159);
  ellipse(mx1, my1, 15, 15);
  float mx2 = constrain(mouseX, 350, 374);
  float my2 = constrain(mouseY, 135, 159);
  ellipse(mx2, my2, 15, 15);
}



