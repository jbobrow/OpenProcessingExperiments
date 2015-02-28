
size(400,400);
background(124,205,124);
stroke(255);
strokeWeight(30);
strokeCap(SQUARE);
for (int x = 80; x < 350; x=x+60)
{
line(x,140,x,300);
}
strokeWeight(20);
line(60,170,340,170);
line(60,270,340,270);
noStroke();
fill(255);
for (int y = 80; y < 340; y=y+60)
{
triangle(y-15,140,y+15,140,y,120);
}




