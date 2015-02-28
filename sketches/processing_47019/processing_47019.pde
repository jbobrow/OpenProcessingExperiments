
float n;
float y, yt;

void setup()
{
  size(800, 800);
  colorMode(RGB, 255);
  background(255);
  smooth();
  
  n = random(255);
  yt = -200;
}

void draw()
{
  stroke(noise(n)*255, noise(yt, n)*255, noise(yt, n)*255, 32);
  noFill();
  beginShape();
  for (int x=-32; x<width+64; x+=8)
  {
    y=yt+noise(x/1000f, n)*256;
    curveVertex(x, y);
    n+=0.00004;
  }
  endShape();
  yt++;
  if (yt==height+200) 
  {
    yt=-200;
    stroke(255, 192);
    fill(255, 192);
    rect(0, 0, width, height);
  }
}

