
size(400, 400);
smooth();
noFill();


int x = 0;
int incrementation = 10;
strokeWeight(2);

background(0);
stroke(255);

while ( x < width ) {
  pushMatrix();
  translate(x,0);

  beginShape();
  curveVertex(292.0, 147.0);
  curveVertex(0.0, 0.0);
  curveVertex(51.0, 233.0);
  curveVertex(-6.0, 400.0);
  curveVertex(-101.0, 426.0);
  endShape();
  
  x = x + incrementation;
  popMatrix();
}
                
