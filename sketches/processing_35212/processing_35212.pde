
size (500, 480);
smooth ();
strokeWeight (2);
background (156, 202, 250);
ellipseMode (RADIUS);
// Neck
stroke(102); //Set stroke to gray
line (266, 257, 266, 162); // left
line (276, 257, 276, 162); // middle
line (286, 257, 286, 162); //right
// Antennae
line (276, 155, 246, 112); //small
line (276, 155, 306, 56); // tall
line (276, 155, 342, 170); //medium
//Body
noStroke(); //disable stroke
fill(190, 240, 157); //set fill to gray
ellipse(264, 377, 33, 33); //antigravity orb
fill(240, 157, 216); //set fill to black
rect(219, 257, 90, 120); //main body
fill(190, 240, 157); //set fill to gray
rect(219, 274, 90, 6); //gray stripe
//Head
fill(240, 157, 216); //set fill to black
ellipse(276, 155, 45, 45); //head
fill(255); // set fill to white
ellipse (288, 150, 14, 14); //large eye
fill(157, 170, 240); //set fill to black
ellipse(288, 150, 3, 3); //pupil
fill(243, 247, 25); //set fill to light gray
ellipse(263, 148, 5, 5); //small eye 1
ellipse(296, 130, 4, 4); //small eye 2
ellipse(305, 162, 3, 3); //small eye 3

