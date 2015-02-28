
//Katherine(Kathy) Y. Lee
//HW#2 60-257
//Copyright 2012
 
size(400, 400);
smooth();
background(#c2c882);

float wd, ht;
wd=300.0;
ht=300.0;  
  
float x1, y1;
x1 = width/2;
y1 = height/2;
  
float x;
x = x1 - 0.01*wd;
float y;
y = y1 - 0.08*ht;  
  

//The visible circle
fill(#b9595a);
strokeWeight(.09*((wd+ht)/2));
stroke(#fccebe);
ellipse(x + .02*wd, y + .08*ht, wd, ht);
 
//Initials
stroke(#322d27);
 
//Left part of "K"
beginShape();
curveVertex(x - .3*wd, y - .15*ht);
curveVertex(x - .2*wd, y - .22*ht);
curveVertex(x - .13*wd, y - .2*ht);
curveVertex(x - .11*wd, y - .12*ht);
curveVertex(x - .21*wd, y + .08*ht);
curveVertex(x - .28*wd, y + .1*ht);
curveVertex(x - .3*wd, y + .06*ht);
curveVertex(x - .25*wd, y + .03*ht);
endShape();
 
//right of K
beginShape();
curveVertex(x - .19*wd, y + .01*ht);
curveVertex(x - .15*wd, y - .01*ht);
curveVertex(x - .01*wd, y - .08*ht);
curveVertex(x + .05*wd, y - .11*ht);
curveVertex(x + .09*wd, y - .12*ht);
curveVertex(x + .12*wd, y - .11*ht);
curveVertex(x + .12*wd, y - .07*ht);
curveVertex(x + .09*wd, y - .06*ht);
endShape();
 
//right bottom K+L
beginShape();
curveVertex(x - .01*wd, y - .1*ht);
curveVertex(x - .01*wd, y - .08*ht);
curveVertex(x + .0*wd, y + .07*ht);
curveVertex(x + .06*wd, y + .13*ht);
curveVertex(x + .1*wd, y + .14*ht);
curveVertex(x + .14*wd, y + .13*ht);
curveVertex(x + .12*wd, y + .09*ht);
curveVertex(x + .08*wd, y + .1*ht);
curveVertex(x + .03*wd, y + .2*ht);
curveVertex(x - .01*wd, y + .3*ht);
curveVertex(x - .05*wd, y + .4*ht);
curveVertex(x - .06*wd, y + .5*ht);
endShape();
 
//bottom L
beginShape();
vertex(x - .04*wd, y + .4*ht);
vertex(x + .2*wd, y + .4*ht);
endShape();
 
 
//debugging/reference points stuff
//stroke(0);
//strokeWeight(10);
//point(x,y);
//stroke(155);
//point (width/2,height/2);
