
/*
This is a self-portrait of Chad Hall
*/

/*
rect(a, b, c, d) a=x-coordinate, b=y-coordinate, c=width, d=height, (x,y)=(0,0) begins in the upper-left
COLOR = By default color is documented in (R, G, B, Alpha=Transparency(0:255))
ELLIPSE = Origin is at the center
*/

/* General Canvas Settings */
size(100,100); //set window size to 100x100px
background(17,189,237); //change background color

/* This is the shoulders */
noStroke(); // remove the stroke
fill(244,201,130); //change color
ellipse(50,95,150,30); //draw an ellipse; this is the shoulders

/* This is the neck */
fill(244,201,130); //change color
rect(30,60,40,50); //draw a rectangle; this is the neck

/* This is the head */
fill(244,213,163); //change color
ellipse(50,30,65,90); //draw an ellipse; this is the shape of the face

/* These are the eyes */
fill(255,255,255); //change color
ellipse(38,30,12,7); //draw an ellipse; this is the left eye
fill(6,199,119); //change color
ellipse(38,30,7,7); //draw a circle; this is the left pupil
fill(0,0,0); //change color
ellipse(38,30,3,3); //draw a circle; this is the center left pupil
fill(255,255,255); //change color
ellipse(62,30,12,7); //draw an ellipse; this is the right eye
fill(6,199,119); //change color
ellipse(62,30,7,7); //draw a circle; this is the right pupil
fill(0,0,0); //change color
ellipse(62,30,3,3); //draw a circle; this is the center right pupil

/* This is the nose */

/* This is the mouth */
fill(237,159,126); //change color
ellipse(50,55,20,5); //draw an ellipse; this is the shape of the mouth
fill(168,115,93); //change color
line(40,55,60,55); //draw a line; this makes the lips

/* This is the hair */
fill(161,106,11); //change color
translate(50,50); //shift coordinates to place (x,y)=(0,0) at center of artboard
rotate( radians(20) ); //rotate
ellipse(-10,-45, 50, 30); //this is the right part of the hair
rotate( radians(-20) ); //rotate back
rotate( radians(20) ); //rotate
ellipse(-40,-35,15,35); //this is the left part of the hair
rotate(-20); //rotate back
translate(-50,-50); //shift coordinates to place (x,y)=(0,0) back at upper-left of artboard

// arc(60, 5, 50, 30, 0, PI+PI, OPEN); //draw an arc



