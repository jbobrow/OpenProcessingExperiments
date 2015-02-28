
float t;
void setup()
{
  size(800, 800);
  colorMode(RGB, 255);
  smooth();
  t = 0.0;
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  color c;
  
  for (float a=0; a<PI; a+=PI/128)
  {
    float x = cos(a)*255;
    float y1 = sin(a)*255;
    float y2 = sin(-a)*255;
    
    beginShape();
    for (float y=y1; y>y2; y-=8)
    {
      c = color(noise(x/100)*128+64, noise(y/100)*64+32, noise(y/100)*64);
      fill(c, 12);
      stroke(c, 128);
      curveVertex(noise(t/1000+x/200, t/1000+y/200, t/1000)*x*1.5,y);
      t+=0.001;
    }
    endShape();
  }
}

