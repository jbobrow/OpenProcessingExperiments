
size(500,500);

background(255, 120, 0);

smooth();

fill(252, 252, 38);
ellipse(450, 250, 175, 175);
fill(194, 250, 247);
quad(-1, 250, 501, 250, 501, 501, -1, 501);

int x = 250;
int y = 300;


strokeWeight(2);

fill(255, 188, 0);
triangle(x+10, y+105, x+70, y+130, x+20, y+130);
triangle(x-10, y+105, x-70, y+130, x-20, y+130);



fill(75);
ellipse(x, y, 150, 250);
fill(255);
ellipse(x, y, 100, 166);
fill(75);
ellipse(x, y-165, 100, 100);


fill(75);
ellipse(x-55, y+10, 45, 200);
ellipse(x+55, y+10, 45, 200);


fill(255);
ellipse(x-20, y-175, 25, 20);
ellipse(x+20, y-175, 25, 20);
fill(0);
ellipse(x-20, y-175, 10, 10);
ellipse(x+20, y-175, 10, 10);

fill(255, 188, 0);
quad(x, y-165, x-20, y-147, x, y-130, x+20, y-147);
line(x-20, y-147, x, y-140);
line(x+20, y-147, x, y-140);


