
float a = 0;
float inc = TWO_PI/(random(0,360))*(100);

float b = 0.0;
float g = 200; //radius

void setup()
{
size(1000, 500);
background(255);
}

void draw()
{
 
  
line(500, 250, (500+cos(a)*g), 250+sin(a)*g); /// middle


line(500, 200, (500+cos(a)*g), 250+sin(a)*g); /// upper
line(500, 300, (500+cos(a)*g), 250+sin(a)*g); /// downer

line(450, 250, (500+cos(a)*g), 250+sin(a)*g); /// right
line(550, 250, (500+cos(a)*g), 250+sin(a)*g); /// left

  a = a + inc;
}


void mousePressed()
{
background(255); ///reset
}
