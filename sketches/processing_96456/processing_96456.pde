
//*****************************************************************
//Name:James Salsbury
//Student:W12032387, Northumbria University
//Year:12-13 Course: Information Technology Management Foundation
//Lecturer: Dr. Alun Moon
//Title:Looking Face
//
//Use of map function to generate a pair of eyes which follow mouse movements.
//*****************************************************************

void setup() {
  size(400,400);
  smooth();
}
 
void draw() {
   
  background(127);
  fill(#DE6783);
  rect(115,200, 70, 150, 0, 0, 25, 25);
  fill(#FF1C51);
  arc(145, 370, 100,30, PI, TWO_PI);
  arc(145, 380, 100,30, 0, PI);
  
  int pupil = 10;
  int iris = 45;
  float lx = map(mouseX, 0, width/2, 190, 240);
  float ly = map(mouseY, 0, height, 185, 220); 
  float rx = map(mouseX, width/2, width, 250, 280);
  float ry = map(mouseY, 0, height, 180,220); 
  fill(255);
  ellipse(width/4,200, 100,100);
  ellipse(width/2,200, 100,100);
  fill(#4032E3);
  ellipse(4*(lx/10), ly, iris,iris);
  ellipse(8*(rx/10), ry, iris,iris);
  fill(0);
  ellipse(4*(lx/10), ly, pupil,pupil);
  ellipse(8*(rx/10), ry, pupil,pupil);
   
}


