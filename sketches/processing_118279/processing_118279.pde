
size (800, 500);
background (255, 255, 255);

//L

fill (0, 0, 0);
noStroke();
rect (25, 25, 75, 450);
rect (25, 400, 300, 75);
ellipse (325, 438, 75, 75);

//E

fill (255, 0, 0);
noStroke();
rect (125, 25, 200, 75);

fill (0, 0, 0);
noStroke();
rect (125, 125, 200, 75);
rect (125, 225, 200, 75);

//N

pushMatrix();
translate (440, 10);
rotate (0.7); 
fill (130, 130, 130);
stroke (0, 0, 0);            
rect (0, 25, 210, 45);
popMatrix();

fill (0, 0, 0);
noStroke();
rect (350, 25, 75, 350);
rect (550, 25, 75, 175);

fill (255, 0, 0);
noStroke();
ellipse (325, 350, 50, 50);
ellipse (275, 350, 50, 50);
ellipse (225, 350, 50, 50);

ellipse (650, 50, 50, 50);
ellipse (700, 50, 50, 50);
ellipse (750, 50, 50, 50);

//A

fill (0, 0, 0);
noStroke();
rect (450, 225, 325, 250);

fill (255, 255, 255);
noStroke();
ellipse (612, 325, 175, 75);
ellipse (612, 437, 175, 100);
