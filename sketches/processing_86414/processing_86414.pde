
//Hao-Yun Mei, hmei
//Copyright_Hao-Yun Mei_Carnegie Mellon University

size(400,400);
background(255,213,159);
smooth();
strokeCap(SQUARE);

// variables
float x, y, wd, ht;

// values for variables
x=200;
y=200;
wd=100;
ht=100;


// Glass
stroke(0);
fill(255);

// left lens
beginShape();
vertex(x-(wd*1.5),y-ht);
vertex(x-(wd*.2),y-ht);
vertex(x-(wd*.2),y-(ht*.4));
vertex(x-(wd*1.5),y-(ht*.4));
vertex(x-(wd*1.5),y-(ht*.7));
vertex(x-(wd*1.7),y-(ht*.7));
vertex(x-(wd*1.5),y-(ht*.7));
vertex(x-(wd*1.5),y-ht);
endShape();

// right lens
beginShape();
vertex(x+(wd*1.5),y-ht);
vertex(x+(wd*.2),y-ht);
vertex(x+(wd*.2),y-(ht*.4));
vertex(x+(wd*1.5),y-(ht*.4));
vertex(x+(wd*1.5),y-(ht*.7));
vertex(x+(wd*1.7),y-(ht*.7));
vertex(x+(wd*1.5),y-(ht*.7));
vertex(x+(wd*1.5),y-ht);
endShape();

// Glass middle
strokeWeight(3);
beginShape();
vertex(x-(wd*.2),y-(ht*.7));
vertex(x+(wd*.2),y-(ht*.7));
endShape();

// Moustache
strokeWeight(1);
fill(200);
beginShape();
curveVertex(x-(wd*1.25),y+(ht*.5));
curveVertex(x-(wd*1.25),y+(ht*.5));
curveVertex(x-(wd*1.4),y+(ht*.7));
curveVertex(x-(wd*1.25),y+(ht*.9));
curveVertex(x-wd,y+(ht*.85));
curveVertex(x-(wd*.6),y+(ht*.4));
curveVertex(x-(wd*.25),y+(ht*.3));
curveVertex(x,y+(ht*.45));
curveVertex(x+(wd*.25),y+(ht*.3));
curveVertex(x+(wd*.6),y+(ht*.4));
curveVertex(x+wd,y+(ht*.85));
curveVertex(x+(wd*1.25),y+(ht*.9));
curveVertex(x+(wd*1.4),y+(ht*.7));
curveVertex(x+(wd*1.25),y+(ht*.5));
curveVertex(x+(wd*1.5),y+(ht*.6));
curveVertex(x+(wd*1.57),y+(ht*.7));
curveVertex(x+(wd*1.55),y+(ht*.9));

curveVertex(x+(wd*1.4),y+(ht*1.1));
curveVertex(x+(wd*1.2),y+(ht*1.17));
curveVertex(x+(wd),y+(ht*1.15));
curveVertex(x+(wd*.7),y+(ht*1.1));
curveVertex(x+(wd*.5),y+(ht*1.05));
curveVertex(x+(wd*.2),y+(ht*.9));
curveVertex(x,y+(ht*.8));
curveVertex(x-(wd*.2),y+(ht*.9));
curveVertex(x-(wd*.5),y+(ht*1.05));
curveVertex(x-(wd*.7),y+(ht*1.1));
curveVertex(x-(wd),y+(ht*1.15));
curveVertex(x-(wd*1.2),y+(ht*1.17));
curveVertex(x-(wd*1.4),y+(ht*1.1));
curveVertex(x-(wd*1.55),y+(ht*.9));
curveVertex(x-(wd*1.57),y+(ht*.7));
curveVertex(x-(wd*1.5),y+(ht*.6));
curveVertex(x-(wd*1.25),y+(ht*.5));
curveVertex(x-(wd*1.25),y+(ht*.5));
endShape();

// wrinkle

beginShape();
vertex(x-wd,y-(ht*1.5));
vertex(x-wd,y-(ht*1.5));
vertex(x+wd,y-(ht*1.5));
vertex(x+wd,y-(ht*1.5));
endShape();

beginShape();
vertex(x-wd,y-(ht*1.6));
vertex(x-wd,y-(ht*1.6));
vertex(x+wd,y-(ht*1.6));
vertex(x+wd,y-(ht*1.6));
endShape();

beginShape();
vertex(x-wd,y-(ht*1.7));
vertex(x-wd,y-(ht*1.7));
vertex(x+wd,y-(ht*1.7));
vertex(x+wd,y-(ht*1.7));
endShape();

//saveFrame("hw2.jpg");




