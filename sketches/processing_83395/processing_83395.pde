
void setup()
{ 
size (200,300);
background (0,0,0);
smooth ();
frameRate (10);
noStroke();
fill (10, 255, 75);
triangle (100,75, 25,275, 175,275);
textAlign (CENTER);
textSize (22);
text("Merry Christmas!", 100, 35);
}
void draw ()
{
 fill (143,85,25);
 rect(85,275,30,25);
 fill (42,110,24);
 triangle(100,75, 25,275, 175,275);
 fill (255, 0, 0);
 ellipse(125,175, 10,10);
 ellipse (65,250, 10,10);
 ellipse (160,265, 10,10);
 ellipse(60,200, 10,10);
 ellipse (83,135, 10,10);
 ellipse (125,220, 10,10);
 fill (0,255,0);
 ellipse (95, 190, 10,10);
 ellipse (115,260, 10,10);
 ellipse(115,145, 10,10);
 ellipse (100,100, 10,10);
 fill (255,255,0);
 triangle (100,85, 85,60, 115,60);
 triangle (100,50, 85,75, 115,75);
}
