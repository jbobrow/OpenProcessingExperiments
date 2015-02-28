
void setup()
{
  size(360, 500);
}

void draw()
{
}

void keyPressed()
{
  int a = int(random(6));
  if ( a < 1)
 {
   fill(255, 255, 255);
   rect(0,0,360,500);
 } 
  a = int(random(20));
  for ( int i = 0; i < 9; i ++)
  {
    for( int j = 0; j < 50; j ++)
    {
      fill( random(255), random(255), random(255));
      triangle( i * 20, j * 20, i * 20 + a, j * 20, i * 20 + a, j * 20 + a);
    }
  }
  a = int(random(20));
  for ( int i = 0; i < 9; i ++)
  {
    for( int j = 0; j < 50; j ++)
    {
      fill( random(255), random(255), random(255));
      rect( i * 20 + 180, j * 20, a, a);
    }
  }
  save("Test.jpg");
}
