
//Copyright Talha Aamir 2014 Homework 2

size(400, 400);

background(224, 255, 255); //cyan

float x = 0;
float y = 0;
float wd = 400;
float ht = 400;

//face
strokeWeight(3);
stroke(255, 144, 0); //dark orange
fill(255, 239, 213); //papaya whip
ellipse(x + .5*wd, y + .5*ht, .9*wd, .9*ht);

//eyes
stroke(0);
fill(255);
ellipse(x + .42*wd, y + .45*ht, .1*wd, .1*ht);
ellipse(x + .58*wd, y + .45*ht, .1*wd, .1*ht);
fill(0);
ellipse(x + .42*wd, y + .45*ht, .06*wd, .06*ht);
ellipse(x + .58*wd, y + .45*ht, .06*wd, .06*ht);

//nose, upside down T
stroke(205, 183, 158);
strokeWeight(5);
noFill();
curve(x + .5*wd, y + .4*ht, x + .5*wd, y + .4*ht, x + .5*wd, y + .65*ht, x + .5*wd, y + .65*ht);
beginShape();
  curveVertex(x + .5*wd, y + .65*ht);
  curveVertex(x + .5*wd, y + .65*ht);
  curveVertex(x + .45*wd, y + .67*ht);
  curveVertex(x + .4*wd, y + .65*ht);
  curveVertex(x + .45*wd, y + .63*ht);
  curveVertex(x + .5*wd, y + .65*ht);
  curveVertex(x + .5*wd, y + .65*ht);
endShape();
beginShape();
  curveVertex(x + .5*wd, y + .65*ht);
  curveVertex(x + .5*wd, y + .65*ht);
  curveVertex(x + .55*wd, y + .67*ht);
  curveVertex(x + .6*wd, y + .65*ht);
  curveVertex(x + .6*wd, y + .65*ht);
endShape();

//eyebrows
stroke(0);
strokeWeight(2);
fill(205, 201, 201);
rect(x + .2*wd, y + .25*ht, .25*wd, .1*ht);
rect(x + .55*wd, y + .25*ht, .25*wd, .1*ht);

//mustache
quad(x + .25*wd, y + .8*ht, x + .4*wd, y + .7*ht, x + .6*wd, y + .7*ht, x + .75*wd, y + .8*ht);

//glasses
stroke(0);
//noFill(); //stroke color
strokeWeight(5);
fill(205, 133, 63, 200);
beginShape();
  curveVertex(x + .5*wd, y + .4*ht);
  curveVertex(x + .5*wd, y + .4*ht);
  curveVertex(x + .4*wd, y + .6*ht);
  curveVertex(x + .15*wd, y + .65*ht);
  curveVertex(x + .175*wd, y + .35*ht);
  curveVertex(x + .5*wd, y + .4*ht);
  curveVertex(x + .5*wd, y + .4*ht);
endShape();
beginShape();
  curveVertex(x + .5*wd, y + .4*ht);
  curveVertex(x + .5*wd, y + .4*ht);
  curveVertex(x + .6*wd, y + .6*ht);
  curveVertex(x + .85*wd, y + .65*ht);
  curveVertex(x + .825*wd, y + .35*ht);
  curveVertex(x + .5*wd, y + .4*ht);
  curveVertex(x + .5*wd, y + .4*ht);
endShape();


