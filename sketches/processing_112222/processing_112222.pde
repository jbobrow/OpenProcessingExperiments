
float c = 0;


void setup() {
  smooth ();
  noFill();
  size(500,500);
  frameRate(100);
  noStroke();
  colorMode(HSB, 100);
}
 
void draw () {
  noStroke();
  fill(0, 5);
  rect(0,0,500,500);
  
  c+=0.1;
  if (c > 100) c = 0;
  stroke(c , 100, 100);
  noFill();
  
  beginShape ();
  curveVertex (0, 0);
  curveVertex (0, 0);
  curveVertex (mouseX, mouseY);
  curveVertex (500, 500);
  curveVertex (500, 500);
  endShape ();
  
  beginShape ();
  curveVertex (500, 0);
  curveVertex (500, 0);
  curveVertex (mouseX, mouseY);
  curveVertex (0, 500);
  curveVertex (0, 500);
  endShape ();
}


