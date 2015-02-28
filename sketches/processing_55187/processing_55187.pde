
size(400, 600);
smooth();

//
line(200, 10, 200, 30);
line(198, 10, 198, 30);
line(202, 10, 202, 30);
line(204, 10, 204, 30);
line(196, 10, 196, 30);

//body

fill(187, 73, 180);
rectMode(CENTER);
rect(200, 200, 10, 300);
rect(200, 150, 100, 10);
ellipse(200, 50, 50, 50);

//face

fill(0);
ellipse(190, 50, 8, 8);
ellipse(210, 50, 8, 8);
fill(255, 0, 0);
line(195, 60, 205, 60);

//skirt


strokeWeight(5);
strokeJoin(ROUND);
fill(220, 172, 181);
triangle(200, 155, 270, 300, 130, 300);
fill(215, 169, 200);
rect(200, 300, 140, 15);
rect(180, 263, 20, 10);
rect(220, 263, 20, 10);

