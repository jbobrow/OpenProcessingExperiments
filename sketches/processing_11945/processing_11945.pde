
//This is the brown back ground.
size(400,340);
background(209,184,137);

//The artist did not use defined lines. 
noStroke();
smooth();

//This is the slate colored base of the the painting. 
//It is actually gray in the painting but the beige background
//gives it an illisuion of a blue tint. Using the transparency 
//give is a normal grayish color

fill(145,154,225,99);
rect(0,190,400,400);




// THIS IS THE JARD WITH THE NARROW OPENING.....

//Box(es) on left w/ triangle
fill(219,184,137);
rect(90,135,95,120);
triangle(140, 90, 90,135, 180,135);
rect(130,53,20,90);

//shading
fill(131,104,68);
rect(170,135,10,120);
triangle(147, 97, 170,135, 180,135);
rect(145,53,5,50);

//___________________________________________________________
//THIS IS THE BLUE BOX ON THE RIGHT.....


//Box on the right
fill(117,167,170);
rect(180,110,95,150);

fill(0,40,50);
rect(260,110,15,150);

//shadow for the rectangle. 
fill(0,0,0,50);
rect(260,210,110,50);


//______________________________________________________________


//THIS IS THE CIRCLE IN BETWEEN THE JAR AND BOX.....

//Transparent Ellipse
//fill(r,g,b,t)
fill(0,0,0,50);
ellipse(200,285,80,20);

// IV
fill(137,110,110);
arc(180,270, 50,50 ,0, PI/2);

// III
fill(117,167,170);
arc(180,270, 50,50 , PI/2, PI);

// II
fill(117,167,170);
arc(180,270, 50,50, PI, TWO_PI-PI/2);

// I
fill(137,110,110);
arc(180,270, 50,50, TWO_PI-PI/2, TWO_PI);

//the three horizontal boxes in the circle.
fill(0,0,0);
rect(167,260, 30, 5);

fill(0,0,0);
rect(167,270, 30, 5);

fill(0,0,0);
rect(167,280, 30, 5);

//Veritcal box in circle
fill(0,0,0);
rect(180,247,5,45);


