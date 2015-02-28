
size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);


// Neck 
stroke(128);              //set stroke to gray 
line(266, 257, 266, 162); // left
line(276, 257, 276, 162); //middle
line(286, 257, 286, 162);//right


// Antennae
line(276, 140, 246, 112); //small
line(276, 155, 306, 56); //tall
line(276, 100, 532, 400);//medium 

// Antennae
line(300, 140, 246, 112); //small
line(300, 400, 306, 56); //tall
line(276, 100, 342, 170);//medium 


// Body

noStroke();  //disable stroke
fill(102);    // set fill to gray
ellipse(264, 377, 33, 33);  //antigravity orb 
fill(0);                  //set fill to black 
rect(219, 257, 90, 120);  // main body 
fill(102); // set fill to gray
rect(280, 2280, 140, 15);// gray stripe 


// Head 
fill(0); //set fill to black 
ellipse(276, 155, 45, 45); //head
fill(255);// set fill to white
ellipse(288, 150, 14, 14); //large eye
fill(0);// set fll to black 
ellipse(288, 150, 3, 3); //pupil
fill(153);//set fill to light gray 
ellipse(263, 148, 5, 5); // small eye 1
ellipse(296, 130, 4, 4); // small eye 2
ellipse(305, 162, 3, 3);// small eye 3

fill(0); //set fill to black 
ellipse(300, 100, 45, 45); //head
fill(255);// set fill to white
ellipse(288, 150, 14, 14); //large eye
fill(0);// set fll to black 
ellipse(288, 150, 3, 3); //pupil
fill(153);//set fill to light gray 
ellipse(263, 148, 5, 5); // small eye 1
ellipse(296, 130, 4, 4); // small eye 2
ellipse(305, 162, 3, 3);// small eye 3






