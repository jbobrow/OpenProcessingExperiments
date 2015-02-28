
int p = 100;
int f = 1;
int circle = 0;
void setup()
{
  smooth();
  size(500, 500);
  background(0);
  strokeWeight(4);
  fill(255);
  stroke(#FF0000);
  
for (int x = 100; x < 500; x += p)
{
for(int y = 100; y < 500; y += p)
{
for (int rep = 0; rep < 5; rep += 1)
{
for (int z = 80; z > 0; z -= 17)
  ellipse(x, y, z, z);  
}
}
}
}






