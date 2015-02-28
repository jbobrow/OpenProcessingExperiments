
/// example code demonstrating how the "invisible handle" vertex at the start
/// and end of curveVertex changes the shape of the overall curve

void setup() {
  size(800,600);
}

void draw() {

  background(255);
  
  // "invisible" line - shows up in pale gray
  
  stroke(150);
  strokeWeight(1);

  beginShape();
  curveVertex(250,500);
  curveVertex(200,500);
  curveVertex(100,350);
  curveVertex(200,200);
  
  // ending vertex controlled by mouse position in X axis
  
  curveVertex(mouseX,60);
  curveVertex(mouseX,60);
  
  endShape();

  ellipse(mouseX,60,5,5);

  // "primary" / displayed line (this is what you'll actually see)

  stroke(0);
  strokeWeight(2);

  beginShape();
  curveVertex(250,500);
  curveVertex(200,500);
  curveVertex(100,350);
  curveVertex(200,200);
  curveVertex(mouseX,60);
  endShape();
  
  // draw ellipses to display the points that the curve is based on

  ellipse(200,500,5,5);
  ellipse(100,350,5,5);
  ellipse(200,200,5,5);
}


