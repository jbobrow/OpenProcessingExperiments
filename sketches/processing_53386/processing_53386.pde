
//computer arts for processing 60-257
//hw #8 the while loop
//copyright kyree 2012

int s;

void setup()
{
  size (400,400);
  background (151, 100);
  smooth();
  
  s = 1;
  strokeWeight(s);
}

void draw ()
{
  stroke(random(255), random(255), random(255));
}

void mouseDragged()
{
  int y =0;
  while (y < height)
  { 
  line(mouseX,mouseY,y, height);
  y = y + 250;
  }
}
 
void keyPressed()
{
  if (key == ' ')
  {
  background ( random(255),random(255),random(255));
  }
  
  if (key == 'c')
  {
  strokeWeight(s +1);
   }

   if (key == 'm')
   {
  strokeWeight(s + 5);
   }

   if (key == 'u')
   {
   strokeWeight(s + 10);
   }  
 }
