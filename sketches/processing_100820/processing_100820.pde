
void setup()
{
  size(600, 600);
  colorMode(HSB);
  noStroke();
  rectMode(CENTER);
}

float xn, xs, yn, zn, ns;

void draw()
{
  background(0, 255, 127);
  noiseSeed((long)ns);
  xn=noise(ns);
  yn=noise(ns);
  xs=xn;
  for (int i = 0; i <= width/5; i++)
  {
    xn = xs;
    yn+=.02;
    zn+=.02/20;
    for (int j = 0; j <= width/5; j++)
    {
      xn+=.02;
      fill(noise(xn, yn, zn)*10, 255, noise(xn, yn, zn)*350);
      rect(i*5, j*5, 6, 6);
    }
  }
  for (int i = 0; i <= height; i++) {
    stroke(0, 255-i*255/height);
    line(0, i, width, i);
    noStroke();
  }
}


