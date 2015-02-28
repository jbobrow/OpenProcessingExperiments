
//Matt Dawson
//Copyright Matt Dawson 9/3/2012
//HW 2 Initials and variables

size(400,400);
background(255,255,255);
float x,y,wd,ht,d;
smooth();

x=200;
y=200;
wd=400;
ht=400;
d=200;


ellipseMode(CENTER);
stroke(4,15,203);
strokeWeight(2);
ellipse(x,y,d,d);

//Initial(M)
strokeWeight(2);
stroke(0,0,0);
fill(255,21,36);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x-(d/3),y-(d/3));
curveVertex(x-(d/2),y);
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x+(d/3),y-(d/3));
curveVertex(x+(d/2),y);
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

//Initial(A)
fill(4,203,49);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/10),y);
curveVertex(x-(d/8),y+(d/3));
curveVertex(x-(d/4),y+(d/10));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(d/3),y+(d/3));
endShape(CLOSE);

//Center initial(A)
fill(255,255,255);
beginShape();
curveVertex(x-(.45*d),y);
curveVertex(x-(.4*d),y);
curveVertex(x-(d/3),y-(d/5));
curveVertex(x-(d/6),y);
curveVertex(x-(d/3.5),y-(d/12));
curveVertex(x-(.4*d),y);
endShape(CLOSE);

//Initial (D)
fill(248,252,13);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/10),y);
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/3),y+(d/3));
endShape(CLOSE);

//Center Initial (D)
fill(255,255,255);
beginShape();
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/4),y+(d/4));
curveVertex(x+(.38*d),y);
curveVertex(x+(d/3.5),y-(d/10));
curveVertex(x+(d/5),y+(d/4));
curveVertex(x+(d/8),y+(d/3));

endShape(CLOSE);



