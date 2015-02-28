
//Isla Hansen ihansen@andrew.cmu.edu
//copyright 2012
//homework 2 - curved initials

size(400,400);
background(30,20,80);
smooth();
float x,y,w,h;

x=width*.5;
y=height*.5;
w=200;
h=200;

strokeCap(SQUARE);

noStroke();
fill(50,255,200);
ellipse(x,y,w,h);

fill(105,255,210);
ellipse(x-(.08*w),y-(.08*h),w*.4,h*.4);

fill(145,255,225);
ellipse(x-(.1*w),y-(.1*h),w*.3,h*.3);

fill(200,255,240);
ellipse(x-(.1*w),y-(.1*h),w*.2,h*.2);

fill(255,255,255);
ellipse(x-(.1*w),y-(.1*h),w*.1,h*.1);


noFill();
stroke(230,255,255);
strokeWeight(6);

//top of i
beginShape();
curveVertex(x+(.1*w),y-(.4*h));
curveVertex(x-(.1*w),y-(.4*h));
curveVertex(x-(.3*w),y-(.3*h));
curveVertex(x-(.45*w),y-(.1*h));
curveVertex(x-(.5*w),y+(.1*h));
endShape();

//bottom of i
beginShape();
curveVertex(x+(.1*w),y+(.4*h));
curveVertex(x-(.1*w),y+(.4*h));
curveVertex(x-(.3*w),y+(.3*h));
curveVertex(x-(.45*w),y+(.1*h));
curveVertex(x-(.5*w),y-(.1*h));
endShape();

//i vertical
beginShape();
curveVertex(x-(.2*w),y-(.4*h));
curveVertex(x-(.3*w),y-(.3*h));
curveVertex(x-(.3*w),y+(.3*h));
curveVertex(x-(.1*w),y+(.4*h));
endShape();

//h outside curve
beginShape();
curveVertex(x,y-(.3*h));
curveVertex(x+(.2*w),y-(.38*h));
curveVertex(x+(.36*w),y);
curveVertex(x+(.2*w),y+(.38*h));
curveVertex(x,y+(.3*h));
endShape();

//h inside curve
beginShape();
curveVertex(x-(.2*w),y-(.3*h));
curveVertex(x+(.05*w),y-(.40*h));
curveVertex(x+(.18*w),y);
curveVertex(x+(.05*w),y+(.40*h));
curveVertex(x-(.2*w),y+(.3*h));
endShape();

//h horizontal curve
beginShape();
curveVertex(x+(.7*w),y-(.2*h));
curveVertex(x+(.36*w),y);
curveVertex(x+(.18*w),y);
curveVertex(x-(.1*w),y-(.2*h));
endShape();
