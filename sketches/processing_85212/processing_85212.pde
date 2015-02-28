
void setup()
{
  size(500, 500);
  stroke(200);
  background(#4f6095);
}



void draw()
{
  noFill();

for (int posX = 20; posX < width; posX = posX + 30)
  {
   
  for (int posY = 20; posY < height; posY = posY + 30)
  {
    ellipse(posX, posY, 5, 5);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
 
 for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 15, 15);
    
  }}


noLoop();
}
