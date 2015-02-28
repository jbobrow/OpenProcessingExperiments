
// homework 2
// copyright Joanne Ong September 2011 Pittsburgh, PA 15213

size( 400,400);
background(210 , 211, 169);
stroke(255, 255, 255);

float x, y, wd, ht;
x=200;
y=200;
wd=370;
ht=370;

float x2;
x2=196;


//circles
smooth();
ellipseMode(CENTER);
fill(109, 152, 136);
strokeWeight (3);
ellipse(x, y, wd, ht);
fill(70, 111, 126);
noStroke();
ellipse(x, y, .9*wd, .9*ht);

//////////////////////////////////////////

//Jshadow
strokeWeight (7);
stroke(210 , 211, 169);
beginShape( );
curveVertex(x-.27*wd, y-.2*ht);  //(100, 125);
curveVertex(x-.27*wd, y-.2*ht);  //(100, 125);
curveVertex(x-.27*wd, y+.07*ht); //(100, 225);
curveVertex(x-.30*wd, y+.12*ht); //(90, 245);
curveVertex(x-.32*wd, y+.12*ht); //(80, 245);
endShape();

//Mshadow
beginShape();
curveVertex(x-.16*wd, y-.2*ht);   //(140, 125);
curveVertex(x-.16*wd, y-.2*ht);   //(140, 125);
curveVertex(x-.16*wd, y+.12*ht);  //(140, 245);
curveVertex(x-.13*wd, y-.2*ht);   //(152, 125);
curveVertex(x-.04*wd, y-.18*ht);  //(184, 135);
curveVertex(x-.04*wd, y+.12*ht);  //(184, 245);
curveVertex(x-.01*wd, y-.2*ht);   //(196, 125);
curveVertex(x+.07*wd, y-.18*ht);  //(226, 135);
curveVertex(x+.08*wd, y+.12*ht);  //(228, 245);
curveVertex(x+.08*wd, y+.12*ht);  //(228, 245);
endShape();

//Oshadow
beginShape();
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x+.19*wd, y-.18*ht);  //(270, 135);
curveVertex(x+.19*wd, y+.09*ht);  //(270, 235);
curveVertex(x+.24*wd, y+.14*ht);  //(290, 250);
curveVertex(x+.3*wd, y+.09*ht);   //(310, 235);
curveVertex(x+.3*wd, y-.18*ht);   //(310, 135);
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
endShape();

//////////////////////////////////////////

//J
strokeWeight (7);
stroke(255, 255, 255);
beginShape( );
curveVertex(x2-.27*wd, y-.2*ht);  //(100, 125);
curveVertex(x2-.27*wd, y-.2*ht);  //(100, 125);
curveVertex(x2-.27*wd, y+.07*ht); //(100, 225);
curveVertex(x2-.30*wd, y+.12*ht); //(90, 245);
curveVertex(x2-.32*wd, y+.12*ht); //(80, 245);
endShape();

//M
beginShape();
curveVertex(x2-.16*wd, y-.2*ht);   //(140, 125);
curveVertex(x2-.16*wd, y-.2*ht);   //(140, 125);
curveVertex(x2-.16*wd, y+.12*ht);  //(140, 245);
curveVertex(x2-.13*wd, y-.2*ht);   //(152, 125);
curveVertex(x2-.04*wd, y-.18*ht);  //(184, 135);
curveVertex(x2-.04*wd, y+.12*ht);  //(184, 245);
curveVertex(x2-.01*wd, y-.2*ht);   //(196, 125);
curveVertex(x2+.07*wd, y-.18*ht);  //(226, 135);
curveVertex(x2+.08*wd, y+.12*ht);  //(228, 245);
curveVertex(x2+.08*wd, y+.12*ht);  //(228, 245);
endShape();

//O
beginShape();
curveVertex(x2+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x2+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x2+.19*wd, y-.18*ht);  //(270, 135);
curveVertex(x2+.19*wd, y+.09*ht);  //(270, 235);
curveVertex(x2+.24*wd, y+.14*ht);  //(290, 250);
curveVertex(x2+.3*wd, y+.09*ht);   //(310, 235);
curveVertex(x2+.3*wd, y-.18*ht);   //(310, 135);
curveVertex(x2+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x2+.24*wd, y-.22*ht);  //(290, 120);
endShape();

//saveFrame("hw2.jpg");



