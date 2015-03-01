
void setup()
{
  size(600,600);
  frameRate(10);
}

void draw()
{
  background(#2A0F5D);
  fill(255);
  for(float y=0; y< height; y+=90) {
    float lightX = random(0, width);
    float lightSz= random(height, 0);
    stroke(255);
    strokeWeight(5);
    line( width/2,0, lightSz, lightX);
    line( lightSz ,height/2, 0, lightX);
  }
}
