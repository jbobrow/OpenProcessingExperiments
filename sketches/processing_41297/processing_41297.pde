
// Exercise: 3-2

void setup() { 
  size (300, 300);
  frameRate (30);
}


void draw() {

  background (175);
  smooth ();

  rectMode (CENTER);
  ellipseMode (CENTER);


  // HAIR - - 
  // sroke in the middle
  strokeWeight (1);
  stroke (0);
  line (pmouseX, pmouseY-60, mouseX, mouseY-20); // Right rotation point! Easy, Just to flip the "pmouse" from the code on next line.
  /*
  line (mouseX, mouseY-60, pmouseX, pmouseY-20); // The rotation is from the wrong point.
   line (mouseX, mouseY-60, mouseX, mouseY-20); // Previous version when it just follows the mouse, no ohter effects.
   line (15, 25, 150, 75); // Static version
   */


  // stroke angel to left
  stroke(0, 255, 0, 255);
  // line(125, 25, 150, 75);
  line(pmouseX-20, pmouseY-60, mouseX, mouseY-39); // The reason why the first point has "pmouse" is because that point is the rotation point.
  // line(mouseX-20, mouseY-60, mouseX, mouseY-39); // Earlier version.

  // stroke angel to right
  stroke(0, 255, 0, 255);
  // line(175, 25, 150, 75);
  line(pmouseX+1, pmouseY-39, mouseX+20, mouseY-60); // The reason why the first point has "pmouse" is because that point is the rotation point.
  // line(mouseX+1, mouseY-39, mouseX+20, mouseY-60); // Earlier version.

  // HAIR STOP - -


  // ARMS START
  strokeWeight(2);
  stroke(0);
  line (mouseX-45, mouseY-4, mouseX, mouseY+50); // Left arm.
  line (mouseX+10, mouseY+40, mouseX+45, mouseY-4); // Right arm.
  // line (150, 150, 190, 125);
  // line (150, 150, 110, 125);
  // ARMS STOP



  // BODY START - -
  noStroke();
  fill(50, 0, 100, 250);

  // triangle
  // quad (120, 100, 180, 100, 150, 240, 150, 240); // tog fel på quad & arc först
  quad (mouseX-30, mouseY-12, mouseX+30, mouseY-12, mouseX, mouseY+120, mouseX, mouseY+120); 

  /*
  Step-by-step:
   1) quad (mouseX-30, 100, 180, 100, 150, 240, 150, 240);
   2) quad (mouseX-30, 100, mouseX+30, 100, 150, 240, 150, 240);
   - - - These two rows controls the top left point - - - 
   3) quad (mouseX-30, mouseY-12, mouseX+30, mouseY-12, 150, 240, 150, 240); // Controls the top right point
   4) quad (mouseX-30, mouseY-12, mouseX+30, mouseY-12, 150, mouseY+120, 150, mouseY+120); // mouseY+120 Controls the top right point.
   5) 150 = mouseX
   */


  // BODY STOP - -

  // HAT START - - 
  // halvformad circle
  fill(255);
  arc (mouseX, mouseY-12, 60, 55, -PI, 0);
  // arc (149, 99, 60, 55, -PI, 0);

  rectMode(CORNER);
  rect(mouseX-60, mouseY-16, 55, 4);
  // rect(90, 95, 55, 4);
  // HAT STOP - -

  // EYES - -

  // overall eyes
  fill(0, 255, 255, 255);
  noStroke();
  ellipse (mouseX-15, mouseY, 10, 20); // To put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 135, 135 - 150 = -15)
  ellipse (mouseX+15, mouseY, 10, 20); // TO put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 135, 150 - 135 = +15)


  // pupiller
  // fill(0);
  fill (mouseX, 0, mouseY);  // Changes color of the eyes.
  ellipse (mouseX-15, mouseY, 5, 10); // To put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 135, 135 - 150 = -15)
  ellipse (mouseX+15, mouseY, 5, 10); // To put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 163, 163 - 150 = +13)
  // ellipse (mouseX-15, mouseY, 5, 10); // To put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 135, 135 - 150 = -15)
  // ellipse (mouseX+15, mouseY, 5, 10); // To put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 163, 163 - 150 = +13)
  // ellipse (135, 115, 5, 10); // Functions from a previous version.
  // ellipse (163, 115, 5, 10); // Functions from a previous version.
  // EYES STOP - -


  // MOUTH START - -
  strokeWeight(3);
  stroke(255, 0, 0, 255);
  noFill();
  arc (mouseX+4, mouseY+35, 20, 25, -PI, -PI / 2);
  // arc (156, 148, 20, 25, -PI, -PI / 2);
  // MOUTH STOP - - 

  // FEETS START - -
  ellipseMode(CORNER);
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY+115, 35, 10); // Lite svårt att räkna ut.
  ellipse (mouseX-35, mouseY+115, 35, 10); // Lite svårt att räkna ut.
  // ellipse(115, 232, 35, 10);
  // ellipse(150, 232, 35, 10);
  // FEETS STOP - -
}

void mousePressed () {

  println ("Take me to your leader");
}


