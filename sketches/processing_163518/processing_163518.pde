
int xAxis = 350;
int yAxis = 350;
void setup() 
{ 
size(700, 700); //Size of canvas
background(255); //set background white
}
void draw() 
{ 
rect(xAxis, yAxis, 50, 50);
}
void keyPressed()
{
if (key == CODED)
{
if (keyCode == LEFT)
{
xAxis -= 10;
fill(225,7,127);
}
else if (keyCode == RIGHT)
{
xAxis += 10;
fill(253,185,58);
}
else if (keyCode == UP)
{
yAxis -= 10;
fill(10,174,255);
}
else if (keyCode == DOWN)
{
yAxis += 10;
fill(173,255,23);
}
}

else
{
yAxis = 0;
xAxis = 0;
}

}
