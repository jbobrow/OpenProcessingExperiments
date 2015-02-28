
/*
Trivet Op.52 No.1
By Emma Rose Wirshing 
*/

import processing.pdf.*;
float eHeight = random(20, 400); //Determines the height of the ellipse
float eWidth = random(10, 70); //Determines the width of the ellipse
float eTime = random(500, 600); //Determines the amount of time that the ellipse rotates
float angle = (PI/8); //Determines the angle at which the ellipse rotates
void setup() {
  size(700, 700, PDF, "TrivetVI.pdf"); //Creates a PDF of the sketch
  strokeWeight(4);
  rect(25, 25, 650, 650);
  strokeWeight(1);
  rect(50, 50, 600, 600);
  strokeWeight(4);
  arc(350, 350, 750, 750, radians(210), radians(240));
  arc(350, 350, 750, 750, radians(30), radians(60));
  strokeWeight(1);
  arc(350, 350, 692, 692, radians(210), radians(240));
  arc(350, 350, 680, 680, radians(208.5), radians(241.5));
  arc(350, 350, 692, 692, radians(30), radians(60));
  arc(350, 350, 680, 680, radians(28.5), radians (61.5));
  strokeWeight(3);
  ellipse(350, 350, 600, 600);
  strokeWeight(1);
  line(80, 575, 80, 625);
  line(80, 575, 100, 600);
  line(100, 600, 120, 575);
  line(120, 575, 120, 625);
  line(620, 125, 620, 75);
  line(620, 125, 600, 100);
  line(600, 100, 580, 125);
  line(580, 125, 580, 75);
  //Creates outside border and decoration
 
}
 
void draw(){
  strokeWeight(2);
  translate(width/2, height/2); //Change so it draws around the center
  for (int i=0; i<eTime; i++) {
    rotate(angle);
    ellipse(0, 0, eHeight, eWidth);
    eHeight = (eHeight - 1);
  } //Rotates ellipse, decreasing the height of the ellipse as it rotates
  strokeWeight(3);
  ellipse(0, 0, 55, 55);
  println("Finished.");
  exit();
  if (millis()>1500) {
    delay(1000000);
  }
}
