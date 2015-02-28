
//Homework 2-Section 757
//Copyright Coral Pais
//Reproduction of the image or code without consent is sticly prohibited
//Caricature of Jim Roberts using CWP Initials

size (400,400);
float x=200;
float y=200;
float wd=250;
float ht=300;

background (9,86,108);


noStroke();
ellipse (x, y-ht*0.09, wd*1.05, ht*0.8);



//face
noStroke();
fill(243,235,194);
ellipse ( x,y, wd, ht);


//ears
fill(243,235,194);
ellipse (x-wd*0.48, y-ht*0.06, wd*0.25, ht*0.3);
ellipse (x+wd*0.48, y-ht*0.06, wd*0.25, ht*0.3);



//eyes
noStroke();
fill (0);
ellipse ( x-wd*0.22,y-ht*0.058, wd*0.08, ht*0.08);
ellipse ( x+wd*0.22,y-ht*0.058, wd*0.08, ht*0.08);

//glasses

stroke(127,127,127);
strokeWeight (4);
line(x-wd*0.24, y-ht*0.295, x-wd*0.14, y-ht*0.295); //top line left
line(x-wd*0.24, y-ht*0.025, x-wd*0.14, y-ht*0.025); //bottom line left
line(x-wd*0.24, y-ht*0.295, x+wd*0.24, y-ht*0.295); //top line middle

stroke(122,27,157);
strokeWeight (4);
line(x+wd*0.24, y-ht*0.295, x+wd*0.14, y-ht*0.295); //top line right
line(x+wd*0.24, y-ht*0.026, x+wd*0.14, y-ht*0.026); //bottom line right


noFill( );
arc (x+wd*0.24, y-ht*0.16, wd*0.32,  ht*.27, radians (-90), radians (100)); //right eye right curve
stroke(17,124,43);
arc (x-wd*0.24, y-ht*0.16, wd*0.32,  ht*.27, radians (90), radians (270)); //left eye left cuve


stroke(127,127,127);
noFill();

arc (x-wd*0.16, y-ht*0.16, wd*0.32,  ht*.27, radians (-90), radians (100)); //left eye right curve
arc (x+wd*0.16, y-ht*0.16, wd*0.32,  ht*.27, radians (80), radians (270)); //right eye left curve

//by ears

line (x-wd*0.39, y-ht*0.21, x-wd*0.45, y-ht*0.23); 
line (x+wd*0.39, y-ht*0.21, x+wd*0.45, y-ht*0.23);

//P straight line
stroke(122,27,157);
strokeWeight (4);
line (x+wd*0.2, y-ht*0.296,   x+wd*0.2, y+ht*0.244);

//moustache
strokeWeight(15);
stroke(255);
line (x-wd*0.26, y+ht*0.163,  x-wd*0.144, y+ht*0.09); 
line (x-wd*0.20, y+ht*0.177,  x-wd*0.132, y+ht*0.113); 
line (x-wd*0.164, y+ht*0.193, x-wd*0.156, y+ht*0.16);
line (x-wd*0.124, y+ht*0.197, x-wd*0.112, y+ht*0.113);
line (x-wd*0.068, y+ht*0.183, x-wd*0.068, y+ht*0.113);
line (x-wd*0.024, y+ht*0.183, x-wd*0.04, y+ht*0.11);
line (x+wd*0.024, y+ht*0.207, x,         y+ht*0.133);
line (x+wd*0.064, y+ht*0.2,   x+wd*0.06, y+ht*0.107);
line (x+wd*0.116, y+ht*0.193, x+wd*0.084, y+ht*0.12);
line (x+wd*0.148, y+ht*0.187, x+wd*0.12, y+ht*0.127);
line (x+wd*0.192, y+ht*0.203, x+wd*0.156, y+ht*0.103);
line (x+wd*0.232, y+ht*0.2,   x+wd*0.192, y+ht*0.123);
line (x+wd*0.2, y+ht*0.103,   x+wd*0.268, y+ht*0.167);

//lips-Initial W

strokeWeight (5);
stroke(162,85,21);
beginShape ();
curveVertex(x-wd*0.25,   y+ht*0.2);
 curveVertex(x-wd*0.25,   y+ht*0.2);
 curveVertex(x-wd*0.125,   y+ht*0.3);
 curveVertex(x,          y+ht*0.25);
 curveVertex(x+wd*0.125,   y+ht*0.3);
 curveVertex(x+wd*0.2,   y+ht*0.25);
 curveVertex(x+wd*0.2,   y+ht*0.25);
endShape ();











