
size (183, 186);
background (25, 100, 215);

noStroke ();

fill (183, 0, 13); // protruding red ellipse
ellipse (130, 125, 110, 90);
fill (1); // black mark
ellipse (88, 123, 25, 40);

beginShape (); //black blob
fill (1);
vertex (130, 0); // top point
bezierVertex (150, 40, 70, 90, 170, 186); // vertex 170, 186 - bottom point
bezierVertex (175, 186, 183, 186, 183, 160); // right point
vertex (183, 0); //UR corner
endShape (CLOSE);
fill (1); // bottom bulge
ellipse (150, 150, 100, 90);


beginShape (); // top banana
fill (236, 113, 9);
vertex (50, 0); // left point
bezierVertex (70, 90, 130, 80, 183, 30); // vertex 183, 30 - right point
vertex (150, 0);
bezierVertex (130, 40, 70, 20, 60, 0);
endShape (CLOSE);
fill (1); // black mark
ellipse (55, 5, 10, 20);
fill (183, 0, 13); // red bit
ellipse (80, 50, 20, 12);
beginShape (); // white cap
fill (255, 255, 255);
vertex (150, 0);
vertex (130, 18);
vertex (160, 50);
vertex (183, 30);
vertex (183, 0);
endShape (CLOSE);

fill (234, 206, 0); // mid mango
beginShape (); 
vertex (165, 45); // top point
bezierVertex (120, 60, 160, 90, 123, 113); // vertex 123, 133 - left point
vertex (123, 113); 
bezierVertex (120, 140, 160, 160, 183, 150); // lower right point
vertex (183, 45);
endShape (CLOSE);
fill (236, 113, 9); // orange patch
beginShape ();
vertex (160, 75); // top point
bezierVertex (120, 60, 160, 90, 123, 113); // vertex 123, 133 - left point
bezierVertex (120, 120, 120, 125, 130, 136); // vertex 130, 136 - lower right point
vertex (130, 136);
bezierVertex (165, 120, 165, 70, 160, 80); // vertex 160, 90 - right point
endShape (CLOSE);
fill (183, 0, 13); // red patch
beginShape ();
vertex (170, 110); // upper left point
bezierVertex (170, 140, 120, 140, 150, 150); // vertex 150, 150 - left point
bezierVertex (160, 152, 170, 156, 183, 150); //vertex 183, 150 - right point
vertex (183, 110);
vertex (175, 100);
vertex (183, 110);
endShape (CLOSE);

stroke (1); // orange protrusion
strokeWeight (5);
fill (236, 113, 9);
ellipse (183, 30, 40, 50);
noStroke ();
fill (255);
rect (150, 0, 40, 15); 

// Finishing touches would include white patches with black dots







