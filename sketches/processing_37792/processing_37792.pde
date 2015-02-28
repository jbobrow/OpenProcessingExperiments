
// Draw the display window 200 pixels wide
// and 120 pixels high
background(120, 0, 0, 150);
size(600, 600);
int xCenter;
int yCenter;
int xMirror;
int xHairStart1;
int yHairStart1;
int xHairEnd1;
int yHairEnd1;
xCenter = 300;
yCenter = 300;
xMirror = 60;

xHairStart1 = xCenter;
yHairStart1 = 70;
xHairEnd1 = xCenter-140;
yHairEnd1 = 170;

smooth(); // Makes the lines draw with smooth edges
stroke(0); // Sets line value to black
strokeWeight(2); // Sets line width to 5 pixels

ellipseMode(CENTER);
fill(255);
//ears 
ellipse(xCenter - xMirror - 55, 225, 35, 80); // Large circle
ellipse(xCenter + xMirror + 55, 225, 35, 80); // Large circle
//head
fill(255);
ellipse(xCenter, 230, 220, 300);
//eyes
ellipse(xCenter - xMirror, 200, 60, 27); // Large circle
ellipse(xCenter + xMirror, 200, 60, 27); // Large circle
//iris
fill(255, 0, 0, 180);

ellipse(xCenter - xMirror, 200, 27, 27); // Large circle
ellipse(xCenter + xMirror-2, 200, 27, 27); // Large circle
strokeWeight(0); // Sets line width to 5 pixels
fill(255);
ellipse(xCenter - xMirror, 200, 10, 10); // Large circle
ellipse(xCenter + xMirror-2 , 200, 10, 10); // Large circle

strokeWeight(2); // Sets line width to 5 pixels
//nose
line(xCenter-5, 200, xCenter-5, 285 );
line(xCenter-5, 285, xCenter+10, 285 );
//mouth
line(xCenter-70, 255, xCenter-40, 315);
line(xCenter+70, 255, xCenter+40, 315);
fill(255);
line(xCenter-30, 315, xCenter+30, 315);

//bezier(xCenter-30, 315, xCenter-30, 330, xCenter+30, 330, xCenter+30, 315);
fill(1);
triangle(xCenter-27-5, 315, xCenter-27+5, 315, xCenter-27, 340 );
triangle(xCenter+27-5, 315, xCenter+27+5, 315, xCenter+27, 340 );

//hair
stroke(1); 
strokeWeight(20); // Sets line width to 5 pixels

//line(xHairStart1-45, yHairStart1, xHairEnd1, yHairEnd1);
line(xHairStart1-45, yHairStart1, xHairEnd1+60, yHairEnd1-60);
line(xHairStart1-45, yHairStart1, xHairEnd1+40, yHairEnd1-40);
line(xHairStart1-45, yHairStart1, xHairEnd1+40, yHairEnd1-20);
line(xHairStart1-30, yHairStart1-10, xHairEnd1+40, yHairEnd1);
line(xHairStart1-30, yHairStart1-10, xHairEnd1+60, yHairEnd1);
line(xHairStart1-15, yHairStart1-20, xHairEnd1+80, yHairEnd1);
line(xHairStart1-15, yHairStart1-20, xHairEnd1+100, yHairEnd1-10);
line(xHairStart1, yHairStart1-20, xHairEnd1+120, yHairEnd1-20);
line(xHairStart1, yHairStart1-20, xHairEnd1+140, yHairEnd1-30);
line(xHairStart1, yHairStart1-20, xHairEnd1+160, yHairEnd1-20);
line(xHairStart1+15, yHairStart1-20, xHairEnd1+180, yHairEnd1-10);
line(xHairStart1+15, yHairStart1-20, xHairEnd1+200, yHairEnd1);
line(xHairStart1+30, yHairStart1-10, xHairEnd1+220, yHairEnd1);
line(xHairStart1+30, yHairStart1-10, xHairEnd1+240, yHairEnd1);
line(xHairStart1+45, yHairStart1, xHairEnd1+240, yHairEnd1-20);
line(xHairStart1+45, yHairStart1, xHairEnd1+240, yHairEnd1-40);
line(xHairStart1+45, yHairStart1, xHairEnd1+220, yHairEnd1-60);
//line(xHairStart1+45, yHairStart1, xHairEnd1+280, yHairEnd1);




//// Draw the control points
//line(32, 20, 80, 5);
//ellipse(80, 5, 4, 4);
//line(80, 75, 30, 75);
//ellipse(80, 75, 4, 4);

//rect(10, 10, 50, 50);
//fill(204); // Light gray
//fill(153); // Middle gray
//fill(102); // Dark gray
//triangle(60, 10, 25, 60, 75, 65); // Filled triangle


