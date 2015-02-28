
//homework 2
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin August 2012 Pittsburgh PA 15213 All Rights Reserved

//parameters
size(400, 400);
smooth();
background(10, 49, 59);
float x, y, wd, ht;
x = 400;
y = 400;
wd = 250;
ht = 250;

//ellipse
noFill();
strokeWeight(15);
stroke(162, 54, 0);
strokeCap(ROUND);
ellipse(.5*x, .5*y, wd, ht);

//S
noFill();
strokeWeight(10);
stroke(215, 219, 217);
beginShape();
curveVertex(.721*x, .279*y);
curveVertex(.721*x, .279*y);
curveVertex(.6089*x, .2333*y);
curveVertex(.5*x, .2798*y);
curveVertex(.4556*x, .3686*y);
curveVertex(.4652*x, .4471*y);
curveVertex(.5*x, .5*y);
curveVertex(.5303*x, .5555*y);
curveVertex(.5383*x, .6582*y);
curveVertex(.4753*x, .7411*y);
curveVertex(.3972*x, .7665*y);
curveVertex(.3342*x, .7566*y);
curveVertex(.279*x, .721*y);
curveVertex(.279*x, .721*y);
endShape();

//R1
strokeWeight(13);
stroke(77, 149, 126);
beginShape(LINES);
vertex(.295*x, .7359*y);
vertex(.7369*x, .2962*y);
endShape();
beginShape(LINES);
vertex(.5*x, .5*x);
vertex(.721*x, .721*y);
endShape();
beginShape();
curveVertex(.721*x, .279*y);
curveVertex(.721*x, .279*y);
curveVertex(.7644*x, .4166*y);
curveVertex(.7185*x, .5024*y);
curveVertex(.6338*x, .544*y);
curveVertex(.5*x, .5*y);
curveVertex(.5*x, .5*y);
endShape();

//R2
strokeWeight(13);
stroke(77, 149, 126);
beginShape(LINES);
vertex(.705*x, .2641*y);
vertex(.2631*x, .7038*y);
endShape();
beginShape();
vertex(.2903*x, .2903*y);
vertex(.5*x, .5*y);
endShape();
stroke(77, 149, 126);
beginShape();
curveVertex(.279*x, .721*y);
curveVertex(.279*x, .721*y);
curveVertex(.2351*x, .5867*y);
curveVertex(.2881*x, .4917*y);
curveVertex(.4024*x, .455*y);
curveVertex(.5*x, .5*y);
curveVertex(.5*x, .5*y);
endShape();

//saveFrame("hw2.jpg");

