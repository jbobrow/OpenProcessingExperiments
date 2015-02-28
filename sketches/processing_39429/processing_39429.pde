
//
// Geometrics v1
// Connor Dickie - cd11kj

float px, py;
float angle1 = 30;
float angle2 = 90;
float angle3 = 150;
float angle4 = 210;
float angle5 = 270;
float angle6 = 330;
float radius = 300;


void setup () {
  
  // canvas parameters
  size(600,600);
  smooth();
  background(255);
  frameRate(30);
}


// Prints out debug to console
void draw () {
//  println (mouseX +"," + mouseY);
//  println (px1 + "," + py1);
  
  // calcuate circumference of centre circle
  // use points on this circle as centrum for each other circle
  // constant spacing between circles preserves overall relationship
  px = 300 + cos(radians(angle1))*(radius/2);
  py = 300 + sin(radians(angle1))*(radius/2);
  noFill();
  stroke(#FF0000, 255);
  ellipse (px, py, 300, 300);
//  angle1 -= mouseX/200.0;
if (mouseX >= 300) {
  angle1 -= mouseX/200.0;
} else if (mouseX < 300) {
  angle1 -= -1.0 * mouseX/200.0;
}
  
  px = 300 + cos(radians(angle2))*(radius/2);
  py = 300 + sin(radians(angle2))*(radius/2);
  noFill();
  stroke(#FF0080, 255);
  ellipse (px, py, 300, 300);
//  angle2 -= mouseX/200.0;
if (mouseX >= 300) {
  angle2 -= mouseX/200.0;
} else if (mouseX < 300) {
  angle2 -= -1.0 * mouseX/200.0;
}
  
  px = 300 + cos(radians(angle3))*(radius/2);
  py = 300 + sin(radians(angle3))*(radius/2);
  noFill();
  stroke(#FF00EA, 255);
  ellipse (px, py, 300, 300);
//  angle3 -= mouseX/200.0;
if (mouseX >= 300) {
  angle3 -= mouseX/200.0;
} else if (mouseX < 300) {
  angle3 -= -1.0 * mouseX/200.0;
}
  
  px = 300 + cos(radians(angle4))*(radius/2);
  py = 300 + sin(radians(angle4))*(radius/2);
  noFill();
  stroke(#0D00FF, 255);
  ellipse (px, py, 300, 300);
//  angle4 -= mouseX/200.0;
if (mouseX >= 300) {
  angle4 -= mouseX/200.0;
} else if (mouseX < 300) {
  angle4 -= -1.0 * mouseX/200.0;
}

  
  px = 300 + cos(radians(angle5))*(radius/2);
  py = 300 + sin(radians(angle5))*(radius/2);
  noFill();
  stroke(#F7F702, 255);
  ellipse (px, py, 300, 300);
//  angle5 -= mouseX/200.0;
if (mouseX >= 300) {
  angle5 -= mouseX/200.0;
} else if (mouseX < 300) {
  angle5 -= -1.0 * mouseX/200.0;
}
  
  px = 300 + cos(radians(angle6))*(radius/2);
  py = 300 + sin(radians(angle6))*(radius/2);
  noFill();
  stroke(#FFAE00, 255);
  ellipse (px, py, 300, 300);
//  angle6 -= mouseX/200.0;
if (mouseX >= 300) {
  angle6 -= mouseX/200.0;
} else if (mouseX < 300) {
  angle6 -= -1.0 * mouseX/200.0;
}
 
}








