
// Example 2-1: Zoog again
size(200,200);  // Set the size of the window
background(740);  // Draw a white background
smooth();
 
// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);
 
// Draw Zoog's body
stroke(0);
fill(150);
rect(100,100,20,100);
 
// Draw Zoog's head
fill(230);
ellipse(100,70,60,60);
 
// Draw Zoog's eyes and mouth
fill(150);
ellipse(88,62,19,9);
ellipse(111,62,19,9);
ellipse(100,86,16,9);
 
// Draw Zoog's legs
stroke(0);
line(90,150,80,180);
line(110,150,120,180);
line(90,105,50,75);
line(110,105,150,75);
