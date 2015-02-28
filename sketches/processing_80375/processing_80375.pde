
void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
for (int posX = 0 ; posX < width ; posX = posX+10)
for(int posZ = 0; posZ < height; posZ = posZ+10)
{
 
stroke(180);
noFill();

ellipse(posX,posZ,22,22);
}
for (int posR = 20 ; posR < width ; posR = posR+60)
for(int posG = 20; posG < height; posG = posG+60)
{
  rect(posR,posG,40,40);


noLoop();
}
}






