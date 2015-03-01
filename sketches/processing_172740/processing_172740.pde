
float x = 0;
float y = 0;
float z = 0;
float c = 0;
float p = 0;
float o = 0;
float l = 0;
int count = 1;

void setup()
{
  size(700,700);
  background(255,255,255);
}

void draw()
{
  stroke(p,o,l);
  strokeWeight(2);
  while (count <2) 
  {
    for (int i = 0; i < 700; i = i+5) 
    {
      line(0, i, height, i);
      count +=1;
    }
  }
  fill(x,y,z);
  rect(mouseX,mouseY,50,50);
  
  if (keyPressed == true) 
  {
    x = random(255);
    y = random(255);
    z = random(255);
  }
  if (mouseButton == LEFT) 
  {
    count = 1;
    p = random(255);
    o = random(255);
    l = random(255);
  }
  if (mouseButton == RIGHT) 
  {
    count = 1;
    p = 0;
    o = 0;
    l = 0;
  } 
  triangle(something(mouseX),50,100,60,250,350);
}

float something(int ll)
{
  if (ll<350)
  {
    return ll;
  }
  else 
  {
    return random(350);
  }
}



    
  
 



