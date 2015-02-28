
//moving ellipses
//shape and colour determined by position
//2010 allonestring

//pjs - july 2014

int shapeCount = 77;
int shapeSize = 20;
int shapeSpeed = 3;
int someAmount = 0;
float[]xspeed = new float[shapeCount];
float[]yspeed = new float[shapeCount];
float[]xpos = new float[shapeCount];
float[]ypos = new float[shapeCount];
float[]wd = new float[shapeCount];
float[]ht = new float[shapeCount];

void setup()
{
  size(600, 600);
  background(255);
  smooth();
  noStroke();
  
  for (int i = 0; i < shapeCount; i++)
  {
    xspeed[i] = random(-shapeSpeed, shapeSpeed);
    yspeed[i] = random(-shapeSpeed, shapeSpeed);
    
    wd[i] = random(1, shapeSize) + someAmount;
    ht[i] = wd[i];
    
    xpos[i] = width/2 + random(-width/4, width/4);
    ypos[i] = height/2 + random(-height/4, height/4);
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < shapeCount; i++)
  {
    float red = ypos[i] / height * 255;
    float green = xpos[i] / width * 255;
    float blue = ((width + height) - (xpos[i] + ypos[i])) / (width + height) * 255;
    float alpha = shapeCount;
    fill(red, green, blue, alpha);
    
    ellipse(xpos[i], ypos[i], width/4 - abs(width/2 - xpos[i]), height/4 - abs(height/2  - ypos[i]) );
    
    xpos[i] += xspeed[i];
    ypos[i] += yspeed[i];
    
    if(xpos[i] + wd[i]/2 >= width || xpos[i] <= wd[i]/2)
    {
      xspeed[i] *= -1;
    }  
    if(ypos[i] + ht[i]/2 >= height || ypos[i] <= ht[i]/2)
    {
      yspeed[i] *= -1;
    }  
  }
}  


