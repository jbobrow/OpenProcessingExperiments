
size(400,400);
smooth();
background(193);

float x = 0;
float y = 0;
float d1 = 350;
float d2 = (d1 * .571);

//Record
noStroke();
ellipseMode(CENTER);
fill(29,32,77,150);
ellipse(width * .5 + x, height * .5 + y,d1,d1);
fill(255,255,255);
ellipse(width * .5 + x, height * .5 + y,d2,d2);

//Hole
stroke(0);
strokeWeight(7);
point(width * .5 + x, height * .5 + y);

//Grooves
noFill();
stroke(80);
strokeWeight(2);
strokeCap(SQUARE);
arc(width * .5 + x, height * .5 + y, d1 * .857, d1 * .857, PI/2, PI);
stroke(27,33,124,150);
arc(width * .5 + x, height * .5 + y, d1 * .714, d1 * .714, 0, PI);
stroke(150,0,20,150);
arc(width * .5 + x, height * .5 + y, d1 * .786, d1 * .786, 3*PI/2, 2 * PI);

//S
noFill();
stroke(0);
strokeCap(SQUARE);
strokeWeight(3);
curveTightness(1);
beginShape();
  curveVertex((d2/2 * cos(radians(0))) +  width * .5 + d1 * .429 + x, (d2/2 * sin(radians(0))) + height * .5 + y);
  curveVertex((d2/2 * cos(radians(0))) +  width * .5 + x, (d2/2 * sin(radians(0))) + height * .5 + y);
  curveVertex((d2/2 * cos(radians(0))) +  width * .5 - .35 * d2 + x, (d2/2 * sin(radians(0))) + height * .5 + y);
  curveVertex((d2/2 * cos(radians(135))) +  width * .5 + .65 * d2 + x, (d2/2 * sin(radians(135))) + height * .5 + y);
  curveVertex((d2/2 * cos(radians(135))) + width * .5 + x, (d2/2 * sin(radians(135))) + height  * .5 + y);
  curveVertex((d2/2 * cos(radians(135))) + width * .5 - d2 * 1 + x, (d2/2 * sin(radians(135))) + height  * .5 + y);
endShape();

//D.Line
noFill();
stroke(0);
strokeCap(SQUARE);
strokeWeight(1);
curveTightness(0);
beginShape();
  vertex((d2/2 * cos(radians(135))) +  width * .5 + x, (d2/2 * sin(radians(135))) + height * .5 + y);
  vertex((d2/2 * cos(radians(225))) + width * .5 + x, (d2/2 * sin(radians(225))) + height  * .5 + y);
endShape();

//D.Curve
noFill();
stroke(0);
strokeCap(SQUARE);
strokeWeight(3);
beginShape();
  curveVertex((d2/2 * cos(radians(135))) +  width * .5 - d2 * 1.375 + x, (d2/2 * sin(radians(135))) + height * .5 + y);
  curveVertex((d2/2 * cos(radians(135))) +  width * .5 + x, (d2/2 * sin(radians(135))) + height * .5 + y);
  curveVertex(width * .5 + x, height * .5 + y);
  curveVertex((d2/2 * cos(radians(225))) + width * .5 + x, (d2/2 * sin(radians(225))) + height  * .5 + y);
  curveVertex((d2/2 * cos(radians(225))) + width * .5 - d2 * 1.375 + x, (d2/2 * sin(radians(225))) + height  * .5 + y);
endShape();



