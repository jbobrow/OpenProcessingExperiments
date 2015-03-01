
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
}
