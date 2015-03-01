
void setup()
{
  size(500,300);
}

void draw()
{
}

void keyPressed()
{
  fill(random(64),random(64),random(200)+64);
  rect(0,0,250,300);
  
  fill(random(200)+64,random(64),random(64));
  triangle(0,300, 125,0, 250,300);
  
  int a = int(random(200)+64);
  fill(a, a, random(64));
  rect(250,0,250,300);
  
  fill(random(200)+64,random(64),random(64));
  triangle(250,0, 375,300, 500,0);
  
  
  
}
