
void setup()
{
  size(360,500);
}

void draw()
{
}

void keyPressed()
{
  
  if ( key == 'a')
  {
  
  int a = 4;
  int b = 5;
  
  int x,y;

  for(int i = 0; i < a; i++ )
  {
   for(int j = 0; j < b; j++)
   {
    x = 360/a*i*9/10;
    y = 500/b*j*9/10; 
    fill(random(255),random(255),random(255));
    ellipse(x + 36,y+36, random(72), random(72));
   }
  }
  }
  if ( key == 'b'){ save("Test");};
  if ( key == 'c'){ fill(0,0,0); rect(0,0,360,500);};
  
}
