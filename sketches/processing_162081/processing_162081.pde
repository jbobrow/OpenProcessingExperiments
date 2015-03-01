
int red = 0;
void setup() 
{
size(250, 250);
background(0); //set background white
}
void draw() 
{
red++;
stroke(0, 0, 0);
fill(red, 0, 0);
rect(20, 20, 200, 200);
}
