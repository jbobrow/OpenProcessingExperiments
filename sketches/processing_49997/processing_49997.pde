
//homework #2 computer arts for processing 60-257
//copyright kyree holmes 2012

size(400,400);
background(158, 209, 187);
smooth();

//declare and define variables
float x, y, d;
x = 200;
y = 200;
d = 380;

//draw ellipse
noStroke(); 
ellipse(x, y, d, d);

//letter "h"
stroke(245, 238, 48);
strokeWeight(10);
beginShape();
  curveVertex(x+(d*.3), y-(d*.32));
  curveVertex(x+(d*.3), y-(d*.32));
  curveVertex(x, y);
  curveVertex(x+(d*.25), y+(d*.25));
endShape(); 


beginShape();
  curveVertex(x, y);
  curveVertex(x+(d*.25), y+(d*.25));
  curveVertex(x,y +(d* .5));
  curveVertex(x,y +(d* .5));
endShape(); 
  
//letter "k"
noFill();
stroke(226, 45, 47);
beginShape();
  curveVertex(x-(d*.25), y-(d*.32));
  curveVertex(x-(d*.25), y-(d*.32));
  curveVertex(x-(d*.25), y+(d*.25));
  curveVertex(x,y +(d* .5));
  curveVertex(x,y +(d* .5));
endShape();

beginShape();
  vertex(x-(d*.25), y+(d*.25));
  vertex(x-(d*.25),y +(d* .5));
endShape();

//glasses
stroke(151, 60, 0);
strokeWeight(10);
beginShape();
  vertex(x-(d*.5), y);
  vertex(x-(d*.25), y+(d*.25));
  vertex(x, y);
  vertex(x+(d*.25), y+(d*.25));
  vertex(x+d*.5, y);
  vertex(x-(d*.5), y);
endShape();

//save jpeg
//saveFrame("hw2.jpg");

