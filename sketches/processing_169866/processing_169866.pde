
void setup()
{
 size(300, 600);
 background(0);

}
/* ------------------------------------------------------------------------- */

void draw()
{

float sand = map(second(), 0, 60, 0, 300);
float sandfarbe = map(minute(), 0, 60, 0, 255);

background(255);
fill(sandfarbe, 0, 255-sandfarbe);                                                //SANDFARBE
stroke(sandfarbe, 0, 255-sandfarbe);
rect(0, sand, width, (height/2)-sand);
triangle(0, height, width/2, height-sand, width, height);
line(width/2, height/2, width/2, height);


stroke(255);
fill(0);
triangle(0,0, width/2, height/2, 0, height);
triangle(width, 0, width/2, height/2, width, height);

}
