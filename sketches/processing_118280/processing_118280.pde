
size (800, 500);
background (255, 255, 255);

//L

fill (0, 0, 0);
noStroke();

rect (25, 25, 50, 450);
rect (25, 425, 300, 50);

ellipse (325, 450, 50, 50);

fill (255, 0, 0);
ellipse (375, 450, 50, 50);

fill (130, 130, 130);
ellipse (425, 450, 50, 50);

//E

fill (130, 130, 130);
rect (100, 25, 225, 50);

fill (0, 0, 0);
rect (100, 125, 225, 50);
rect (100, 225, 225, 50);

fill (255, 0, 0);
ellipse (125, 100, 50, 50);
ellipse (125, 200, 50, 50);

//N

pushMatrix ();
translate (380, 10);
rotate (1.05);
fill (255, 0, 0);
rect (30, 0, 360, 25);
popMatrix();

fill (0, 0, 0);
rect (350, 25, 50, 350);
rect (550, 25, 50, 350);

fill (130, 130, 130);
ellipse (275, 350, 50, 50);

fill (255, 0, 0);
ellipse (325, 350, 50, 50);
ellipse (625, 50, 50, 50);
ellipse (675, 50, 50, 50);

//A

fill (0, 0, 0);
rect (625, 100, 150, 375);

fill (255, 255, 255);
ellipse (700, 175, 50, 50);
ellipse (700, 362, 50, 250);
