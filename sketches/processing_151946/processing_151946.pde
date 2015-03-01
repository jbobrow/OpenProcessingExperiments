
int num_hits = 150;
boolean leftypull = true;
void setup()
{
  size(500,500);
  background(0);
  noFill();
  stroke(255);
  ellipse(0,500,500,500);
  ellipse(0,500,700,700);
  
  stroke(255,0,0);
  line(0,250,250,250);
  line(250,250,250,500);
  for (int i = 0; i < num_hits; i++)
  {
    float r = random(0,1);
    r = pow(r, 2.7);
    int distance = int(r*200 + 250);
    float angle;
    if (leftypull)
    {
      angle = random(0,1.57/2);
    }
    else
    {
      angle = random(0,1.57);
    }
    //r*cos(theta) = x, r*sin(theta) = y
    float x = distance*cos(angle);
    float y = height-distance*sin(angle);
    
    //check to see if HR
    if (x <= 250 && y >= 250)
    {
      //not a HR
      fill(0,255,0);
      stroke(0,255,0);
    }
    else
    {
      fill(0,0,255);
      stroke(0,0,255);
    }      
    
    ellipse(x,y,5,5);
    
  }
}

void draw()
{
}

void mouseClicked()
{
  if (leftypull)
  {
    leftypull = false;
  }
  else
  {
    leftypull = true;
  }
  setup();
}
  
  
