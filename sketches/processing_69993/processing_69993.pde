
/*****************************************
 * Assignment 1
 * Name:         Emily Chang
 * E-mail:       echang@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    9/12/2012
 * 
 * This sketch illustrates a paper coffee cup, with a lid and 
 sleeve, resting on a coffee table. The logo on the sleeve is
 based on Starbucks' logo.
***********************************************/

//Coffee To Go
void setup() {
//set up window
  size (500, 500);
  noLoop();
  smooth();
  
//draw green wall
  background (190, 220, 150);
}

void draw () {

//draw  table
  fill(100,50,30);
  rect(0,355, 500, 500);

//draw cup
  strokeWeight(1);
  fill(255);
  ellipse(250, 400, 200, 15);
  beginShape();
   vertex(150,400); 
    vertex(100,55);
    vertex(400,55);
    vertex(350,400);
  endShape();
  
//draw cup lid
  fill(255);
  quad(125,15, 375,15, 390,55, 110,55);
  ellipse(250, 55, 315, 15);
  beginShape();
    vertex(90,55); 
    vertex(90,95); 
    vertex(410,95); 
    vertex(410,55);
    endShape();

//draw cup logo
  fill(0, 50, 0);
  arc (300, 215, 150, 150, PI, 2*PI);

//draw cardboard sleeve
  strokeWeight(2);
  fill(200,150,100);
  quad (110,150, 390,150, 370,300, 130,300);

//draw sleeve logo
  strokeWeight(1);
  fill(0, 50, 0);
  ellipse (275, 225, 110, 110);
   
  //draw star
    noStroke();
    fill(255);
    beginShape();
      vertex(270,200); 
      vertex(270,210);   
      vertex(255,200);
      vertex(280,200); 
      vertex(270,200); 
      vertex(275,185);
      vertex(280,200); 
      vertex(285,200); 
      vertex(295,200);
      vertex(285,210); 
      vertex(290,225); 
      vertex(275,215);
      vertex(275,215); 
      vertex(260,225); 
      vertex(265,210);
   endShape();
   
 //draw face
   ellipse(275,240,35,40);
 
 //draw hair
  noFill();
  strokeWeight(6);
  stroke(255);
   bezier(280,220, 326,250, 270,265, 300,270);
   bezier(270,223, 230,229, 270,265, 250,270);
 
//draw corner of sugar packet
  stroke(30);
  strokeWeight(1);
  fill(100,150,175);
  triangle (500,450, 450,500, 500,500);
  fill(100,150,210);
  triangle(500,475, 475,500, 500,500);

}
