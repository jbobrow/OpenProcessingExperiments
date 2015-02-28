
void setup() 
{  //setup function called initially, only once
  size(250, 250);
  loadPixels();
  for (int i = 0; i < pixels.length; i++)
  {
     float rand = random(255);
     color c = color(rand);
     pixels[i] = c;
  }
 updatePixels();
 stroke(255,128,0);
}

void draw()
{
      
      line (0,0,mouseX, mouseY);
   
}
