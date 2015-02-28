
size(107,204);
background(72,125,189);
smooth();

//green ellipse is here
fill(2,97,93);
ellipse(25,255,150,275);

//orange rectnagle is here
fill(241,108,51);
rect(0,0,50,125);

//black stroke line is here
stroke(13,13,23);
strokeWeight(3);
line(50,0,50,125);

noFill();
stroke(13,13,23);
strokeWeight(3);
beginShape();
curveVertex(50,125);
curveVertex(50,125);
curveVertex(95,204);
curveVertex(85,425);
endShape();

//yellow circles 1(from top to bottom)
int a;
float ellipseHeight = 13.0;
a = 13;

fill(251,255,104);
noStroke();
ellipse(18,15,a,ellipseHeight);
ellipse(18,45,a,ellipseHeight);
ellipse(18,75,a,ellipseHeight);
ellipse(18,105,a,ellipseHeight);

//black line in orange rectangle
noFill();
stroke(13,13,23);
strokeWeight(1);
line(25,0,25,125);

//black ellipse
fill(13,13,23);
noStroke();
ellipse(0,225,110,135);

//white ellipse
fill(255,255,255);
ellipse(0,175,21,21);

//pink ellipse
fill(235,213,214);
stroke(13,13,23);
ellipse(0,175,10,10);

//white stroke (ellipse)
noFill();
stroke(255,255,255);
ellipse(5,207,28,18);









