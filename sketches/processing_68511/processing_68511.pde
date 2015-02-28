
//Homework Assignment 2 
//51-257: A
//Copyright 2012 Edmund Chow ezc@andrew.cmu.edu

size(400, 400); 
smooth();
float x, y, wd, ht;
x=200;
y=200;
wd=400;
ht=400;

background(0,95,50);

//Circles (Outside to Inside)
stroke(26,51,0);
strokeWeight(.25);
fill(0,95,50);
ellipseMode( CENTER ); // Circle 1
ellipse( x, y, wd*1.15, ht*1.15 );

stroke(26,51,0);
fill(0,95,50);
strokeWeight(.75);
ellipseMode( CENTER ); // Circle 2
ellipse( x, y, wd*.95, ht*.95 );

fill(26,51,0);
stroke(90,173,0);
strokeWeight(2.25);
ellipseMode( CENTER ); // Circle 3
ellipse( x, y, wd*.8, ht*.8 );

fill(216,200,100);
stroke(255,255,255);
ellipseMode( CENTER ); // Circle 4
ellipse( x, y, wd*.7, ht*.7 );

noFill();
stroke(102,102,0);
strokeWeight(7.5);
beginShape(); // E Curve
curveVertex(x-(.0625*wd), y-(.3125*ht));
curveVertex(x-(.0625*wd), y-(.3125*ht));
curveVertex(x-(.3125*wd), y);
curveVertex(x-(.0625*wd), y+(.3125*ht));
curveVertex(x-(.0625*wd), y+(.3125*ht));
endShape();

noFill();
stroke(225,225,225);
strokeWeight(.5);
beginShape(); // E Curve Thin
curveVertex(x-(.0625*wd), y-(.3125*ht));
curveVertex(x-(.0625*wd), y-(.3125*ht));
curveVertex(x-(.3125*wd), y);
curveVertex(x-(.0625*wd), y+(.3125*ht));
curveVertex(x-(.0625*wd), y+(.3125*ht));
endShape();

stroke(102,102,0);
strokeWeight(7.5);
beginShape(); // E Horizontal Line
vertex(x-(.3125*wd), y);
vertex(x-(.125*wd), y);
endShape();


stroke(225,225,225);
strokeWeight(.5);
beginShape(); // E Horizontal Line Thin
vertex(x-(.3125*wd), y);
vertex(x-(.125*wd), y);
endShape();

stroke(102,102,0);
strokeWeight(7.5);
beginShape(); // Backwards C
curveVertex(x+(.0625*wd), y-(.3125*ht));
curveVertex(x+(.0625*wd), y-(.3125*ht));
curveVertex(x+(.3125*wd), y);
curveVertex(x+(.0625*wd), y+(.3125*ht));
curveVertex(x+(.0625*wd), y+(.3125*ht));
endShape();

stroke(225,225,225);
strokeWeight(.5);
beginShape(); // Backwards C Thin
curveVertex(x+(.0625*wd), y-(.3125*ht));
curveVertex(x+(.0625*wd), y-(.3125*ht));
curveVertex(x+(.3125*wd), y);
curveVertex(x+(.0625*wd), y+(.3125*ht));
curveVertex(x+(.0625*wd), y+(.3125*ht));
endShape();

stroke(70,25,0);
strokeWeight(10);
beginShape(); // Z top Horizontal line
vertex(x-(.125*wd), y-(.175*ht));
vertex(x+(.15*wd), y-(.175*ht));
endShape();

beginShape(); // Z bottom Horizontal line
vertex(x-(.15*wd), y+(.175*ht));
vertex(x+(.125*wd), y+(.175*ht));
endShape();

beginShape(); // Z diagonal line
vertex(x+(.15*wd), y-(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();

beginShape(); // Z top little diagonal
vertex(x-(.125*wd), y-(.175*ht));
vertex(x-(.1375*wd), y-(.1375*wd));
endShape();

beginShape(); // Z bottom little diagonal
vertex(x+(.125*wd), y+(.175*ht));
vertex(x+(.1375*wd),  y+(.1375*ht));
endShape();

beginShape(); // Z middle Horizontal Line
vertex(x-(.0625*wd), y);
vertex(x+(.0625*wd), y);
endShape();

//saveFrame("hw2.jpg");




