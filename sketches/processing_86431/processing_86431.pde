
// Christian Murphy csmurphy
// Home work 2
// Copyright January 2013

size ( 400, 400 );
background ( 250, 190, 114 );


float x, y, wd, ht;
x = 200;
y = 200;
wd = 100;
ht = 120;
ellipseMode(CENTER);
fill(227, 178, 133);
strokeWeight(36);
stroke(100, 322, 43);
noStroke();
ellipse(x*1.1, y, wd, ht);
fill( 227, 224, 220);
rect( x*1.1, y*.3, wd, ht*.25);
noFill();
//rect( x*.5, y*.5, wd*.7, ht*.5 );
ellipseMode (CORNER);
fill( 255, 255, 255 );
ellipse(  x*.5, y*.5, wd*.7, ht*.5 );
fill( 103, 160, 98 );
ellipse( x*.5, y*.6, wd*.5, ht*.3 );
noFill();
rect( x*1.3, y*.5, wd*.7, ht*.5 );
ellipseMode (CORNER);
fill( 255, 255, 255 );
ellipse(  x*1.3, y*.5, wd*.7, ht*.5 );
fill( 103, 160, 98 );
ellipse( x*1.3, y*.5, wd*.5, ht*.3 );
fill( 227, 224, 220);
rect( x*.47, y*.28, wd, ht*.18);
fill( 219, 154, 69 );
strokeWeight(4);
stroke(250, 250, 250);
curve(x*2, y*2, wd*3, ht*3, x*1.7, y*1.7, wd*.5, ht);
fill( 227, 178, 133 );
triangle(x*1.4, y*1.3, wd*1.6, ht*1.6, x*.79, y*1.5);
strokeWeight(12);
stroke(250, 250, 250);
fill(245, 184, 244);
beginShape (TRIANGLE_STRIP);
vertex(x*1.6, y*1.9);
vertex(x*1.9, y*1.9);
vertex(x*1.7, y*1.7);
vertex(x*1.5, y*1.8);
vertex(x*1.9, y*1.89);
vertex(x*1.125, y*1.76);
endShape();
noFill();
beginShape();
curveVertex(wd*2,  ht*1.5);
curveVertex(wd*1.7,  ht*.8);
curveVertex(wd,  ht);
curveVertex(wd,  ht);
curveVertex(wd, ht);
curveVertex(wd, ht);
endShape();
fill( 1, 208, 2 );
strokeWeight(67);
line(x*1.7, y*1.6, x*1.2, y*1.7);



