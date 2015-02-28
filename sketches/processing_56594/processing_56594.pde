

size(720, 480); 
smooth(); 
strokeWeight(3); 
background(176,244,238); 
ellipseMode(RADIUS);

// Head 
fill(0); //set fill to black
ellipse(288, 150, 50, 50); //large head
fill(255); //set fill to white
ellipse(300, 105, 15, 15); //middle right eye
fill(255); //set fill to white
ellipse(240, 150, 15, 15); //middle left eye
fill(255); //set fill to white
ellipse(240, 150, 5, 5); //small left eye
ellipse(300, 105, 5, 5); //small right eye
fill(255); //set fill to white
quad(270,150, 300, 130,315, 140, 290, 170);

//BODY
fill(0); //set fill to black
ellipse(330, 200, 30, 30); //BODY 1
fill(255); //set fill to white
ellipse(345, 190, 10, 10); //BODY 1 SMALL
fill(0); //set fill to black
ellipse(300, 240, 30, 30); //BODY 2
fill(255); //set fill to white
ellipse(285, 250, 10, 10); //BODY 2 SMALL

fill(0); //set fill to black
rect(320, 220, 15, 130); //LONG BODY

fill(0); //set fill to black
rect(305, 275, 45, 10); //SMALL BODY 1

fill(0); //set fill to black
rect(305, 295, 45, 10); //SMALL BODY 2

fill(0); //set fill to black
rect(305, 315, 45, 10); //SMALL BODY 3

fill(0); //set fill to black
ellipse(310, 355, 20, 20); //LEG 1

fill(0); //set fill to black
ellipse(345, 355, 20, 20); //BODY 1

