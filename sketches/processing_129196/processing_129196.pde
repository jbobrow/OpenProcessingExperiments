
//Copyright_Christopher Henley_2014

//Setup
size(400,400);
pushMatrix();
translate(400/2,400/2);
background(255,255,255);
float a=300;//Bounding Circle
float b=.93*a;//Face Width
float c=0;//Face Location: X coordinate
float d=0;//Face Location: Y coordinate
  
//Face Outline
noStroke();
fill(255,226,188);
beginShape();
//Begin Right Side
curveVertex(0+c,-.46*a+d);
curveVertex(0+c,-.46*a+d);
curveVertex(.29*b+c,-.4*a+d);
curveVertex(.5*b+c,0+d);
curveVertex(.42*b+c,.2*a+d);
curveVertex(.35*b+c,.33*a+d);
curveVertex(.21*b+c,.46*a+d);
curveVertex(0+c,.53*a+d);
//End Right side
//Begin Left Side
curveVertex(-.21*b+c,.46*a+d);
curveVertex(-.35*b+c,.33*a+d);
curveVertex(-.42*b+c,.2*a+d);
curveVertex(-.5*b+c,0+d);
curveVertex(-.29*b+c,-.4*a+d);
curveVertex(0+c,-.46*a+d);
curveVertex(0+c,-.46*a+d);
endShape(CLOSE);

//Nose and Misc. Features
noStroke();
fill(216,182,140);
beginShape();
curveVertex(.01*b+c,.13*a+d);
curveVertex(.1*b+c,.13*a+d);
curveVertex(0+c,.2*a+d);
curveVertex(-.1*b+c,.13*a+d);
curveVertex(-.1*b+c,.13*a+d);
endShape(CLOSE);
rectMode(CENTER);
rect(0+c,.32*a+d,.3*b+c,.03*a+d);

//Mustache and Eyebrows
noStroke();
fill(211,211,211);
//MUS
beginShape();
curveVertex(.35*b+c,.35*a+d);
curveVertex(.35*b+c,.35*a+d);
curveVertex(0+c,.22*a+d);
curveVertex(-.35*b+c,.35*a+d);
curveVertex(-.35*b+c,.35*a+d);
curveVertex(-.35*b+c,.35*a+d);
curveVertex(0+c,.3*a+d);
curveVertex(.35*b+c,.35*a+d);
curveVertex(.35*b+c,.35*a+d);
endShape();
//EBS
rect(.2*b+c,-.1*a+d,.28*b+c,.06*a+d);
rect(-.2*b+c,-.1*a+d,.28*b+c,.06*a+d);

//Glasses
noStroke();
fill(0,0,0);
//Right
beginShape();
curveVertex(.07*b+c,-.05*a+d);
curveVertex(.07*b+c,-.02*a+d);
curveVertex(.09*b+c,.06*a+d);
curveVertex(.21*b+c,.12*a+d);
curveVertex(.31*b+c,.06*a+d);
curveVertex(.33*b+c,-.02*a+d);
curveVertex(.33*b+c,-.05*a+d);
endShape();
//Left
beginShape();
curveVertex(-.07*b+c,-.05*a+d);
curveVertex(-.07*b+c,-.02*a+d);
curveVertex(-.09*b+c,.06*a+d);
curveVertex(-.21*b+c,.12*a+d);
curveVertex(-.31*b+c,.06*a+d);
curveVertex(-.33*b+c,-.02*a+d);
curveVertex(-.33*b+c,-.05*a+d);
endShape();

//Initial and Bow Tie
//TIE
noStroke();
fill(180,0,0);
ellipse(0+c,.53*a+d,.14*b+c,.13*a+d);
triangle(0+c,.53*a+d,.2*b+c,.46*a+d,.2*b+c,.6*a+d);
triangle(0+c,.53*a+d,-.2*b+c,.46*a+d,-.2*b+c,.6*a+d);
//INT
noFill();
strokeWeight(.02*a);
stroke(255,0,0);
arc(0+c,.53*a+d,.08*b+c,.08*a+d,.25*PI,PI+.75*PI);





