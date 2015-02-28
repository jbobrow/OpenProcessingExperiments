
//Gloriana Gonzalez
//gloriang@andrew.cmu.edu
//Homework #2
//Copyright Gloriana Gonzale, Pittsburgh, August 2012

size(400, 400);

float x, y, w, h;
x=width*.5;
y=height*.5;
w= 150;
h= 150;

background (140, 195, 195);
strokeWeight(10);
stroke(210, 75, 75, 50);
fill(190, 225, 225);
ellipse(x+x*.1, y, w*1.8, h*1.8);
fill(190, 225, 225, 60);
strokeWeight(15);
stroke(240,180,100, 70);
ellipse(x+x*.1, y, w*2.2, h*2.2);


//Left G
noStroke();
fill(240,180,100);
beginShape();
vertex(x, y+.5*h);
vertex(x, y);
vertex(x-w*.2, y);
vertex(x-w*.2, y+h*.1);
vertex(x-w*.1, y+h*.1);
vertex(x-w*.1, y+h*.3);
vertex(x-w*.4, y+h*.3);
vertex(x-w*.4, y-h*.3);
vertex(x, y-h*.3);
vertex(x, y-h*.5);
vertex(x-w*.5, y-h*.5);
vertex(x-w*.5, y+h*.5);
vertex(x, y+.5*h);
endShape();


//Right G
fill (210, 75, 75);
beginShape();
curveVertex(x+w*.7,y+.5*h);
curveVertex(x+w*.7, y+.5*h);
curveVertex(x+w*.7, y);
curveVertex(x+w*.7-w*.2, y);
curveVertex(x+w*.7-w*.2, y+h*.1);
curveVertex(x+w*.7-w*.1, y+h*.1);
curveVertex(x+w*.7-w*.1, y+h*.3);
curveVertex(x+w*.7-w*.4, y+h*.3);
curveVertex(x+w*.7-w*.4, y-h*.3);
curveVertex(x+w*.7, y-h*.3);
curveVertex(x+w*.7, y-h*.5);
curveVertex(x+w*.7-w*.5, y-h*.5);
curveVertex(x+w*.7-w*.5, y+h*.5);
curveVertex(x+w*.7, y+.5*h);
curveVertex(x+w*.7,y+.5*h);
endShape();

//saveFrame("hw2.jpg");






