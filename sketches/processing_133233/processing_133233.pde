



size(1000, 1000);
background (0, 0, 0);

// Declare variables here





//face
int square1;

//body
int square2;

//arms
int square3a;
int square3b; 

//legs
int square4a;
int square4b;

//stomach


square1 = 100;
square2 = 300;

// Draw code below here:
//face
fill (255, 0, 0, 100);
rect (400, 100, 100, square1); 

//nose
noStroke();
fill (100, 100, 100, 225);
ellipse (450, 110, 20, 20);

//mouth - learn to make it move
fill (#896A86); 
rect(430, 150, 40, 40, 20);





//teeth
fill (#FFFFFF);
rect(430, 150, 40, 5, 225);




//eyes
//left eye
fill (255, 0, 0);
rect(410, 110, 10, 10);


ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
fill(255);  // Set fill to white
ellipse(410, 110, 10, 10);  // Draw white ellipse using RADIUS mode

ellipseMode(CENTER);  // Set ellipseMode to CENTER
fill(100);  // Set fill to gray
ellipse(410, 110, 10, 10);  // Draw gray ellipse using CENTER mode

//right eye
fill (255, 0, 0);
rect(480, 110, 10, 10);

ellipseMode (RADIUS); 
fill(255);
ellipse(490, 110, 10, 10);

ellipseMode(CENTER); 
fill(100);
ellipse(490, 110, 10, 10);

//body
fill(0, 255, 0, 100);
rect(350, square1+100, 200, square2);

//stomach
fill(255);
ellipse(450, 400, 200, 200);

//feet
//left

fill (100, 100, 100);
rect (400, square1+300, 50, square1); 

//right
fill (100, 100, 100);
rect (460, square1+300, 50, square1); 







