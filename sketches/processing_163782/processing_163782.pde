
void setup()
{
  size(700,500);
  frameRate(7);
}

void draw()
{
  background(random(130,132),random(140,145),random(130,134));
  for (float y=0; y< height; y+=15) {
    float rain = random(0,width);
    float lng = random(10,30);
    line(rain, y, rain+2, y+lng);
      stroke(random(180,255));
      strokeWeight(random(.5,1.3));
      strokeCap(ROUND);
      smooth();

  }
}
  
