
/*****************************************

*Assignment 01
*Name: Sun Ook Kim
*Email: skim2@haverford.edu
*Course: CS 110- Section 02
*Submitted: 1-26-2012
*
* This is an image of a car. The basic shapes were easy, but the fume was a little difficult.
Using the graph paper was helpful. I had a chimney and a pipe on the car, which is very weird and awkward.
Enjoy the awkward car.

****************************************/

void setup() {
  size(800, 500);
  background(179, 240, 231);
 
  //car body
  fill(28, 16, 59);
  noStroke();
  quad(250, 50, 500, 50, 550, 225, 200, 225);
  quad(50, 225, 700, 225, 725, 350, 25, 350);
  //windows
  fill(210, 201, 232);
  rect(275, 75, 75, 150);
  rect(400, 75, 75, 150);
  //wheels
  fill(84, 82, 90);
  ellipse(250, 350, 150, 150);
  ellipse(500, 350, 150, 150);
  //chimney
  fill(250, 234, 114);
  rect(600, 150, 100, 25);
  rect(625, 175, 50, 50);
  //gas pipe
  fill(250, 119, 143);
  beginShape();
  vertex(650, 350);
  vertex(675, 350);
  vertex(675, 375);
  vertex(725, 375);
  vertex(725, 400);
  vertex(650, 400); 
  endShape(CLOSE);
  //car design
  fill(80, 27, 80);
  arc(100, 225, 100, 100, PI, TWO_PI-PI/2);
  //fume directions
  stroke(0);
  strokeWeight(5);
  line(700, 125, 740, 75);
  line(600, 75, 625, 125);
  line(625, 25, 650, 75);
  line(775, 25, 750, 75);
  //fume
  noStroke();
  fill(193, 174, 174);
  beginShape();
  vertex(625, 150);
  curveVertex(635, 125); 
  curveVertex(635, 125);
  curveVertex(650,100);
  curveVertex(660, 75);
  curveVertex(675, 50);
  curveVertex(700, 25);
  curveVertex(712.5, 50);
  curveVertex(725, 75);
  curveVertex(700, 100);
  curveVertex(687.5, 125);
  curveVertex(675, 150);
  curveVertex(675, 150);
  endShape(CLOSE);
  
}
  

  

  
 

