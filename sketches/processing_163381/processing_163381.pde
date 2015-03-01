
int xAxis = 50;
int yAxis = 50;
void setup() 
{ 
size(250, 250); //Size of canvas
background(255); //set background white
}
void draw() 
{ 
rect(xAxis, yAxis, 25, 25);
}
void keyPressed()
{
if (key == CODED)
{
if (keyCode == LEFT)
{
xAxis -= 1;
fill(225,7,127);
}
else if (keyCode == RIGHT)
{
xAxis += 1;
fill(253,185,58);
}
else if (keyCode == UP)
{
yAxis -= 1;
fill(10,174,255);
}
else if (keyCode == DOWN)
{
yAxis += 1;
fill(173,255,23);
}
}

else
{
yAxis = 0;
xAxis = 0;
}
