
//Homework_2_Character
//lmhartma@andrew.cmu.edu
//© Lauren Hartman, August 2013

// setup
size (400, 400);
rectMode (CENTER);
background (254,230,126);
smooth ();

//variables
float x = 200;
float y = 200;

float wd = 300;
float ht = 300;

//circle
noFill ();
noStroke ();
ellipse (x,y,wd,ht);

// the 'stache
fill (255,255,255);
stroke(255,255,255);
strokeWeight(6);
beginShape ();
  curveVertex(x - wd* .25,  y + ht* .16);
  curveVertex(x - wd* .20,  y + ht* .20);
  curveVertex(x - wd* .08,  y + ht* .12);
  curveVertex(x + wd* .08,  y + ht* .12);
  curveVertex(x + wd* .20,  y + ht* .20);
  curveVertex(x + wd* .25,  y + ht* .16);
endShape();
beginShape ();
fill (255,255,255);
stroke (255,255,255);
strokeWeight (6);
  curveVertex(x - wd* .25,  y + ht* .18);
  curveVertex(x - wd* .20,  y + ht* .20);
  curveVertex(x - wd* .08,  y + ht* .22);
  curveVertex(x + wd* .08,  y + ht* .22);
  curveVertex(x + wd* .20,  y + ht* .20);
  curveVertex(x + wd* .25,  y + ht* .18);
endShape();

//nose, 'L'
stroke (255, 170, 150);
noFill ();
strokeWeight (3);
point (x - (.08 * wd), y - (.20 * ht));
point (x - (.05 * wd), y - (.20 * ht));
point (x - (.05 * wd), y + (.01 * ht));
beginShape ( );
  vertex (x - (.08 * wd), y - (.20 * ht));
  vertex (x - (.05 * wd), y - (.20 * ht));
  vertex (x - (.05 * wd), y + (.01 * ht));
endShape ( );
fill(254,230,126);
strokeWeight(3);
arc(200, 205, 30, 30, HALF_PI, PI);

//glasses
fill (140, 240, 255, 75);
stroke (100, 60,22);
strokeWeight (6);
rect (140,155,70,60, 5,5,40,40); //L
rect (250,155,70,60, 5,5,40,40); //R

//eyes
noFill();
stroke (255,255,255);
strokeWeight(3);
arc(140, 145, 30, 40, 0, PI, OPEN);//L
arc(250, 145, 30, 40, 0, PI, OPEN);//R

//eye brows
noFill();
stroke (255,255,255);
strokeWeight(8);
line(120, 105, 150, 100);//L
line(240, 100, 270, 105);//R

//cheeks
noStroke();
  fill(255, 200, 150);
  ellipse(x-wd*.2,y+ht*.03,wd*.1,ht*.1); //L
  ellipse(x+wd*.175,y+ht*.03,wd*.1,ht*.1); //R
  
//chin
noFill();
stroke (255,255,255);
strokeWeight(3);
arc(200, 280, 30, 20, 0, PI, OPEN);

//saveFrame ("hw_2_character");
