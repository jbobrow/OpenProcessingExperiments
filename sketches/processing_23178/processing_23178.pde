
void setup()
{
  
 size(500,500);
background(255);
smooth();

noStroke();

  
}

void draw()
{
 
  float a = random(0,450);
  float b= random(0,450);
  
  fill(255,243,0,60);
 ellipse(250,250,a,a);
 
 fill(255,60);
 ellipse(250,250,b,b);
 
 delay(100);
  
}

