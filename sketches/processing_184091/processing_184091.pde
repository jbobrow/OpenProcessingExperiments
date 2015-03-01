
//drawing a smiley face with curveVertexes
void setup() {
  size(450, 200);
}
void draw() {
  background(120, 0, 255); //purple background
  strokeWeight(4); //make the line 4 pixels wide
  stroke(35, 240, 53); //bright green
  
  // Eyes
  fill(35, 240, 53);
  ellipse(120, 50, 30, 30);
  ellipse(300, 50, 30, 30);
  
  //control point below
  ellipse(mouseX, mouseY, 5, 5);
  
  //The Smile
  noFill();
  beginShape();
  curveVertex(80, 120); // control point
  curveVertex(80, 120); // start of smile
  curveVertex(195, 160); //middle of the smile
  curveVertex(340, 120); //end of smile
  curveVertex(mouseX, mouseY); //end conrol point
  endShape();
  
  //the control line
  stroke(255, 255, 255, 100);
  strokeWeight(2);
  beginShape();
  curveVertex(80, 120);
  curveVertex(195, 160);
  curveVertex(340, 120);
  curveVertex(mouseX, mouseY); //end conrol point
  curveVertex(mouseX, mouseY); //end conrol point
  endShape();

}
