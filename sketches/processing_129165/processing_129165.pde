
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  background(255);
  float Kreisex = map (mouseX, 0, 500, 0, 250);
  fill(255,0,0);
  noStroke();
  rect(225,225,50,50);
  fill(0);
  ellipse(45+Kreisex/1.2195122,250-Kreisex/5,50,50);
  ellipse(325-Kreisex/10,25+Kreisex/1.11111,50,50);
  ellipse(450-Kreisex/1.25,400-Kreisex/2.5,50,50);
  ellipse(30+Kreisex/1.47058824,460-Kreisex/1.19047619,50,50);
}
