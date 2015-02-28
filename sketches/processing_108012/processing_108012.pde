
//Ara Lee
//aral
//copyright Ara Lee, September 2013, Pittsburgh, PA
//hw2
//257

//======================================================
size(400,400);
background(130);

//variables
float x = 200; //position
float y = 200;

float wd = 200; //size,scale
float ht = 200;

float r1 = .25*wd; //radius of square corners
float r2 = .5*wd;

float w = .025*wd; //strokeWeight

//body
noStroke();
fill(255,100,0);
ellipse(x,y+1.25*ht,1.75*wd,1.75*ht);
//shirt
stroke(255,255,255);
strokeWeight(2);
line(x+.07*wd,y+.5*ht,x+.07*wd,y+1.4*ht);
//pants
line(x-1.17*wd,y+1.4*ht,x+1.17*wd,y+1.4*ht);
//buttons
noStroke();
fill(255);
ellipse(x,y+.66*ht,.07*wd,.07*ht);
ellipse(x,y+.84*ht,.07*wd,.07*ht);
ellipse(x,y+1.02*ht,.07*wd,.07*ht);
ellipse(x,y+1.2*ht,.07*wd,.07*ht);

//head shape
noStroke();
fill(255,255,102);
rectMode(CENTER);
rect(x,y,wd,ht,r1,r1,r2,r2);

//glasses
//left
stroke(0);
strokeWeight(w);
noFill();
beginShape();
  curveVertex(x-.6*wd,y-.5*ht+.05*ht); //ref pt
  curveVertex(x-.6*wd,y-.5*ht+.05*ht);
  curveVertex(x-.4*wd,y+.05*ht);
  curveVertex(x,y-.1*ht+.05*ht);
  curveVertex(x,y+.05*ht); //ref pt
endShape();
//right
beginShape();
  curveVertex(x,y+.05*ht); //ref pt
  curveVertex(x,y-.1*ht+.05*ht);
  curveVertex(x+.4*wd,y+.05*ht);
  curveVertex(x+.6*wd,y-.5*ht+.05*ht);
  curveVertex(x+.6*wd,y-.5*ht+.05*ht); //ref pt
endShape();
//middle
beginShape();
  curveVertex(x-.5*wd,y-.25*ht+.05*ht);
  curveVertex(x-.5*wd,y-.25*ht+.05*ht);
  curveVertex(x,y-.3*ht+.05*ht);
  curveVertex(x+.5*wd,y-.25*ht+.05*ht);
  curveVertex(x+.5*wd,y-.25*ht+.05*ht);
endShape();

//'stache
noStroke();
fill(150,150,150,210);
arc(x,y+.4*ht,.6*wd,.6*ht,radians(-210),radians(30));

//hair
noFill();
stroke(100,100,100);
strokeWeight(w);
//mid
beginShape();
  curveVertex(x,y-.5*ht+.05*ht); //ref pt
  curveVertex(x,y-.5*ht+.05*ht);
  curveVertex(x+.05*wd,y-.6*ht);
  curveVertex(x-.05*wd,y-.65*ht);
  curveVertex(x-.05*wd,y-.65*ht); //ref pt
endShape();
//left1
beginShape();
  curveVertex(x-.17*wd,y-.5*ht+.05*ht); //ref pt
  curveVertex(x-.17*wd,y-.5*ht+.05*ht);
  curveVertex(x+.05*wd-.17*wd,y-.6*ht);
  curveVertex(x-.05*wd-.17*wd,y-.65*ht);
  curveVertex(x-.05*wd-.17*wd,y-.65*ht); //ref pt
endShape();
//right1
beginShape();
  curveVertex(x+.13*wd,y-.5*ht+.05*ht); //ref pt
  curveVertex(x+.13*wd,y-.5*ht+.05*ht);
  curveVertex(x+.05*wd+.13*wd,y-.6*ht);
  curveVertex(x-.05*wd+.13*wd,y-.65*ht);
  curveVertex(x-.05*wd+.13*wd,y-.65*ht); //ref pt
endShape();
//left2
beginShape();
  curveVertex(x-.27*wd,y-.5*ht+.05*ht); //ref pt
  curveVertex(x-.27*wd,y-.5*ht+.05*ht);
  curveVertex(x+.05*wd-.27*wd,y-.6*ht);
  curveVertex(x-.05*wd-.27*wd,y-.65*ht);
  curveVertex(x-.05*wd-.27*wd,y-.65*ht); //ref pt
endShape();
//right2
beginShape();
  curveVertex(x+.23*wd,y-.5*ht+.05*ht); //ref pt
  curveVertex(x+.23*wd,y-.5*ht+.05*ht);
  curveVertex(x+.05*wd+.23*wd,y-.6*ht);
  curveVertex(x-.05*wd+.23*wd,y-.65*ht);
  curveVertex(x-.05*wd+.23*wd,y-.65*ht); //ref pt
endShape();


