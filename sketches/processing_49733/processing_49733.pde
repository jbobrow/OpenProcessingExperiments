
//homework 2 rwandrew
//copyright russell andrews 2012

//style
size(400, 400);
smooth();
background(#540202);

//layout
float x, y, wd, ht;
x=200.0;
y=200.0;
wd=300.0;
ht=300.0;

//boundaries
fill(#609170);
strokeWeight(.035*wd);
stroke(#991212);
ellipse(x, y, wd, ht);

//first initial r
stroke(#EDE0A6);
noFill();
beginShape();
  vertex(x - .35*wd, y - .23*ht);
  vertex(x - .35*wd, y + .15*ht);
endShape();
beginShape();
  curveVertex(x - .20*wd, y + .40*ht);
  curveVertex(x - .35*wd, y - .13*ht);
  curveVertex(x - .215*wd, y - .27*ht);
  curveVertex(x - .08*wd, y - .13*ht);
  curveVertex(x - .19*wd, y + .40*ht);
endShape();

//second initial w
beginShape();
vertex(x - .215*wd, y - .04*ht);
vertex(x - .215*wd, y + .15*ht);
endShape();

beginShape();
curveVertex(x - .155*wd, y - .25*ht);
curveVertex(x - .215*wd, y + .15*ht);
curveVertex(x - .1075*wd, y + .26*ht);
curveVertex(x, y + .15*ht);
curveVertex(x - .06*wd, y - .25*ht);
endShape();

beginShape();
curveVertex(x + .155*wd, y - .25*ht);
curveVertex(x + .215*wd, y + .15*ht);
curveVertex(x + .1075*wd, y + .26*ht);
curveVertex(x, y + .15*ht);
curveVertex(x + .06*wd, y - .25*ht);
endShape();

beginShape();
vertex(x + .215*wd, y - .04*ht);
vertex(x + .215*wd, y + .15*ht);
endShape();

//third initial a
beginShape();
  vertex(x + .35*wd, y - .13*ht);
  vertex(x + .35*wd, y + .15*ht);
endShape();
beginShape();
  curveVertex(x + .20*wd, y + .40*ht);
  curveVertex(x + .35*wd, y - .13*ht);
  curveVertex(x + .215*wd, y - .27*ht);
  curveVertex(x + .08*wd, y - .13*ht);
  curveVertex(x + .19*wd, y + .40*ht);
endShape();
ellipse(x + .216*wd, y + .02*ht, .27*wd, .27*ht);


//saveFrame("hw2.jpg");

