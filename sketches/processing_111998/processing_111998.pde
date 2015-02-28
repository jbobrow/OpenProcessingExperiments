
float angle = 1.0;
float timer = 0.0;
float scalerec = 1;
float scaleam = 0.02;

void setup()
{
  background(0);
  size(500,500);
  colorMode(HSB, 360, 100, 100);  
}

void draw()
{
    background(0);
   timer += 0.0167;
    angle+= -.1; scalerec += scaleam;
    if (scalerec > 1.5)
    {
    scaleam = -.02;
    }
    if (scalerec < 1)
    {
    scaleam = .02;
    }
    
    if (timer > 2 && timer < 5)
    {
      
    rectMode(CENTER);
     pushMatrix();
     translate(250,250);
     rotate(angle);
  rect(0,0,100,100);
    popMatrix();
    }

  if (timer > 0 && timer < 4)
    {
      
    rectMode(CENTER);
     pushMatrix();
     translate(150,150);
     scale(scalerec);
  rect(0,0,100,100);
    popMatrix();
    
  }
  if (timer > 4)
  {
    drawEllipse();
  }
  

}
  
  
  
  float ellipseX = 0.0;
  void drawEllipse()
  {
    
 ellipseX += 1; 
  
 float waveSpeed = 10; 
 float waveHeight = 100; 
 float centerY = height/2;
  
 float angle = radians(ellipseX * waveSpeed); 
  
 float offset = sin(angle) * waveHeight; 
  
 float ellipseY = centerY + offset;
  
 ellipse(ellipseX, ellipseY, 100,100);

  }


