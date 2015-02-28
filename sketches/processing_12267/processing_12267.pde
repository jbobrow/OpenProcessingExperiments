
size (600, 600);
background (150, 255, 255);
smooth ();
noStroke ();

//clouds
fill (255);
//cloud 1
ellipse (75, 100, 100, 75);
ellipse (125, 50, 100, 75);
ellipse (150, 125, 125, 100);
ellipse (200, 75, 125, 75);
//cloud 2
ellipse (500, 100, 125, 75);
ellipse (450, 125, 125, 100);
ellipse (425, 75, 125, 75);

//grass
fill (00, 153, 00);
rect (0, 580, 600, 20);

//robot
ellipseMode (CORNER);

//legs
fill (255, 51, 0);
rect (270, 400, 20, 180);
rect (310, 400, 20, 180);

//feet
fill (255, 255, 0);
ellipse (260, 560, 40, 25);
ellipse (300, 560, 40, 25);

//body
fill (102, 0, 102);
rect (250, 340, 100, 150);
//buttons
fill (255, 255, 0);
triangle (265, 365, 270, 355, 275, 365);
fill (255, 50, 255);
rect (285, 355, 10, 10);
fill (0, 50, 255);
ellipse (305, 355, 10, 10);
//compartment belly
fill (150, 0, 150);
rect (295, 380, 45, 100);

//arms
fill (150, 0, 150);
beginShape ();
vertex (250, 355);
vertex (200, 395);
vertex (250, 445);
vertex (250, 425);
vertex (220, 395);
vertex (250, 375);
endShape ();
beginShape ();
vertex (350, 355);
vertex (400, 395);
vertex (350, 445);
vertex (350, 425);
vertex (380, 395);
vertex (350, 375);
endShape ();

//hands
fill (255, 255, 0);
arc (240, 420, 30, 25, .79, 5.81);
arc (330, 420, 30, 25, 3.77, TWO_PI+1.95);

//neck
fill (255, 51, 0);
rect (293.5, 320, 15, 20);
//head
fill (150, 0, 150);
ellipseMode (CENTER);
ellipse (300, 285, 75, 75);

//face
fill (255, 50, 255);
arc (300, 290, 50, 50, 0, 3.14);
noFill ();
strokeWeight (2);
stroke (0);
arc (285, 275, 20, 20, 3.14, 6.13);
arc (315, 275, 20, 20, 3.14, 6.13);


