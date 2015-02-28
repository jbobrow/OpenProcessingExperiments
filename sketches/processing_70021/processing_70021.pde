
// Set the size of the window background(255); // Draw a black background smooth();
size(200,200); 
background(255);
// Set ellipses and rects to CENTER mode ellipseMode(CENTER); rectMode(CENTER);
ellipseMode(CENTER);
rectMode(CENTER);

//The function smooth() enables “anti-aliasing” which smooths the edges of the shapes. no smooth() disables anti-aliasing.
//fig. 2.8
// Draw Zoog’s body 
stroke(0); 
fill(150);
rect(100,100,20,100);
// Draw Zoog’s head 
fill(255); 
ellipse(100,70,60,60);
// Draw Zoog’s eyes 
fill(0); 
ellipse(81,70,16,32); 
ellipse(119,70,16,32);
// Draw Zoog’s legs 
stroke(0); 
line(90,150,80,160); 
line(110,150,120,160);


