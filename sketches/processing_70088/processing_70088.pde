
int spaceX = 25;


void setup()
{
size(500, 500);
stroke(100, 100, 255);
smooth();
}


void draw()
{
background(0); 
for (int i=0; i<21; i++)
  {
      line(i*spaceX, 0, mouseX, mouseY); 
      line(i*spaceX, 500, mouseX, mouseY);
     
}

}
