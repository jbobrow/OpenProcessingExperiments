
float hue = 0;
float s = 0;
float timer = 0;
float angleOffset = 0.1;
float angleDown = 0;
float tx = 0;
float angle = 1;
void setup()
{
  size(500,500);
  colorMode(HSB,360,100,100);
  background(51);
}


void draw()
{
 
  timer = timer + 0.0167;
  hue = hue+ 1;
  
  if (hue >= 360)
  {
    hue = 0;
  }

  //println(timer);
  angle += angleOffset;
        
  if (angle >= 0 && timer < 3)
  {  
      tx += 1;
      float ty = height/2 + (sin(radians(tx * 2)) * 50);
      pushMatrix();
      fill(100, 100, 100);
      translate(tx, 100);
      scale(angle);
      triangle(-50,50,50,50,0, 0);
      popMatrix(); 
  }
 
  if (angle >= 2)
  {
    angleOffset = -0.1;
    
  }
  if (angle <= 0.5)
  {
    angleOffset = 0.1;
  }
  

  if (timer > 3)
  {
    fill(hue,100,100);
  if (hue >= 360)
  {
    hue = 0;
  }
  
  for (int i = 0; i < width; i = i + 1)
  {
    float percent = i / (float)width;
    stroke(i,100,100);
    line(i,0,i,height);
  }
  size += 0.02;
  pushMatrix();
  translate(width/2, height/2);
  scale(angle);
  ellipse(0,0,100,100);
  popMatrix();  
  }
  
  if (timer > 9.9)
  {
    
    timer = 0;
    background(51);
    
  }


  
  fill(hue,100,100);

  

}


