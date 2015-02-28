
// Mitsuko Verdery 
// hw#2
// 60-257 A
// copyright 2012

size(400,400);
float x, y, wd, ht;
 x= 200;
 y= 200;
 wd = 300;
 ht = 300;

background(0,0,0);
smooth();

stroke(255,46,99);
strokeWeight(10);
fill(255, 255, 255);
ellipseMode(CENTER);
ellipse(x,y,wd,ht);

stroke(255, 255, 255);
triangle(x, y, x - .16*wd, y + .5*ht, x + .2*wd, y + .5*ht);

fill(0,0,0);
stroke(255, 46, 99);
strokeWeight(10);
triangle(x, y, x - .2*wd, y -.5*ht, x + .17*wd, y - .5*ht);

stroke(0, 0, 0);
strokeWeight(20);
line(x - .74*wd, y - .5*ht, x + .17*wd, y - .5*ht);

stroke(145, 13, 125);
strokeWeight(10);
line(x - .25*wd, y - .53*ht, x, y + .04*ht);
stroke(145, 13, 125); 
line(x + .21*wd, y - .53*ht, x, y + .04*ht);

stroke(255, 255, 11);
strokeWeight(10);
noFill();
beginShape();
curveVertex(x +.3*wd, y -.3*ht);
curveVertex(x +.27*wd, y -.27*ht);
curveVertex(x +.15*wd, y -.38*ht);
curveVertex(x +.15*wd, y -.38*ht);
curveVertex(x +.1*wd, y -.4*ht); 
curveVertex(x -.1*wd, y -.4*ht);
curveVertex(x -.25*wd, y -.27*ht);
curveVertex(x -.13*wd, y -.1*ht);
curveVertex(x +.17*wd, y +.06*ht);
curveVertex(x +.35*wd, y +.2*ht);
curveVertex(x +.26*wd, y +.33*ht);
curveVertex(x -.1*wd, y +.32*ht);
curveVertex(x -.17*wd, y +.38*ht);
curveVertex(x +.28*wd, y +.26*ht);
endShape();
                                                
