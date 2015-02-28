
//elipses and circles
size (600,200);
smooth ();
background (#678c8b); 

noStroke ();
fill (#8fa89b, 200); // (hexcode, alpha--seethroughness)
ellipse (100, 100, 150, 100); // (centerX, centerY, width, height) 

fill (#a2bab0, 200); 
ellipse (200, 100, 150, 100); 

fill (#d0edde, 200); 
ellipse (300, 100, 150, 100); 

fill (#8fa89b, 200);
ellipse (400, 100, 150, 100); 

ellipseMode(CORNER);
fill(#8fa89b);
ellipse (500, 100, 150, 150); 
