
//Christopher Chan
//ckchan@andrew.cmu.edu
//Homework Assignment 2
//Written on Aug 2 2012
//T Th 11:30-1:30

size (400,400);
background (#CCCCCC);
smooth ();
float x, y, w, h;

ellipseMode (CENTER);
fill (#006666, 20);
stroke (0, 0, 0);
strokeWeight (2);
noStroke ();

x = width/2;
y = height/2;
w = 340;
h = 340;

ellipse (x, y, w, h);
ellipse (x, y, w*310/340, h*310/340);

fill (#AA0000, 20);
ellipse (x-w*100/340, y, w*100/340, h*100/340);
ellipse (x-w*100/340, y, w*110/340, h*110/340);

fill (#00AA00, 20);
ellipse (x, y, w*100/340, h*100/340);
ellipse (x, y, w*110/340, h*110/340);

fill (#0000AA, 20);
ellipse (x+w*100/340, y, w*100/340, h*100/340);
ellipse (x+w*100/340, y, w*110/340, h*110/340);


//LINE
curveTightness (-.75);
noFill ();
stroke (#666666);
strokeWeight (3);

//LEFT C

beginShape ();
curveVertex (x-w*50/340,y);
curveVertex (x-w*100/340,y-h*50/340);
curveVertex (x-w*150/340,y);
curveVertex (x-w*100/340,y+h*50/340);
curveVertex (x-w*50/340,y);
curveVertex (x-w*100/340,y-h*50/340);
endShape ();

line (x-w*50/340,y+h*65/340, x-w*50/340,y-h*147/340);

//K

beginShape ();
curveVertex (x+w*50/340,y);
curveVertex (x,y-h*50/340);
curveVertex (x-w*50/340,y);
curveVertex (x,y+h*50/340);
curveVertex (x+w*50/340,y);
curveVertex (x,y-h*50/340);
endShape ();

//RIGHT C

beginShape ();
curveVertex (x+w*100/340,y+h*50/340);
curveVertex (x+w*150/340,y);
curveVertex (x+w*100/340,y-h*50/340);
curveVertex (x+w*50/340,y);
curveVertex (x+w*100/340,y+h*50/340);
curveVertex (x+w*150/340,y);
endShape ();

saveFrame ("hw2.jpg");

