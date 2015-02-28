
float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100); 
  frameRate(30);
  
  background(0, 0, 0);
  
  center = width / 2.0;
  prevX = center;
  prevY = center;
}

void draw()
{
   if (timer > 10)
   {
     timer = 0.0;
     radius = 0.0;
     thickness = thickness + 2;
   }
  
  // Set the x and y position to equation of a circle.
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
    
    if (timer == 0.0)
    {
      prevX = x;
      prevY = y;
    }
    
    // Draw line from previous position to current using thickness.
    // Use the timer to cycle the color from 0->360.
    // Alpha of 25% creates the "dotted" effect on the lines from the overlap of prev and x.
    strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 255);
    line(prevX, prevY, x, y);
     
    // Set the previous x and y to the current for next time. 
    prevX = x;
    prevY = y;
    
    timer = timer + (1.0 / 30.0);
    radius = radius + 1;
}
  

