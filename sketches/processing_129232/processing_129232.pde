
// copyright Harris Mazur, hmazur

size (400,400);
background (49,49,49);

//background
fill (250,78,15);
strokeWeight (0);
rect (0,140,400,20);
fill (250,188,15);
quad (335,350,355,350,350,0,300,0);

fill (15,177,250);
alpha (0);
ellipse (75,275,75,75);

//H
strokeWeight (20);
strokeCap (SQUARE);
stroke (255);
line (75,50,75,250);
line (75,150,125,150);
line (175,50,175,250);

//A
fill (255);
stroke (150);
ellipse (200,200,75,75);
line (238,200,238,250);


//M
stroke (255);
line (175,250,238,400);
strokeCap (ROUND);
line (238,400,300,300);
strokeCap (SQUARE);
line (175,250,175,400);
line (325,350,325,400);

// saveFrame ( "hw1.jpg");











