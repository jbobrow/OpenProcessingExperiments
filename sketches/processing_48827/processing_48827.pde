
void setup () {
  size (200, 200);
  smooth ();
}

void draw () {
background (127);
  //----------------------------------------------ELLIPSE
  fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX, mouseY, 100, 100);
  //----------------------------------------------EYES
  fill (0);
  ellipse (mouseX-20, mouseY-20, 10, 10);
  ellipse (mouseX+20, mouseY-20, 10, 10);
  //----------------------------------------------SMILE
  ellipse (mouseX+20, mouseY+20, 10, 10);
  ellipse (mouseX+10, mouseY+30, 10, 10);
  ellipse (mouseX, mouseY+30, 10, 10);
  ellipse (mouseX-10, mouseY+20, 10, 10);
  
  //----------------------------------------------TRIANGLE
  fill (239, 137, 17);
  triangle (mouseX, mouseY, 120, 125, 100, 90);
}

            
