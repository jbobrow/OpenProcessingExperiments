
  float mx;
  float my; 
  float easing = 0.25; //speed of eye movement
  int esize = 25;  //eye size

void setup() {
  size(500, 400); //canvas size

}

void draw() {
  
  background(0);
  if(abs(mouseX - mx) > 0.1) { //continuously checks the position of the mouse's x-coordinate against the position of the eye's x-coordinate.
    mx = mx + (mouseX - mx) * easing; //moves the eye towards the position of the mouse, at the speed of the variable "easing".
  }
  if(abs(mouseY - my) > 0.1) { //same as above, but for the y coordinate of the eye.
    my = my + (mouseY- my) * easing;
  }
  
  float distance = esize * 2;
  
  float mx1 = constrain(mx, 285, 335); // eye 1's x boundaries
  float my1 = constrain(my, 135, 185);  // eye 1's y boundaries
  float mx2 = constrain(mx, 165, 215); // eye 2's x boundaries
  float my2 = constrain(my, 135, 185);  // eye 2's y boundaries

  fill(255); //switches to white
  ellipse(310, 160, 80, 70); //draws the eyes
  ellipse(190, 160, 80, 70);
  fill(0); //switches to black
  ellipse(mx1, my1, esize, esize); //draws the pupils
  ellipse(mx2, my2, esize, esize);
  fill(255,0,0); //switches to red
  ellipse(250, 250, 225, 40); //draws the mouse
  fill(0); 
  rect(170, 249, 165, 1); //draws the lip partition

} 









