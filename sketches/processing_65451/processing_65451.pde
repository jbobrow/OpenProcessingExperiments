
/******************************************
 *  Color Response
 *
 *  This draws fading spheres of color using the x and y possitions of the mouse.  
 *
 *  Angela Stempel 07/14/12
 ******************************************/
int ellipseDiam = 20;
void setup() {
  size(1100, 400);
  smooth();
  noCursor();
}

void draw() {
  // previous positions of the circle
  //ellipse(mouseX, mouseY, ellipseDiam, ellipseDiam);

  fill(abs(mouseX-(2*mouseY)), mouseY, mouseX-mouseY, 5); // for trail color
  noStroke();
  rect(0, 0, width, height);
  
  if (mousePressed == true) {
      fill (mouseX, mouseY, abs(mouseX-mouseY), 70);
      //ellipsePulse(mouseX, mouseY, abs(ellipseDiam - mouseY) + 10, abs(mouseY-50) + 10);
       noStroke(); 
       ellipse(mouseX, mouseY, ellipseDiam - mouseY, abs(mouseY-50));

  }
  
   else {
      fill (120, 20);
      noStroke();
      rect(0, 0, width, height);
   }
}



