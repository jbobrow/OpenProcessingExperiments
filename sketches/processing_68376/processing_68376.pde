
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
circleX = 150;
circleY = 200;
circleW = 250;
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
circleW = circleW/160;
translate(circleX,circleY);
scale(circleW);
// Y - first leg
stroke(255);
strokeWeight(4);
noFill();
beginShape();
curveTightness(6);
curveVertex(-30,0);
curveVertex(-30,0);
curveVertex(-40,10);
curveVertex(-10,30);
curveVertex(-10,30);
endShape();

// Y - second leg curve
beginShape();
curveTightness(6);
curveVertex(0,0);
curveVertex(0,0);
curveVertex(0,70);
curveVertex(-20,70);
curveVertex(-10,50);
curveVertex(-10,50);
endShape();

// H - first leg
stroke(198,229,245);
beginShape();
curveTightness(1);
curveVertex(5,20);
curveVertex(5,20);
curveVertex(15,25);
curveVertex(20,60);
curveVertex(20,60);
endShape();
// H - second leg
beginShape();
curveTightness(1);
curveVertex(30,25);
curveVertex(30,25);
curveVertex(35,30);
curveVertex(40,60);
curveVertex(40,60);
endShape();
// H - middle leg
beginShape();
curveTightness(1);
curveVertex(5,45);
curveVertex(5,45);
curveVertex(60,40);
curveVertex(50,55);
curveVertex(50,55);
endShape();

// saveFrame("hw2.png");

