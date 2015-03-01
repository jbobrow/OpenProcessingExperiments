
void setup()
{
  rectMode(CENTER);
  size(400, 400);
  frameRate(60);
}

float radius = 0, theta = 0;
float scrX, scrY;

void draw()
{
    
  if(theta >= 100)
    theta=1;
    
  scrX = theta * cos(theta);
  scrY = theta * sin(theta);

  theta += 0.25;

  rect(scrX + width/2, scrY + height/2, 1, 1);   
  println("X: " + scrX + " Y: " + scrY);
}



