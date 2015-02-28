
//HW 2
//copyright Allison Tran, January 19,2012

size(400,400);
background(255,150,0);
fill(255,90);


float x, y, wd, ht;
x=100;
y=100;
wd=200;
ht=200;
//A, pt1,2,3,4,5,
noStroke();
fill(255,90);
ellipse(x+1/2.0*wd,y+1/2.0*ht,wd+80,ht+80);
ellipse(x+1/2.0*wd,y+1/2.0*ht,wd+50,ht+50);


stroke(204, 102, 0);
strokeWeight(4);
point(x+(1/12.0)*wd,y+.75*ht);
point(x+.25*wd,y+.25*ht);
point(x+5/12.0*wd, y+.75*ht);
point(x+1/6.0*wd, y+.5*ht);
point(x+1/3.0*wd, y+.5*ht);
//K
point(x+.5*wd,y+5/12.0*ht);
point(x+.5*wd,y+11/12.0*ht);
point(x+.5*wd,y+8/12.0*ht);
point(x+2/3.0*wd,y+5/12.0*ht);
point(x+2/3.0*wd,y+11/12.0*ht);
//T
point(x+7/12.0*wd,y+1/6.0*ht);
point(x+11/12.0*wd,y+1/6.0*ht);
point(x+.75*wd,y+1/6.0*ht);
point(x+.75*wd,y+2/3.0*ht);

//curves
noFill();
beginShape();
//curveVertex(x+wd,y+ht);

vertex(x+(1/12.0)*wd,y+.75*ht);
vertex(x+.25*wd,y+.25*ht);
vertex(x+5/12.0*wd, y+.75*ht);
//curveVertex(x+.5*wd,y+ht);

endShape();

beginShape();
curveVertex(x+1/6.0*wd-25, y+.25*ht);
curveVertex(x+1/6.0*wd, y+.5*ht);
curveVertex(x+1/3.0*wd, y+.5*ht);
curveVertex(x+1/3.0*wd+25, y+.25*ht);
endShape();

//K
//point(x+.5*wd,y+5/12.0*ht);
//point(x+.5*wd,y+11/12.0*ht);
//point(x+.5*wd,y+8/12.0*ht);
//point(x+2/3.0*wd,y+5/12.0*ht);
//point(x+2/3.0*wd,y+11/12.0*ht);
//noFill();
//beginShape();
//vertex(x+.5*wd,y+8/12.0*ht);
//bezierVertex(x+.5*wd,y+8/12.0*ht, x+2/3.0*wd,y+5/12.0*ht, x+2/3.0*wd,y+5/12.0*ht);
//endShape();

noFill();

beginShape();
vertex(x+.5*wd,y+5/12.0*ht);
vertex(x+.5*wd,y+11/12.0*ht);
endShape();

beginShape();
curveVertex(x+.5*wd-100,y+8/12.0*ht);;
curveVertex(x+.5*wd,y+8/12.0*ht);
curveVertex(x+2/3.0*wd,y+5/12.0*ht);
curveVertex(x+2/3.0*wd,y+5/12.0*ht-100);
endShape();



beginShape();
curveVertex(x+.5*wd-100,y+8/12.0*ht);
curveVertex(x+.5*wd,y+8/12.0*ht);
curveVertex(x+2/3.0*wd,y+11/12.0*ht);
curveVertex(x+2/3.0*wd,y+11/12.0*ht+100);
endShape();
//T

beginShape();
curveVertex(x+7/12.0*wd+25,y+1/6.0*ht+50);
curveVertex(x+7/12.0*wd,y+1/6.0*ht);
curveVertex(x+11/12.0*wd,y+1/6.0*ht);
curveVertex(x+11/12.0*wd-25,y+1/6.0*ht+50);
endShape();

beginShape();
vertex(x+.75*wd,y+1/6.0*ht);
vertex(x+.75*wd,y+2/3.0*ht);
endShape();




