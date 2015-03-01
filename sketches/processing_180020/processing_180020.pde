
/*
This is a portrait of Chad Hall
*/

/*
NOTES:
rect(a, b, c, d) a=x-coordinate, b=y-coordinate, c=width, d=height, (x,y)=(0,0) begins in the upper-left
COLOR = By default color is documented in (R, G, B, Alpha=Transparency(0:255))
ELLIPSE = Origin is at the center
*/

size(100,100); //set window size to 100x100px
background(0, 0, 255); //change background color

/* This is the shoulders */
noStroke(); // remove the stroke
ellipse(50,95,150,30); //draw an ellipse; this is the shoulders

/* This is the neck */
noStroke(); // remove the stroke
rect(30,60,40,50); //draw a rectangle; this is the neck

/* This is the head */
stroke(1); //add stroke
ellipse(50,30,65,90); //draw an ellipse; this is the shape of the face

/* These are the eyes */
ellipse(38,30,12,7); //draw an ellipse; this is the left eye
ellipse(38,30,6,6); //draw a circle; this is the left pupil
ellipse(38,30,2,2); //draw a circle; this is the center left pupil
ellipse(62,30,12,7); //draw an ellipse; this is the right eye
ellipse(62,30,6,6); //draw a circle; this is the right pupil
ellipse(62,30,2,2); //draw a circle; this is the center right pupil

/* This is the nose */

/* This is the mouth */
ellipse(50,55,20,5); //draw an ellipse; this is the shape of the mouth
line(40,55,60,55); //draw a line; this makes the lips

/* This is the hair */
translate(50,50); //shift coordinates to place (x,y)=(0,0) at center of artboard
rotate( radians(20) ); //rotate
ellipse(-10,-45, 50, 30); //this is the right part of the hair
rotate( radians(-20) ); //rotate back
rotate( radians(20) ); //rotate
ellipse(-40,-35,15,35); //this is the left part of the hair
rotate(-20); //rotate back
translate(-50,-50); //shift coordinates to place (x,y)=(0,0) back at upper-left of artboard

// arc(60, 5, 50, 30, 0, PI+PI, OPEN); //draw an arc



