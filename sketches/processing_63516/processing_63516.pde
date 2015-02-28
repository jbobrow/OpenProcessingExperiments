
void setup()
{
  colorMode(HSB,250,250,250);
  size(250,250);
  strokeWeight(3);
  frameRate(90);
  line(120,20,130,20);
}



void draw()
{
 
  line(125,20,random(250),250);
  stroke(500/3,random(0,250),random(100,255));
}

