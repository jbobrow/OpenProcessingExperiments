
float sinfreq = 25, cosfreq = 0;
float amp = 1;
void setup()
{
  size(400, 400);
  smooth(); 
}

float[] x1 = new float[400];
float[] dft1 = new float[400], dft2 = new float[400];
void dodft()
{
  float arg;
  float cosarg, sinarg;
  float[] x2 = new float[400];
  
  for(int i = 0; i < 400; i++)
  {
    x2[i] = 0;
    arg = ((float)2 * PI) * (i / (float)399);
    for(int k = 0; k < 400; k++)
    {
      cosarg = cos(k * arg);
      sinarg = sin(k * arg);
      x2[i] += (dft1[k] * cosarg - dft1[k] * sinarg);
    }
  }
  
  for(int i = 0; i < 400; i ++)
  {
    x1[i] = x2[i] / (float)399;   
  } 
}

int timer = 0;
float f = 12;
float t = 0; 
float tt = 1.59;
float ttt = 0;
void draw()
{
  background(0);
  drawx();
  
  t += f;
  for(int i = 0; i < 399; i++)
  {
   dft1[i] = dft1[i+1];    
  }
  dft1[399] = sin((6.28 * (t/400))) * 25;// + cos((6.28 * ((t/400)*.25))))*25;
  dodft();  
}

void keyPressed()
{
  println(keyCode);
if(keyCode == 38 && f < 24)
  f++;
if(keyCode == 40 && f > 0)
  f--;
}

void drawx()
{
  noStroke();
  fill(15, 15, 15);
  rect(0, 0, 400, 50);
  for(int i = 0; i < 400; i++)
  {
    stroke(255, 64, 64);
    line(i, 25, i, 25 + dft1[i]);    
  }
  for(int j = 0; j < 25; j++)
    {
      fill(255, 0, 0);
      noStroke();
      rect(j * 16, 400, 16, -(10 * abs(x1[j])));
    }
}

