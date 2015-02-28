
float k;
void setup()
{
  colorMode(HSB,255);
  size(500,500);noStroke();
}
void draw()
{
  fill(random(0,255),350,350,350);
  k=random(100);
  ellipse(random(800),random(600),k,k);
}

