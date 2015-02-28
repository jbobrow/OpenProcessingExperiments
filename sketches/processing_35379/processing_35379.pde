
// homework 1
// copyright manuela Kind August 2011

//GENERAL
size(400, 400);
background(255, 200, 200);
noStroke();
smooth();


//LINES BACKGROUND
fill(255, 150, 150);
quad(20, 360, 20, 370, 360, 20, 350, 20);
quad(40, 380, 50, 380, 380, 40, 380, 30);

//INITIALS LEFT CORNER
//M
fill(255, 255, 255);
rect(20, 20, 10, 360);
triangle(30, 20, 60, 60, 90, 20);
rect(90, 20, 10, 90);

//K
fill(255, 255, 255);
rect(120, 20, 10, 90);
triangle(130, 60, 180, 20, 180, 110);

//G 
arc(230, 65, 70, 90, PI/90, TWO_PI-PI/2);
fill(255, 255, 255);
ellipse(230, 65, 55, 70); 
fill(255, 200, 200);
arc(230, 65, 55, 70, PI/2, TWO_PI-PI/180);
rect(230, 60, 36, 10);

// WHITE LINES
fill(255, 255, 255);
quad(20, 380, 30, 380, 380, 20, 370, 20);

// INITIALS RIGHT CORNER
translate(400, 400);
rotate(PI/1.0);

//M
fill(255, 255, 255);
rect(20, 20, 10, 360);
triangle(30, 20, 60, 60, 90, 20);
rect(90, 20, 10, 90);

//K
fill(255, 255, 255);
rect(120, 20, 10, 90);
triangle(130, 60, 180, 20, 180, 110);

//G 
arc(230, 65, 70, 90, PI/90, TWO_PI-PI/2);
fill(255, 255, 255);
ellipse(230, 65, 55, 70); 
fill(255, 200, 200);
arc(230, 65, 55, 70, PI/2, TWO_PI-PI/180);
rect(230, 60, 36, 10);



