
//float height= random (10,300);
//float width= random (10, 50);

void setup () {
  size (1500,500);
  background (255);
  smooth ();
}

void draw () {
  //ground
  rectMode (CENTER);
  rect (0, 450, 3000,100);
  fill (175);
  stroke (0);
  
    stroke (0);
  abs (mouseX-pmouseX); //the speed at which the mouse is moving
  line (pmouseX, pmouseY, mouseX, mouseY);

}

void keyPressed () {
  background (255);
  rectMode (CENTER);
  rect (0, 450, 3000,100);
  fill (175);
  stroke (0);
}

