
//QUESTION 7

//CENTER, RADIUS, CORNER, or CORNERS.

size(300,300);
smooth();

fill(50);
ellipseMode  (CENTER); //CENTER is the standard, 
ellipse(50,50,100,100); //it places the center of the ellipse by x and y.

fill(100);
ellipseMode  (RADIUS); //RADIUS makes the height and width measured as radius and not diameter
ellipse(250,50,100/2,100/2); 
//That is why i have divided by 2 

fill(150);
ellipseMode  (CORNER); //CORNER places the ellipse by top right corner.
ellipse(0,200,100,100); 

fill(200);
ellipseMode  (CORNERS); //CORNERS places the ellipse by two corners
ellipse(200,200,300,300); //It uses corners to determine both placement and size.

