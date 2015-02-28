
int angle = 0;

void setup() {
  size(1000, 1000);
  background(255);
  noStroke();
  fill(0, 102);
}

void draw() 
{
  
      float circleCenterX = 320 + sin(frameCount) * frameCount;
      float circleCenterY = 320 + cos(frameCount) * frameCount;
      
      float circleSize = random(frameCount/15, frameCount/10);
      
      float r = random(127);
      float g = random(127);
      float b = random(127);
      
  // Draw only when mouse is pressed
  for (int angle = 0; angle <= 90; angle += 1) 
  {
    float val = cos(radians(angle)) * circleSize;
      
    for (int a = 0; a < 360; a += 72) 
    {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(r  + sin(radians(angle)) * 127, g + sin(radians(angle)) * 127 , b + sin(radians(angle)) * 127, random(255));
      
      ellipse(circleCenterX + xoff, circleCenterY + yoff, val, val);  
      
          if(angle == 90)
    {
          fill(255 - r, 255 -g, 255 - b);
          ellipse(circleCenterX + cos(radians(a)) * circleSize/2, circleCenterY + sin(radians(a)) * circleSize/2, circleSize/6, circleSize/6);
    }
    }
    

  }
    
}

void mousePressed()
{
  saveFrame("output.png");
}


