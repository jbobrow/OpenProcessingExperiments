
// Samantha Chiu scchiu 2014
size (400, 400); 
background(255);
smooth ();

fill (114, 214, 227);
stroke (114, 214, 227);
quad(200, 10, 150, 100, 200, 150, 250, 100);

stroke (0);
strokeWeight(6);
line( 125, 125, 70, 200);
line(125, 125, 150, 155);
line(70, 200, 165, 200); //horizontal of S
line(165, 200, 200, 230);
line( 200, 230, 165, 270); // midpoint connection
line(165, 270, 30, 270);
line( 30, 270, 55, 230);

//start of C
stroke (0);
strokeWeight(6); 
line(200, 230, 275, 125);
line(275, 125, 295, 155);

line(200,230, 235, 270); //midpoint start

line(235, 270, 350, 270);
line(350, 270, 323, 230); 


//saveFrame( “hw1.jpg”); 



