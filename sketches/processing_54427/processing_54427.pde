
size (800, 700);
smooth ();
//triangle
fill(43, 222, 76);
triangle(400, 150, 500, 70, 530, 200);
//big eye
strokeWeight (10);
fill(255);
ellipse(400, 150, 90, 90);
//pupil
strokeWeight(4);
fill(43, 82, 222);
ellipse (400, 150, 20, 20);
//neck
line(400, 195, 400, 350);
//cross section
strokeWeight (4);
line(200, 250, 600, 250);
//left
fill(111);
ellipse(200, 250, 60, 60);
//right
fill(255);
ellipse(600, 250, 60, 60);
fill(43, 82, 222);
ellipse(600, 250, 15, 15);
//body
strokeWeight(11);
strokeJoin(BEVEL);
fill(247, 167, 17);
rect(300, 300, 200, 200);
//legs
strokeWeight (4);
fill(127, 23, 185);
triangle(300, 690, 300, 500, 370, 500);
strokeWeight (30);
strokeCap(SQUARE);
line (485, 500, 485, 690);
strokeWeight(4);
fill (48, 240, 180);
rect(470, 670, 80, 20);

