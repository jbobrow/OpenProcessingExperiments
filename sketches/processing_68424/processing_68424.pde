
//Copyright © 2012 Dakotah Konicek
//HW2

size(400,400);
smooth();
background(100);
float x,y,wd,ht;
x=.5*width;
y=.5*height;
wd=250;
ht=250;
ellipseMode(CENTER);
fill(80,103,122);
ellipse(x,y,wd,ht);

//inner ellipse
fill(164,210,250);
ellipse(x,y,.8*wd,.8*ht);
noFill();

//Line for D
stroke(#FAF142);
strokeWeight(5);
arc(x,y, .4*wd, .4*ht, -PI,0);

//Line for K
stroke(#FAF142);
strokeWeight(5);
beginShape();
curveVertex(x-(.3*wd), y+(.45*wd));
curveVertex(x-(.2*wd), y+(.3*wd));
curveVertex(x-(.1*wd), y+(.15*wd));
curveVertex(x, y);
curveVertex(x+(.1*wd), y+(.15*wd));
curveVertex(x+(.2*wd), y+(.3*wd));
curveVertex(x+(.3*wd), y+(.45*wd));
endShape();

//Line for D and K
stroke(80,103,122);
strokeWeight(5);
beginShape();
vertex(x-(.3*wd), y);
vertex(x+(.3*wd),y);
endShape();

//saveFrame("hw2.jpg");

