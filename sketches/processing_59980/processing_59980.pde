
float t;
void setup()
{
  size(800, 800);
  colorMode(RGB, 255);
  background(224);
  smooth();
  t = 0.0;
}

void draw()
{
  noStroke();
  fill(224, 4);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  
  for (float a=0; a<PI; a+=PI/128)
  {
    float x = cos(a)*320;
    float y1 = sin(a)*320;
    float y2 = sin(-a)*320;
    
    beginShape();
    for (float y=y1; y>y2; y-=16)
    {
      fill(224, 12);
      stroke(0, 64);
      strokeWeight(0.5);
      vertex(noise(t/1000+x/200, t/1000+y/200, t/1000)*x*1.5,y);
      t+=0.001;
    }
    endShape();
  }
}

