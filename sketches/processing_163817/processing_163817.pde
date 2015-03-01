
float delta = 5;
float r = 200;
float r2 = 150;

void setup()
{
  size(700,700,P3D);
}

void draw()
{
  background(47,70,102);
  {
 
  float clr1 = random(100,250); 
  fill(255,255,255,100);
  noStroke();

  for(int y=0; y<height; y+=10){  
    float snowX = random(width);
    float snowSz = random(5,15);
    ellipse(snowX,y,snowSz,snowSz);     
  }
  
}
  
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  
  stroke(255,255,255);
    for (float deg = 0; deg < 360; deg += delta)
    {
      float theta = radians(deg);
    
      {
        for(float deg2 = 0; deg2<360; deg2 += delta)
        {
         float phi = radians(deg2);
          { 
          float x = r * sin(phi) * cos(theta);
          
          float y = r * sin(phi) * sin(theta);
          float z = r * cos(phi);
          point(x,y,z);
          }
        }
      }
    }

translate(width/4, height/4, 0);
  rotateX(radians(mouseY));
  
 
    for (float deg = 0; deg < 360; deg += delta)
    {
      float theta = radians(deg);
    
      {
        for(float deg2 = 0; deg2<360; deg2 += delta)
        {
         float phi = radians(deg2);
          { 
          float x = r2 * sin(phi) * cos(theta);
          
          float y = r2 * sin(phi) * sin(theta);
          float z = r2 * cos(phi);
          point(x,y,z);
          }
        }
      }
    }

}
