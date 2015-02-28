
void setup() {
  size(600, 500);
}
 
void draw() {
  background(0); //black background
 
 
  fill(255);  //set fill to white for eyeball
    if (mousePressed) {
     fill(204,0,0); } //changes to red on mouseclick
 
  ellipse(224, 147, 50, 50);  //draw white circle over left eye
  ellipse(362, 147, 50, 50);  //draw white circle over right eye
  fill(0);  //set fill to black for eye pupil
  float mx1 = constrain(mouseX, 212, 237);  //uses mouse x coordinate, but only within x=212-237
  float my1 = constrain(mouseY, 135, 159);  //uses mouse y coordinate, but only within x=135-159
  ellipse(mx1, my1, 15, 15);  //draws a black left eye pupil using constrained x and y coordinates
  float mx2 = constrain(mouseX, 350, 374);  //uses mouse x coordinate, but only within x=350-374
  float my2 = constrain(mouseY, 135, 159);  //uses mouse y coordinate, but only within x=135-159
  ellipse(mx2, my2, 15, 15);  //draws a black right eye pupil using constrained x and y coordinates
}
void mouseMoved()// This Triforce was thanks to the Design of OpenProcessing User- Jason T
{
  fill(255, 255, 0);
  triangle(mouseX, mouseY - 50, mouseX - 40, mouseY + 25, mouseX + 40, mouseY + 25);
  fill(0);
  triangle(mouseX, mouseY + 25, mouseX - 20, mouseY - 13, mouseX + 20, mouseY - 13);
  
}


