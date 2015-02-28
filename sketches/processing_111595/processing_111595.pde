



void setup()
{
    size(800, 600);
    background(140);
    frameRate(6);
   
    
}

    int n = 50;
    int[] xs = new int[n];
    int[] ys = new int[n];
    
    
void draw()
{
    for(int x = 20; x < 800; x += 100)
    {
    for(int y = 20; y < 600; y += 100)
    {
      if(random(150) < 20)
      {
        int r = (int)random(256);
        int g = (int)random(256);
        int b = (int)random(256);
        fill(r,g,b);
        for(int i = 0; i < n-1; i++)
        {
          xs[i] = xs[i+1];
          ys[i] = ys[i+1];
        }
          xs[n-1] = mouseX;
          ys[n-1] = mouseY;
          
          for(int i = 0; i < n; i++)
          {
           arc(xs[i], ys[i], 20+2*i,2*i, 0, HALF_PI);
             arc(ys[i],xs[i], 10+2*i,2*i, PI, PI+QUARTER_PI);
          
             
          }
        }
      }
    }
  }



