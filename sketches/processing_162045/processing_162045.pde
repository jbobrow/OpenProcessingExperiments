
void setup() 
{
size(250, 250);
background(255); //set background white
colorMode(RGB); //set colors to Hue, Saturation, Brightness mode
}
void draw()
{
stroke(0);
fill(255, 255, 0);
rect(100, 100, 100, 100);

fill(255, 0, 255);
ellipse(150, 150, 40, 40)

fill(0, 255, 255);
triangle(30, 75, 58, 20, 86, 75);
}
