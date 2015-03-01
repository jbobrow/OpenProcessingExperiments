
void setup()
{
  size(500,500);
  background(#25F5E5);
}

void draw()
{
  rect(randomStuff(mouseX), mouseY, mouseX/5, mouseY/5);
  fill(random(255),random(255),random(255));
  
}

float randomStuff(int n)
{
  if (n>99)
  {
    return n;
  }
  else 
  {
    return random(500);
  }
}


void sampleMethod(int n)
{
  fill(#25F5E5);
  rect(n,n,5,n);
}

void keyPressed()
{
  background(random(255),random(255),random(255));

}
