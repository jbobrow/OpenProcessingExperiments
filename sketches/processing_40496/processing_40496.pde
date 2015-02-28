
/* 
Assignment #1
Name: Ilena Yeru Pegan
Email: ipegan@brynmawr.edu
Course: CS 110 - Section 03
Submitted: 9/06/2011
Sketching with Processing language/environment. 
An image primarily created of primitive shapes: line, rect, ellipse, quad, beginShape/endShape, arc, curve.
*/

/*
A design of the dalek from Doctor Who. 
Author: Ilena Yeru Pegan (ipegan@brynmawr.edu)
*/


int videoScale = 10;
int cols, rows;


//Dalek

void setup() {
  size(500,500);
  
  background (255);
  noLoop();
  smooth ();
  
//  cols = width/videoScale;
//  rows = height/videoScale;
}

void draw() {
 
//  for (int i = 0; i < cols; i++) {
//  for (int j = 0; j < rows; j++) {
//      
//      int x = i*videoScale;
//      int y = j*videoScale;
//      fill(255);
//      stroke(0);
//      rect(x,y,videoScale,videoScale); 
//    }
//  }

  //body
  beginShape (TRIANGLE_STRIP);
  noStroke ();
  noSmooth();
  fill(58);
  triangle(120, 190, 100, 500, 390, 500);
  triangle(120, 190, 390, 500, 300, 190);
  endShape (CLOSE);
  
  //base
  fill(0);
  rect(95, 480, 295, 70);
  
  //light reflection
  stroke (225);
  strokeWeight (2);
  curve (200, 80, 210, 72, 215,73, 220, 80);
  
  //stop outsline
  noStroke();
  
  //head
    //eyeball
  fill(53);
  rect (250, 70, 40, 20);
  smooth();
    //intena
  beginShape ();
  fill (53);
  ellipse (210, 120, 160, 140); 
  rect (130, 130, 160, 60);
  endShape (CLOSE);
  
  //neck
  fill (48);
  rect (110, 240, 215, 30);
  
  //sense globes
  fill (140);
  ellipse (140, 300, 30, 30);
  ellipse (136, 350, 30, 30);
  ellipse (132, 400, 30, 30);
  ellipse (130, 450, 30, 30);
  ellipse (190, 300, 30, 30);
  ellipse (186, 350, 30, 30);
  ellipse (183, 400, 30, 30);
  ellipse (180, 450, 30, 30);
  ellipse (240, 300, 30, 30);
  ellipse (246, 350, 30, 30);
  ellipse (253, 400, 30, 30);
  ellipse (260, 450, 30, 30);
  ellipse (290, 300, 30, 30);
  ellipse (296, 350, 30, 30);
  ellipse (303, 400, 30, 30);
  ellipse (310, 450, 30, 30);
  ellipse (330, 300, 20, 30);
  ellipse (345, 350, 20, 30);
  ellipse (360, 400, 20, 30);
  ellipse (375, 450, 20, 30);
  fill (0);
  line (165, 270, 155, 478);
  
  //energy dispensers
  beginShape ();
  fill (120);
  ellipse (210, 80, 20, 7);
  fill (200);
  ellipse (210, 77, 15, 10);
  endShape ();
  
  //eye
  beginShape ();
  rect (290, 78, 50, 5);
  fill (28, 143, 230);
  rect (315, 75, 2, 10.5);
  rect (320, 70, 2, 20);
  rect (325, 75, 2, 10.5);
  fill (120);
  arc (350, 80, 10, 20, TWO_PI-PI/2, PI/2); 
  ellipse (350, 80, 20, 20);
  fill (70);
  rect (355, 72, 5, 17);
  endShape ();
  
  //neck muscles
  beginShape ();
  fill (90);
  rect (125, 110, 170, 5);
  rect (120, 135, 180, 5);
  rect (120, 165, 180, 5);
  fill (140);
  rect (170, 115, 5, 20);
  rect (170, 140, 5, 25);
  rect (170, 170, 5, 20);
  rect (250, 115, 5, 20);
  rect (250, 140, 5, 25);
  rect (250, 170, 5, 20);
  endShape ();
  
  //arm
  rect (325, 250, 85, 5);
  stroke (82);
  //arm muscle
  beginShape ();
  strokeWeight (7);
  line (388, 252, 410, 252);
  endShape (CLOSE);
  //suction
  fill(0);
  stroke (0);
  arc (415, 252, 30, 30, PI/2, PI);
  arc (415, 252, 30, 30, PI, TWO_PI-PI/2);

//
//  size(500, 500);
//  textAlign (CENTER);
//  textSize (25);
//  fill (0);
//  text( "(" + str(mouseX) + ", " + str(mouseY) + ")", 250, 250);

}

