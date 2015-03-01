
float x,y,r;
void setup()
{
  size(500,500);
  //x = random(width);
  //y = random(height);
  noiseDetail(1);
  
}

void draw()
{
background(255);
for(int x = 0; x <= width;x+=10)
{
  for(int y = 0; y <= height;y+=10)
  {
pushMatrix();
  float x2 = x+ noise(x*.00005,frameCount*.05+(y*.02))*40-20;
  float y2 = y+ noise(y*.00001,frameCount*.05-2455+ (x*.02))*40-20;
  translate(x2,y2);
  float dy = mouseY-y2;
  float dx = mouseX-x2;
  PVector d = new PVector(dx,dy);
  float l = (1-d.mag()/(width));
  strokeWeight(constrain(l*4,0,4));
  r = atan2(dy,dx);
  rotate(r);
  stroke(155-(l*155));
  line(0,0,l*50,0);
  
popMatrix();
  }
}
}
