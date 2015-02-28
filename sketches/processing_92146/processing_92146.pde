
/*
Julia set.
Move the mouse over the image to change the Julia parameters.
left click   zoom in
right click  zoom out.
middle click show the Mandelbrot set (the parameter space)
 
Fredrik Jansson, Johanna Grönqvist 2013
itsacleanmachine.blogspot.com
*/

int Lx = 550;
int Ly = 550;

double xc = -0.0, yc = 0; //center
double S = 2.5;           //scale

float p_min = -.2;
float p_max =  .1;
float q_min =  .7;
float q_max = 1.00;
  
void setup() 
{
  size(550, 550);
  background(0);
  frameRate(10);
  colorMode (HSB, 255);
}

int pX = -1, pY = -1; //previous mouse position
int start = 1;

void mousePressed() 
{
  if (mouseButton == LEFT)
    S*=.8;
  else if (mousePressed && (mouseButton == RIGHT)) 
    if (S < 2.5)
      S/= .8;
}    

int mandel=0;
void draw()
{
  if (mousePressed && (mouseButton == CENTER))
    {
      if (mandel == 0)
        drawMandel();
      mandel=1;
      return;
    }
  
  if (mouseX == pX && mouseY == pY && mandel == 0)
    return; //no change since last frame
  pX = mouseX;
  pY = mouseY;
  mandel = 0;

  float p = map (mouseX, 0, Lx, p_min, p_max);
  float q = map (mouseY, 0, Ly, q_min, q_max);

  if (start == 1)
  {
    start = 0;
    p = -0.08989;
    q =  0.87356;
  }

  //print (p + " " + q + " " + mouseX + " " + mouseY + "\n");
  drawJulia(p, q, S, xc, yc);
}



void drawJulia (double p, double q, double S, double xc, double yc)
{
  int M = 90; //max iterations
  int L = 4;
  int L2 = 15;
  int L3 = 18;

  float lM = log(M);
  float lL3= log(L3);

  for (int y = 0; y < Ly; y++)
    for (int x = 0; x < Lx; x++)
    {
      double X = S*((double)x / Lx -.5) + xc;
      double Y = S*((double)y / Ly -.5) + yc;
      //set (x, y, color(mandel(X,Y)));
      int i = julia(X, Y, p, q, M);
      //float a = .3;
      //int c = color (100*log(i+2.8)/pow(i+2.8,a)); //too slow!
      //int c = color (50*log(i+3));
      int c;
      float cc;
      if (i < L) //outside
        cc = map (i, 0, L, 100, 130);  
      else if (i < L2) //middle
        cc = map (i, L, L2, 130, 255);
      else if (i < L3)
        cc = 255;
      else //inside
      cc = map (log(i), lL3, lM, 255, 0);

      c = color((30.0+cc/3)/360*255, 90.0/255*(255-cc), cc);  //cc=255 is white
      set (x, y, c);
    }
}

void drawMandel ()
{
  for (int y = 0; y < Ly; y++)
    for (int x = 0; x < Lx; x++)
    {
      float p = map (x, 0, Lx, p_min, p_max);
      float q = map (y, 0, Ly, q_min, q_max);
      int M = 200;
      int i = julia(0, 0, p, q, M);
      set (x, y, color(i));
  }
}

int julia (double x, double y, double p, double q, int M)
{
  //int M = 100; //max iterations
  double a = x, b = y;
  double a2, b2;
  // z = a + bi   c = p + qi
  int iter = 0;
  do {
    a2 = a*a - b*b; //z' = z*z + c
    b2 = 2*a*b;
    a = a2 + p; 
    b = b2 + q;
    iter++;
    if (iter > M)
      return M;
  } 
  while (a*a+b*b < 4);
  return iter;
}
