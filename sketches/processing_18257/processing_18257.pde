
void setup ()
{
size (250, 250);
smooth ();
}
int space = 25;
float influence = 50;
float minRadius = 10;
float maxRadius = 100;

void draw(float kontur, float _r, float _g, float _b, float _alpha) 
{
strokeWeight(kontur);
fill(_r, _g, _b, _alpha);
 
for(int x = 15; x < width; x += space)
{
for(int y = 15; y < height; y += space)
{
float radius = 1-(min(dist (x,y,mouseX,mouseY),influence)/influence);
radius = lerp (minRadius, maxRadius,radius);
ellipse (x,y,radius,radius);
}
}  
}
void draw ()
{
background (#B207F7);
draw(0, 255, 255, 255, 100);
}


