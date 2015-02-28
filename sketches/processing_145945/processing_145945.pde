
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// CHOI In Seo
// 201420113

float xPos;
float destination;
float speed = 3;
float diameter = 20;

void setup () {
  size(1024, 768);
  smooth ();
   
  xPos = 0;

  destination = width + diameter * 5;
}
 
void draw () {
  background (200);
   
 
  float distance = destination - xPos;
   

  xPos = xPos + distance / 60;
   
 
  if (xPos > width + diameter) {
    xPos = -diameter;
  }
   fill(232,217,255);
   stroke(100);
 ellipse (xPos, height / 5, diameter, diameter);
 fill(209,178,255);
 rect (xPos, height / 7, diameter, diameter);
 fill(165,102,255);
 ellipse (xPos, height / 9, diameter, diameter);
 fill(128,65,217);
ellipse (xPos, height / 3, diameter, diameter);
  fill(63,0,153);
  rect (xPos, height / 4, diameter, diameter);

}
