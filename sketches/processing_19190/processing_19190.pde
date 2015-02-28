

int angle = 0;
void setup()

{ 
  
  size (320,240);
  background (0);
  smooth();

  
  }
  

void draw()
{
{
   for( int x = 2; x < 20; x++)
    fill (x * 255 /140,20,20);
    strokeWeight(2);
   
    ellipse(mouseX, mouseY, 20, 20);
   }
   
   {
   for( int y = 1; y < 10; y++)
    fill (y*255,0,0);
    stroke(2);
    rect(mouseX, mouseY, 30, 30);
   
   
   }
}

