
void setup()
{
  size(800, 800);
  loadPixels();
  color c; 
  for (int i = 0; i < pixels.length; i++)
  {
    if (prime(i+1))  c = color(255);
    else c = color(0);
    pixels[i] = c;
  }
  updatePixels();
}
 
boolean prime(int n)
{
  if (n <= 1)  return false;
  else
  {
    if (n == 2 || n == 3)
    {
      return true;
    }
    if (n % 6 != 1 && n % 6 != 5)
    {
      return false;
    }
    for (int i = 1; 6*i+1 <= int(sqrt(n))+1; i++)
    {
      if (n % (6*i-1) == 0)  return false;
      if (n % (6*i-1) == 0)  return false;
    }
    return true;
  }
}
void draw()
{
}
