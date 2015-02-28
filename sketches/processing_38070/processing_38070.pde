

void setup()
{
size(500, 500);
background (255, 255, 255);
strokeWeight(1);
stroke(0,255,255);
smooth();
}

void draw()
{
 background(0);
 
 int rows = 25;
 
 for(int i=0; i<=rows; i++)
 {
   line(i*20, 0, mouseX, mouseY);
   line(i*20, 500, mouseX, mouseY);
 }
}

