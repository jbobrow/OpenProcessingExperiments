

//Homework 2
//Copyright Meghna Raghunathan
size (400,400);

float x, y, w, h ;

x= 200;
y= 200;
w= 300;
h= 300;

noFill();
noStroke();
fill ( 250, 232,220);
ellipse ( x,y,w,h);
ellipse ( x-0.42*w,y,.25*w,.25*h);
ellipse ( x+0.42*w,y,.25*w,.25*h);


stroke(85, 70, 70);
strokeWeight(20);
line(x,y+.15*h,x-.5*w,y+.31*h);
line(x,y+.15*h,x+.5*w,y+.31*h);

stroke(85, 70, 70);
strokeWeight(2);
ellipse ( x,y,.25*w, .25*h);

noStroke();
noFill();
noStroke();
fill ( 250, 232,220);
ellipse ( x,y-0.02*h,.25*w, .25*h);



stroke(85, 70, 70);
strokeWeight(2);
line( x,y-.25*h,x+.5*w,y-.31*h);
line(x-.5*w,y-.25*h,x,y-.25*h);
line( x,y-.05*h,x+.5*w,y-.11*h);
line(x-.5*w,y-.05*h,x,y-.05*h);
line( x,y-.25*h,x,y-.05*h);
line(x-.5*w,y-.25*h,x-.5*w,y-.05*h);
line(x+.5*w,y-.31*h,x+.5*w,y-.11*h);


stroke(85, 70, 70);
strokeWeight(20);
line(x,y+.15*h,x-.5*w,y+.31*h);
line(x,y+.15*h,x+.5*w,y+.31*h);



noStroke();
fill ( 250, 232,220);
// mouth
noFill();

noFill();
stroke(85, 70, 70);
strokeWeight(2);
beginShape();
curveVertex(x-0.2*h,y+0.25*h);
curveVertex(x-0.1*h,y+0.3*h);
curveVertex(x,y+0.4*h);
curveVertex(x+0.2*h,y+0.3*h);
curveVertex(x+0.1*h,y+0.25*h);
endShape();

noStroke();
fill ( 85, 70, 70);

ellipse( x+.25*w,y+-.19*h,.05*h,.05*w );

ellipse( x-.25*w,y+-.19*h,.05*h,.05*w );
saveFrame(homework2.jpg);



