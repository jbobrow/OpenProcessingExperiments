
 /*****************************************
 * Assignment 01
 * Name:         Mirella Deocadiz
 * E-mail:       ldeocadiz@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    01.36.12
 * 
 *This assignment is an abstract piece that takes inspiration
 *curtain drapings at the theatre. It also features a spotlight
 *as though the play is about to begin.  
 ***********************************************/ 

void setup () {
  background (139,105,105);
  size(800,400);
  strokeWeight(5);
  stroke(136,69,0);
  
  //triangles (in order from left)
  fill(139,29,98);
  triangle(0,0,80,200,160,0);
  strokeWeight(5);
  
  fill(139,29,98);
  triangle(160,0,240,200,320,0);
  strokeWeight(5);
  
  fill(139,29,98);
  triangle(320,0,400,200,480,0);
  strokeWeight(5);
  
  fill(139,29,98);
  triangle(480,0,560,200,640,0);
  strokeWeight(5);
  
  fill(139,29,98);
  triangle(640,0,720,200,800,0);
  strokeWeight(5);
  
  //rectangles in order from left
  smooth();
  fill (238,154,0,90);
  quad(80,200,40,240,80,280,120,240);
  strokeWeight(5);
  
  fill (238,154,0,90);
  quad(240,200,200,240,240,280,280,240);
  strokeWeight(5);
  
  fill (238,154,0,90);
  quad(400,200,360,240,400,280,440,240);
  strokeWeight(5);
  
  fill (238,154,0,90);
  quad (560,200,520,240,560,280,600,240);
  strokeWeight(5);
  
  fill (238,154,0,90);
  quad (720,200,680,240,720,280,760,240);
  strokeWeight(5);
  
  //shorter lines in order from left
  line(80,282,80,400);
  line(240,282,240,400);
  line(400,282,400,400);
  line(560,282,560,400);
  line(720,282,720,400);
  
  //longer lines in order from left
  stroke(136,69,0,50);
  line(160,0,160,400);
  line(320,0,320,400);
  line(480,0,480,400);
  line(640,0,640,400);
  
  //arc in the middle of the 3rd triangle
  noFill();
  stroke(169,69,70,80);
  arc(80,0,144,152,0.023,3.110);
  arc(240,0,144,152,0.023,3.110);
  arc(400,0,144,152,0.023,3.110);
  arc(560,0,144,152,0.023,3.110);
  arc(720,0,144,152,0.023,3.110);
  
  //ellipses in order from left
  stroke (138,69,19);
  strokeWeight(1);
  fill(169,69,70,70);
  
  ellipse(80,380,40,40);
  ellipse(240,380,40,40);
  ellipse(400,380,40,40);
  ellipse (560,380,40,40);
  ellipse (720,380,40,40);
  
  //arc that represents the spotlight
  stroke (255,255,0,40);
  fill(255,255,0,40);
  bezier(190,7,200,290,584,289,584,0);
}

