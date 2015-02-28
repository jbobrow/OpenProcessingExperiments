
// homework 2
// copyright Kinnari Thakker August 2011, Pittsburgh 15224

size(400,400);
background(255);
smooth();

float x,y,wd,ht; //variable declaration
x=200;
y=200;
wd=400; // do not go below 400
ht=400; //do not go below 400

fill(59,151,173);
noStroke();
ellipse(x,y,.9*wd,.9*ht);

//baseline
//line(x+.375*wd, y+.3*ht,x-.375*wd, y+.3*ht);

noFill();
strokeWeight(30);
strokeCap(SQUARE);
stroke(164,211,151);

//k
beginShape();
vertex(x-.3*wd, y+.3*ht);
vertex(x-.3*wd,y-.3*ht);
vertex(x-.3*wd,y+.05*ht);
bezierVertex( x-.15*wd,y-.125*ht,    x-.1*wd,y-.02*ht,      x-.1*wd,y);
bezierVertex(  x-.150*wd,y+.125*ht,  x-.3*wd,y+.075*ht,    x-.275*wd,y+.05*ht);
bezierVertex(  x-.125*wd,y+.3*ht,  x-.125*wd,y+.3*ht,    x-.075*wd,y+.3*ht);
endShape();

//stem of the a
//stroke(249,240,205);
stroke(240,227,245);
beginShape();
vertex(x-.05*wd, y);
//point(x-.05*wd, y-.05*ht);
bezierVertex(  x+.125*wd,y-.15*ht,  x+.125*wd, y+.15*ht,  x+.125*wd,y+.15*ht);
bezierVertex(  x+.125*wd,y+.3*ht,  x+.125*wd, y+.3*ht,  x+.175*wd,y+.3*ht);
endShape();

//round part of the a
beginShape();
vertex(x+.125*wd,y+.15*ht);
bezierVertex(  x+.025*wd, y+.05*ht,  x-.05*wd, y+.1*ht, x-.05*wd,y+.2*ht );
bezierVertex(  x-.05*wd, y+.325*ht,  x+.075*wd, y+.325*ht, x+.125*wd,y+.225*ht );
endShape();

//t
stroke(222,191,67);
beginShape();
vertex(x+.225*wd,y-.15*ht);
vertex(x+.225*wd, y+.25*ht);
bezierVertex(  x+.225*wd,y+.3*ht,  x+.225*wd, y+.3*ht,  x+.275*wd,y+.3*ht);
endShape();

//crossing the t
beginShape();
vertex(x+.150*wd,y-.075*ht);
vertex(x+.3*wd, y-.075*ht);
endShape();

//saveFrame("homework2.jpg");

