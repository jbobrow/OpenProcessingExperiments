
//copyright 2013 Kimberly Harvey all rights reserved

size( 500, 500 );  //window size

smooth( );

background(0, 28, 111);


float x, y, wd, ht;
//What does float mean? Allows you to have a decimal. It is a variable. Is float a bounding box?

x = 50;
y = 50;
wd = 400;
ht = 400;

noFill( );
strokeWeight (0);
 

//Hair
//ellipse(ht-2, wd-35, wd, ht);
noStroke( );
fill(100, 100,100);
ellipse(x+wd/2,(y+ht/2)-50,wd+20,ht+25);

//ellipse(x+wd/2,y+ht/2,wd,ht+25);// first two variables represent the center point for the ellipse so that they can be edited by the float

//HEAD
noStroke( );
fill(#FFE0B2);
ellipse(x+wd/2,y+ht/2,wd,ht+25);// first two variables represent the center point for the ellipse so that they can be edited by the float
fill(#FFE0B2);

//LEFT EYE POINT REFERENCES
strokeWeight( 10 );
stroke(#FFE0B2); // Color of point
point( x+wd/5.9,   y+ht/2.7);   //Beginning  control point
  
stroke(#FFE0B2); // Color of point
point( x+wd/2.7,   y+ht/2.7);   // Ending control point
stroke(#FFE0B2);  // Color of point
point( x+wd/3,   y+ht/2.35);   // Middle of curve control point
stroke(#FFE0B2);  // Color of point
point( x+wd/4.4,   y+ht/2.35);   // Middle of curve control point

// LEFT EYE CURVE
noFill();
stroke(0,0,0);
//bezier(x1, y1, x2, y2, x3, y3, x4, y4)
bezier(x+wd/5.9,   y+ht/2.7, x+wd/4,   y+ht/2.35, x+wd/4.8,   y+ht/2,  x+wd/2.6,   y+ht/2.7);

// RIGHT EYE CURVE
pushMatrix();
translate( (x+wd)/3,   0);//move somewhere else
//rotateY(PI); 
bezier(x+wd/5.9,   y+ht/2.7, x+wd/4,   y+ht/2.35, x+wd/4.8,   y+ht/2,  x+wd/2.6,   y+ht/2.7);
popMatrix();

//CLARINET
point(wd-x,ht+(x+x));//Triangle Point right
point(wd/3,ht+(x+x));//Triangle Point left
point(x*5,ht-x);//Triangle Point middle
fill(0,0,0);
triangle(wd-x,ht+(x+x), wd/3,ht+(x+x),x*5,ht-x);

//hands.. HOW DO I MAKE ONE A REFLECTION OF THE OTHER?
fill(#FFE0B2);
ellipse(x+95,ht+90,wd-250,ht-300);// first two variables represent the center point for the ellipse so that they can be edited by the float
ellipse(wd-50,ht+90,wd-250,ht-300);// first two variables represent the center point for the ellipse so that they can be edited by the float

//MOUSTACHE
//noStroke( );
//stroke(200,0,0);
//point(wd/2.5,ht-30);//bottom left
//point(wd/2.15,ht-75);//top left
//point(wd/1.15,ht-30);//bottom right
//point(wd/1.2,ht-75);//top right


fill(100,100,100);
noStroke( );
quad(wd/2.15, ht-75, wd/2.5, ht-30,wd/1.15, ht-30, wd/1.2, ht-75);

stroke(256,256,256);
line(wd-150, ht-10, wd-125,ht-10);
line(wd-150, ht+15, wd-100,ht+15);

