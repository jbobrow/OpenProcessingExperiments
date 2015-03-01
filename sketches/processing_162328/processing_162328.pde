
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
void setup() 
{
size(500, 500);
background(255);
}
void draw() 
{ 
if (mousePressed == true)
{
fill(0);
} 
else 
{
fill(255,100,255);
}
background(255);
triangle(mouseX, mouseY,60, 75, 58, 20, 86, 75);
if (mousePressed && (mouseButton == LEFT))
{
fill(219,200,255);
ellipse(mouseX, mouseY, 50, 50);
} 
}
