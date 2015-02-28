
// Asignment 2: A Somewhat More Versatile but More Complex Drawing  
//Max Perim, Andrew ID: mperim copyright 2012
size (400, 400);
background (#FBFF3E);
smooth();
float x, y, posX, posY;
x=200;
y=200;
posX=200;
posY=200;
noStroke();
ellipse(posX, posY, x, y);
stroke(#FF8F1F);
strokeWeight (10);
//m initial
beginShape();
curveVertex(posX-.45*x, posY-0*y);
curveVertex(posX-.45*x, posY-0*y);
curveVertex(posX-.45*x, posY- .2*y);
curveVertex(posX-.35*x, posY-.3*y);
curveVertex(posX-.25*x, posY-.25*y);
curveVertex(posX-.25*x, posY-.25*y);
endShape();
beginShape();
curveVertex(posX-.25*x, posY-.25*y);
curveVertex(posX-.25*x, posY-.25*y);
curveVertex(posX-.15*x, posY-.3*y);
curveVertex(posX-.05*x, posY-.2*y);
curveVertex(posX-.05*x, posY-0*y);
curveVertex(posX-.05*x, posY-0*y);
endShape();
line(posX-.45*x, posY-0*y, posX-.05*x, posY-0*y);
//p initial 
stroke(#6FEDFA);
beginShape();
vertex(posX+.05*x, posY+.4*y);
vertex(posX+.05*x, posY+.4*y);
vertex(posX+.05*x, posY+0*y);
vertex (posX+.15*x, posY+0*y);
endShape();
beginShape();
curveVertex (posX+.15*x, posY+0*y);
curveVertex (posX+.15*x, posY+0*y);
curveVertex (posX+.25*x, posY+0*y);
curveVertex (posX+.35*x, posY+.1*y);
curveVertex (posX+.35*x, posY+.2*y);
curveVertex (posX+.25*x, posY+.25*y);
curveVertex (posX+.25*x, posY+.25*y);
endShape();
beginShape();
curveVertex (posX+.25*x, posY+.25*y);
curveVertex (posX+.25*x, posY+.25*y);
curveVertex (posX+.15*x, posY+.25*y);
curveVertex (posX+.15*x, posY+.25*y);
endShape ();
beginShape();
vertex (posX+.15*x, posY+.25*y);
vertex (posX+.15*x, posY+.4*y);
vertex (posX+.05*x, posY+.4*y);
endShape();

