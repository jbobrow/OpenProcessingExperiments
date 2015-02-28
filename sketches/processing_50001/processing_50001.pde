
//Hw#2-Initials Curves
//Joshua Chang 
//jmc1 Copyright 2012 

//Set-Up
size(400,400);
background(185,200,255);
smooth();

float x; 
float y; 
float wd;
float ht;

x=width/2;
y=height/2;
wd=width;
ht=height;


strokeWeight(3);
noStroke();
fill(0,99,99);
ellipse(x,y,wd,ht);
fill(185,200,255);
ellipse(x,y,wd/2,ht/2);

//ref
stroke(0,0,0);
strokeWeight(2);
noFill();
//ellipse(x,y,8*x/9,8*y/9);

noStroke();
fill(185,200,255);
rect(0,y*.8,3*x,y/20);
rect(0,y*.9,3*x,y/20);
rect(0,y,3*x,y/20);
rect(0,y*1.1,3*x,y/20);
rect(0,y*1.2,3*x,y/20);


fill(185,200,255);
noStroke();
//rect(0,y*.84,3*x,y/3);

noFill();
strokeCap(PROJECT);
strokeJoin(MITER);
strokeWeight(14);
stroke(0,0,0);
ellipse(x*1.286,y*1,x/3.2,y/3.2);

//
strokeWeight(14);
stroke(0,0,0);
beginShape();
  curveVertex(x*.625,y*.9375);
  curveVertex(x*.625,y*.875);
  curveVertex(x*.6875,y*.85);
  curveVertex(x*.75,y*.875);
  curveVertex(x*.8125,y*.9);
  curveVertex(x*.875,y*.85);
  curveVertex(x*.875,y*.65);
endShape();

beginShape();
 curveVertex(x*.9, y*1.15);
 curveVertex(x*.868,y*1.15);
 curveVertex(x*.8125,y*1.175);
 curveVertex(x*.75,y*1.15);
 curveVertex(x*.6875,y*1.125);
 curveVertex(x*.63,y*1.15);
 curveVertex(x*.625,y*1.1875); 
endShape();

beginShape();
curveVertex(x*.875,y*.5);
curveVertex(x*.875,y*.85);
curveVertex(x,y);
curveVertex(x,y);
endShape();

beginShape();
curveVertex(x,y);
curveVertex(x,y);
curveVertex(x*1.125,y*.85);
curveVertex(x*1.125,y*.5);
endShape();
line(x*.875,y*.85,x*.875,y*1.15);
line(x*1.125,y*.85,x*1.125,y*1.15);
//
noFill();
strokeCap(PROJECT);
strokeJoin(MITER);
strokeWeight(10);
stroke(255,245,150);
ellipse(x*1.286,y*1,x/3.2,y/3.2);


beginShape();
  curveVertex(x*.625,y*.9375);
  curveVertex(x*.625,y*.875);
  curveVertex(x*.6875,y*.85);
  curveVertex(x*.75,y*.875);
  curveVertex(x*.8125,y*.9);
  curveVertex(x*.875,y*.85);
  curveVertex(x*.875,y*.65);
endShape();

beginShape();
 curveVertex(x*.9, y*1.15);
 curveVertex(x*.868,y*1.15);
 curveVertex(x*.8125,y*1.175);
 curveVertex(x*.75,y*1.15);
 curveVertex(x*.6875,y*1.125);
 curveVertex(x*.63,y*1.15);
 curveVertex(x*.625,y*1.1875); 
endShape();

beginShape();
curveVertex(x*.875,y*.5);
curveVertex(x*.875,y*.85);
curveVertex(x,y);
curveVertex(x,y);
endShape();

beginShape();
curveVertex(x,y);
curveVertex(x,y);
curveVertex(x*1.125,y*.85);
curveVertex(x*1.125,y*.5);
endShape();
line(x*.875,y*.85,x*.875,y*1.15);
line(x*1.125,y*.85,x*1.125,y*1.15);
//
noStroke();
fill(185,200,255);
rect(x*1.33,y*.92, x/6,y/6);
strokeWeight(1.7);
stroke(0,0,0);
line(x*1.38,y*.918,x*1.45,y*.918);
line(x*1.38,y*1.082,x*1.45,y*1.082);
//saveFrame("hw2.jpg");

