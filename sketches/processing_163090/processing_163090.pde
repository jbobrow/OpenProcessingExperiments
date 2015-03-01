
void setup()
{
  size(300,300);
  frameRate(50) ;
}

void draw()
{
 
    //translate(width, height);
  background(0);
  fill(255,247,0);
  stroke(255,247,0);
  strokeWeight(5);
  for (float y=0; y< height; y+=10){
  float snowX = random(0, width);
  float snowSz = random(10,15) ;
  line(snowX, y, snowSz, snowSz);
  }
  if(mousePressed)
  {
   background(0);
  fill(255,247,0);
  stroke(255,247,0);
  strokeWeight(5);
  for (float y=0; y< height; y+=10){
  float snowX = random(0, width);
  float snowSz = random(290,0) ;
  line(snowSz, snowSz, snowX, y);
  }
  }
}

