
void setup(){
  size (1000,1000);
  smooth();
  background(0);
}

void draw (){
  if (mousePressed){
    fill(255,243,5);
  stroke(0);
  beginShape();
  curveVertex(pmouseX, pmouseY); // the first control point
  curveVertex(mouseX, mouseY); // is also the start point of curve
  curveVertex(400, 300);
  curveVertex(mouseX, mouseY);
  curveVertex(mouseX, mouseY);
  curveVertex(400, 300); // the last point of curve
  curveVertex(400, 300); // is also the last control point
  endShape();
  } else {
    fill(255,8,24);
  }
  stroke(0);
  beginShape();
  curveVertex(pmouseX, pmouseY); // the first control point
  curveVertex(mouseX, mouseY); // is also the start point of curve
  curveVertex(500, 400);
  curveVertex(mouseX, mouseY);
  curveVertex(mouseX, mouseY);
  curveVertex(500, 400); // the last point of curve
  curveVertex(500, 400); // is also the last control point
  endShape();
  
}
  


