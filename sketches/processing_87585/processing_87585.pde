
//tiki head
size (200, 200);
background(255);

//outline
line (50, 25, 150, 25);
line (50, 25, 40, 100);
line (150, 25, 160, 100);
line (40, 100, 50, 150);
line (160, 100, 150, 150);
line (50, 150, 150, 150);

//mouth
fill(100);
ellipse (100, 130, 100, 20);
fill(80);
ellipse (100, 130, 100, 15);

//nose
fill(180);
rect (90, 30, 20, 100);
fill(210);
triangle (70, 120, 90, 55, 90, 130);
triangle (110, 130, 110, 55, 130, 120);

//eyes
fill(80);
ellipse (70, 50, 40, 40);
ellipse (130, 50, 40, 40);
fill(60);
ellipse (70, 47, 40, 40);
ellipse (130, 47, 40, 40);

//brow
fill(180);
rect (50, 25, 100, 30);
fill(150);
triangle (45, 61, 50, 25, 95, 55);
triangle (105, 55, 150, 25, 155, 61);


