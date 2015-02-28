
int w = 800;
void setup()
{
  size(w, 800);
  loadPixels();
  color c;  
  for (int i = 0; i < pixels.length; i++) 
  {
    if  (prime(i+1))
    {
        if (prime(i+3) || prime(i-1))
        {
          c = color(255);
        }
        
    }
    else c = color(0);
    pixels[i] = c;
  }
  updatePixels(); 
}

boolean square(int n)
{
  int sq = int(sqrt(n));
  if (sq*sq == n)
  {
      return true;
  }
  else if ((sq+1)*(sq+1) == n)
  {
      return true;
  }
  return false;
}

boolean triangle(int n)
{
  if (square(8*n+1)) return true;
  else return false;
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
void keyPressed()
{
    if (key == 's')
    {
        
        size(w, 800);
        loadPixels();
        color c;  
        for (int i = 0; i < pixels.length; i++) 
        {
            if (square(i+1))  c = color(255);
            else c = color(0);
            pixels[i] = c;
        }
        updatePixels(); 
    }
    if (key == 't')
    {
        
        size(w, 800);
        loadPixels();
        color c;  
        for (int i = 0; i < pixels.length; i++) 
        {
            if (triangle(i+1))  c = color(255);
            else c = color(0);
            pixels[i] = c;
        }
        updatePixels(); 
    }
    if (key == 'p')
    {
        
        size(w, 800);
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
}

void mouseClicked()
{
    if (mouseButton == LEFT)
    {
        w++;
    }
    else
    {
        w--;
    }
    size(w, 800);
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
    
        
        
