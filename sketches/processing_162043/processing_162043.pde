
void setup() 
{
size(800, 800);
background(255); //set background white
colorMode(RGB); //set colors to Hue, Saturation, Brightness mode
}

void draw()
{
fill(random(255));
rect(75, 75, 100, 100);

fill(255,0,0);
rect(100, 100, 50, 50);

fill(0,255,0);
ellipse(40,20,16,16);

fill(0,0,255);
triangle(30, 75, 58, 20, 86, 75);
}
