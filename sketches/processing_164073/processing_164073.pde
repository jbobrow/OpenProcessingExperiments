
float angel = 1;
float s = 3;
float scaleSpeed = 0.02;
float t = 5;
float hue = 0.30;
float offset = 50;
 
 
void setup()
{  
  size(500, 500);
  background(0,0,0);  
}
   
void draw()
{
  t += 0.0167;
  frameRate(100);
    
  colorMode(HSB, 360, 100, 100);
  
  angel += 0.5;
  s += scaleSpeed;
   
  if (s > 5|| s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
    
  float degrees = radians(90);
  ellipseMode(CENTER);
     
     
   hue += offset;
  if (hue >= 255)
  {
     offset = -offset;
     hue = 255;
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0;
  }
  fill(hue, 100, 100);
   
  
  if (t > 25 && t < 50)
  
  {
    fill (hue, 200, 200);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angel);
    scale(s);
    rect(0, 0, 100, 100);
    popMatrix();
  }
    
    
   if (t > 0 && t < 25)
   {
     angel -= 0.4;
    fill (hue, 100, 100);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angel);
    scale(s);
    rect(0, 0, 100, 100);
    popMatrix();
   }   
    
    
     if (t > 50 && t >=18)
  {
    angel += 3;
    fill (hue, 100, 100);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angel);
    scale(s);
    rect(0, 0, 100, 100);
    popMatrix();
  }  
}

