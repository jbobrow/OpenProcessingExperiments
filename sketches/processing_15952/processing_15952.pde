


size(300,400);
background(255);
smooth();
noStroke();

// body & face
fill(255, 230, 0);
arc (110, 340, 65, 40, PI, TWO_PI);
arc (190, 340, 65, 40, PI, TWO_PI);
fill(0);
ellipse ( 150, 105, 145, 150);
ellipse ( 150, 215, 200, 200);
ellipse ( 150, 240, 170, 180);



//eye & mouse
fill(255);
ellipse ( 150, 240, 150, 150);
ellipse ( 120, 80, 22, 28);
ellipse ( 180, 80, 22, 28);
fill(255, 230, 0);
quad (150, 93, 160, 110, 150, 127, 140, 110 ); 

fill(0);
ellipse ( 120, 80, 10, 15);
ellipse ( 180, 80, 10, 15);



