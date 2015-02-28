
void setup() {
  size(600, 600);
  background(0);
  smooth();
}
 
 
void draw() {
  pushMatrix();
  translate(300, 300);
  fill(255);
  ellipse(0, 0, 600, 450);
  strokeWeight(3);
  
  line(-60, -120, 250, 0);
  line(60, 120, -250, 0);
  fill(#03FFDF);

  ellipse(-160,-60,120,120);
  ellipse(160,60,120,120);
  line(-60,-120,60,120);
  popMatrix();
}


