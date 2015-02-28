
void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
for (int posX = 50 ; posX < width ; posX = posX+50)
for(int posZ = 50; posZ < height; posZ = posZ+50)
{
  fill(#100A5F);
  stroke(0);
  ellipse(posX,posZ,20,20);
stroke(180);
noFill();
ellipse(posX,posZ,100,100);
ellipse(posX,posZ,50,50);


noLoop();
}
}




