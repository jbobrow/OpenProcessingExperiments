
void setup()
{
size(500, 500);
background(0);
}


void draw()
{
size(900, 500);
noStroke();
smooth();
fill(255);
ellipse(250, 125, 100, 100);
ellipse(250, 205, 125, 115);
ellipse(250, 285, 145, 120);
fill(0);
ellipse(235,110, 10,10);
ellipse(265,110,10,10);

fill(229, 0, 0);
triangle(200, 95, 290, 85, 200, 120);

fill(229, 115, 15);
triangle(250,125, 245,135, 275,135); 
}
