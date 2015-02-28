
// -----------------
// Bridget Riley 
// Composition 1
// -----------------
int   n_gaps   = 16;
int   ray      = 16;
int   range    = 200; 
int   side     = 120;
float diagonal = side*sqrt(2); 
float gap      = diagonal/n_gaps; 

// -----------------
float fun(int i)
{
  return -abs(2*i-n_gaps) + n_gaps;
}

// -----------------
void setup()
{
  size(500,500);
  background(230);
  noStroke();
  cursor(CROSS);
}

// -----------------
void draw()
{
  background(230);

  float x = 0;
  float y = 0;
  float f = 0;
  float distance = 0;
  float gray = 0;

  translate(width/2,height/2-diagonal);
  // fill(255,0,0);
  // ellipse(0,0,30,30);
  fill(0);
  
  pushMatrix();
  for (int i=0; i<=n_gaps; i++)
  {
    f = fun(i);
    for (int j=0; j<=f/2; j++)
    { 
      x = -f*gap+4*j*gap;
      y =  2*i*gap;
      ray = 30*mouseY/height;
      distance = abs(mouseX-(x+width/2));
      gray = map(distance, 0, range, 230, 100);
      if (distance > 0 && distance < range)
      { 
        fill (gray);
      }
      else
      { 
        fill (100);
      }
      ellipse(x, y, ray, ray);
    }
  }
  popMatrix();
}
