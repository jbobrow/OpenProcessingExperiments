
int xAxis = 0;
int yAxis = 0;
void setup ()
{
size(250, 250); 
background(255)
}
void draw()
{
rect (xAxis, yAxis, 25, 25);
}
void keyPressed()
{
if (key == CODED)
{
if (keyCode == left)
{
xAxis = 1;

