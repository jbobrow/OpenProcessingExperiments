
int rad = 10;
float speed = 25.0;
float slowness = 1.0;
float [] ellipseX = new float [5000];
float [] ellipseY = new float [5000];
int counter = 0;
int r;
int g;
int b;
float seed = 0.0;
float transparency = 255;

void setup()
{
  size (600, 600);
  noStroke();
  smooth();
  background(255);
  frameRate(10);
}

void draw()
{
  counter++;
    
  for(int i=0; i <= counter; i++)
  {
    if(mousePressed)
    {
      ellipseX[counter] = mouseX;
      ellipseY[counter] = mouseY; 
    }
    
    seed += .05;
    float n = noise(seed);
    
    if(keyPressed)
    {
      if(key == 'c' || key == 'C')
      {
       r = int(random(0, 255));
       g = int(random(0, 255));
       b = int(random(0, 255));
       fill(r, g, b, transparency);
      }

      if(key == 'r' || key == 'R')
      {
        r=255;
        g=0;
        b=0;
        fill(r, g, b, transparency);
      }
      if(key == 'g' || key == 'G')
      {
        r=0;
        g=255;
        b=0;
        fill(r, g, b, transparency);
      }
      if(key == 'b' || key == 'B')
      {
        r=0;
        g=0;
        b=255;
        fill(r, g, b, transparency);
      }
      if(key == 'y' || key == 'Y')
      {
        r=255;
        g=255;
        b=0;
        fill(r, g, b, transparency);
      }
      if(key == 'o' || key == 'O')
      {
        r=255;
        g=125;
        b=0;
        fill(r, g, b, transparency);
      }
      if(key == 'p' || key == 'P')
      {
        r=255;
        g=0;
        b=255;
        fill(r, g, b, transparency);
      }
      if(key == 'x' || key == 'X')
      fill(0);
      if(key == 'w' || key == 'W')
      fill(255);
      
      if(key == 't' || key == 'T')
      {
        transparency = 255;
        fill(r, g, b, transparency);
      }
      
      if(key == 'q' || key == 'Q')
      background(255);
    }

    ellipse(ellipseX[i], ellipseY[i], rad*n, rad*n);
    ellipseY[i]++;
    
  }
  transparency-=.5;
}



