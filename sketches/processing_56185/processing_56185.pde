
int x = 150;
int y= 300;
size(400, 600);
smooth();
background(220, 150, 78);

//
stroke(78, 135, 99, 150);
strokeWeight(3);
line(x, y-100, x, y-230);
line(x-2, y-100, x-2, y-230);
line(x+2, y-100, x+2, y-230);
line(x+4, y-100, x+4, y-230);
line(x-4, y-100, x-4, y-230);

//body

fill(187, 73, 180);
rectMode(CENTER);
rect(x, y, 10, 300);
rect(x, y, 100, 10);
ellipse(x, y-150, 50*1.5, 50);

//face

fill(0);
ellipse(x-15, y-150, 8*3, 8*3.5);
ellipse(x+10, y-150, 8, 8);
fill(255, 0, 0);
line(x-5, y-140, x+5, y-140);

//skirt


strokeWeight(5);
stroke(150, 0, 0, 60);
strokeJoin(ROUND);
fill(220, 172, 181);
triangle(x, y-5, x+100, y+200, x-100, y+200);
fill(200, 172, 220);
rect(x, y+200, 200, 20);
rect(x-20, y+ 133, 40, 17);
rect(x+29, y+ 163, 3, 10);

