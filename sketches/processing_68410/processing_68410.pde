
// Homework #2, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// M. Yvonne Hidle
// yvonnehidle@gmail.com

// General
size(400,400);
background(255);
smooth();

// Change me!
float circleX,circleY,circleW,circleH,pmouthA,pmouthB;
circleX = 190;
circleY = 200;
circleW = 260;
circleH = circleW;
pmouthA = radians(-30);
pmouthB = radians(30);

// PACMAN Head
ellipseMode(CENTER);
fill(137,172,191);
noStroke();
ellipse(circleX,circleY,circleW,circleH);

// PACMAN Mouth
fill(54,62,79);
stroke(255);
strokeWeight(circleW/210*10);
arc(circleX,circleY,circleW,circleH,pmouthA,pmouthB);

//PACMAN Eye
float eyeY,eyeX;
eyeY = circleY-circleH/4;
eyeX = circleX+circleW/8;
noStroke();
fill(255);
ellipse(eyeX,eyeY,circleW*.15,circleH*.15);

// Intials Y
// Y - first leg
float changeStroke;
changeStroke = circleW/160;
stroke(255);
strokeWeight(4*changeStroke);
noFill();
beginShape();
curveTightness(6);
curveVertex(circleX-circleW/5.333333333,circleY);
curveVertex(circleX-circleW/5.333333333,circleY);
curveVertex(circleX-circleW/4,circleY+circleH/16);
curveVertex(circleX-circleW/16,circleY+circleH/5.333333333);
curveVertex(circleX-circleW/16,circleY+circleH/5.333333333);
endShape();

// Y - second leg curve
beginShape();
curveTightness(6);
curveVertex(circleX,circleY);
curveVertex(circleX,circleY);
curveVertex(circleX,circleY+circleH/2.285714286);
curveVertex(circleX-circleW/8,circleY+circleH/2.285714286);
curveVertex(circleX-circleW/16,circleY+circleH/3.2);
curveVertex(circleX-circleW/16,circleY+circleH/3.2);
endShape();

// H - first leg
stroke(198,229,245);
beginShape();
curveTightness(1);
curveVertex(circleX+circleW/32,circleY+circleH/8);
curveVertex(circleX+circleW/32,circleY+circleH/8);
curveVertex(circleX+circleW/10.66666667,circleY+circleH/6.4);
curveVertex(circleX+circleW/8,circleY+circleH/2.666666667);
curveVertex(circleX+circleW/8,circleY+circleH/2.666666667);
endShape();
// H - second leg
beginShape();
curveTightness(1);
curveVertex(circleX+circleW/5.333333333,circleY+circleH/6.4);
curveVertex(circleX+circleW/5.333333333,circleY+circleH/6.4);
curveVertex(circleX+circleW/4.571428571,circleY+circleH/5.333333333);
curveVertex(circleX+circleW/4,circleY+circleH/2.666666667);
curveVertex(circleX+circleW/4,circleY+circleH/2.666666667);
endShape();
// H - middle leg
beginShape();
curveTightness(1);
curveVertex(circleX+circleW/32,circleY+circleH/3.555555556);
curveVertex(circleX+circleW/32,circleY+circleH/3.555555556);
curveVertex(circleX+circleW/2.666666667,circleY+circleH/4);
curveVertex(circleX+circleW/3.2,circleY+circleH/2.909090909);
curveVertex(circleX+circleW/3.2,circleY+circleH/2.909090909);
endShape();

// saveFrame("hw2.png");

