
size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

// Neck
stroke(102);               //Set stroke to gray
line(266, 257, 266, 162);  //Left
line(276, 257, 276, 162);  //Middle
line(286, 257, 286, 162);  //Right

//antennae
line(276, 155, 245, 112);  //small
line(276, 155, 306, 56);   //tall
line(276, 155, 342, 170);  //medium
line(276, 155, 200, 250);  //small
line(276, 155, 150, 80);   //tall
line(276, 155, 400, 200);  //medium

//body
noStroke();                //disable stroke
fill(102);                 //set fill to gray
ellipse(264, 377, 33, 33); //antigavity orb
fill(50);                  //set fill to gray
ellipse(300, 377, 33, 33); //antigraviety orb
fill(10);                  //set fill to gray
ellipse(330, 377, 33, 33); //antigraviety orb
fill(0);                   //set fil to black
rect(219, 257, 150, 130);   //main body
fill(102);                 //set fill to gray
rect(219, 274, 150, 6);     //gray stripe
fill(80);                 //set fill to gray
rect(219, 300, 150, 6);     //gray stripe
fill(40);                 //set fill to gray
rect(219, 340, 150, 6);     //gray stripe

//head
fill(0);                   //set fill to black
ellipse(276, 155, 45, 45); //head
fill (255);                //set fill to white
ellipse(288, 150, 12, 14); //large eye
fill(0);                   // set fill to black
ellipse(270, 150, 3, 3);   //pupil
fill (255);                //set fill to white
ellipse(250, 150, 12, 14); //large eye
fill(0);                   // set fill to black
ellipse(250, 150, 3, 3);   //pupil
fill(153);                 //set fill to light gray
ellipse(263, 148, 5, 5);   //small eye 1
ellipse(286, 130, 4, 4);   //small eye 2
ellipse(305, 162, 3, 3);   //small eye 3
ellipse(310, 156, 6, 6);   //small eye4



