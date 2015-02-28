
// HW #2
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved
 
// setup
size(400, 400);
rectMode(CENTER);
background(120,160,200);
 
// initial variables
float x, y, wd, ht;

x = 100;
y = 100;
ht = 200;
wd = 200;

float radius1 = wd*4/5;
float radius2 = wd*4/5;

// ear
noStroke ();

fill( 255, 200, 185 );
beginShape();
vertex(x+wd*.1, y+ht*.4);
bezierVertex(x-wd*.05, y+ht*.45, x-wd*.05, y+ht*.55, x+wd*.1, y+ht*.6);
endShape();

// face
ellipse(x+wd/2,y+ht/2,wd*.9,ht*.9);

//hair
fill(255, 255, 255);
rect( x+wd*.1, y+ht*.35, wd*.17, ht*.25, 50, 50, 20, 20);
rect( x+wd/2, y+ht*.15, wd*.85, ht*.27, 90, 50, 50, 50);

// glasses
fill( 164, 248, 255);
stroke(200);
strokeWeight(x*.02);
rect( x+wd*.37, y+ht*.52, wd*.28, ht*.2, 0, 0, 20, 20); 
rect( x+wd*.75, y+ht*.52, wd*.28, ht*.2, 0, 0, 20, 20); 

// reflections
fill( 255, 255, 255);
stroke (255,255,255);
strokeWeight(2);

beginShape(LINES);
vertex(x+wd*.29, y + ht*.59);
vertex(x+wd*.37, y + ht*.45);
vertex(x+wd*.45, y + ht*.45);
vertex(x+wd*.37, y + ht*.59);

vertex(x+wd*.67, y + ht*.59);
vertex(x+wd*.75, y + ht*.45);
vertex(x+wd*.83, y + ht*.45);
vertex(x+wd*.75, y + ht*.59);

endShape();

//mustache
fill( 255, 255, 255);
arc(x+wd*.46, y+ht*.81, wd*.27, ht*.27, 0.75*PI,1.75*PI); 
arc(x+wd*.66, y+ht*.81, wd*.27, ht*.27, 1.25*PI,2.25*PI); 


// mouth
int mouthPosX = 200;
int mouthPosY = 220;
noStroke();
fill( 255, 160, 180 );
ellipse(x+wd*.56, y+ht*.82, wd*.04, ht*.1);

// nose "C"
noFill();
stroke( 255, 140, 130 );
strokeWeight(x*.01);
beginShape();
curveVertex( x+wd*.41, y+ht*.3 );
curveVertex( x+wd*.51,  y+ht*.65);
curveVertex( x+wd*.61,  y+ht*.65);
curveVertex( x+wd*.71, y+ht*.3 );
endShape();

//saveFrame ("hw_2_character");
