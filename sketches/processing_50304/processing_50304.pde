
//constantly draws circles with purple fill
//uses for loop to tell when to draw ellipses in a square area
float x = 0.0;
float y = 0.0;
float easing = 0.05;

void setup()
{
  size(600,600);
  background(255);
  smooth();
}
void draw()
{
 
  
  float targetX = mouseX;
  float targetY = mouseY;
  
  //float whatsLeft = targetX - x;
  
  
 x += (targetX - x) * easing;
 y += (targetY- y) * easing;
  noStroke();
  fill(100,10,50, 4); 
  ellipse(x, y, 100,100);
  
  for(int z=250; z<(mouseX+10); z++)
  {
    for(int w=250; w<(mouseY+10); w++)
    {
      ellipse(z,w, 1,1);
    }
  }
  
}

