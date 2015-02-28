
PFont f;
int num = 2000;
int range = 10;

float [] ax = new float [num];
float [] ay = new float [num];

void setup()
{
  size (800, 600);
  f = createFont ("Verdana Bold", 16, true);
  for (int i = 0; i < num; i++)
  {
    ax[i] = width/2;
    ay[i] = height/2;
  }
}

void draw ()
{
  background (75);
  for (int i =1; i < num; i++)
  {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }
  
  ax[num-1] += random (-range, range);
  ay[num-1] += random (-range, range);
  
  ax[num-10] = constrain (ax[num-1], 0, width);
  ay[num-10] = constrain (ay[num-1], 00, height);
  
  for (int i =1; i < num; i++)
  {
    float val = float(i)/num * 204.0 + 51;
    stroke (val);
    line (ax[i-1], ay[i-1], ax[i], ay[i]);
    
  }
  
  textFont (f, 16);
  textAlign (LEFT);
  fill (100);
  text ("created with Processing and Processing.js", 20, 20);
  textFont (f, 64);
  textAlign (RIGHT);
  fill (100);
  text ("Kenny Rose Design", 790, 550);
    textFont (f, 24);
  textAlign (RIGHT);
  fill (100);
  text ("PURE DIGITAL ANARCHY", 790, 590);
}


