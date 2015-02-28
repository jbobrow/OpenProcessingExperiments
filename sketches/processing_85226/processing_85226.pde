
void setup()
{
  size(500, 500);
  stroke(200);
  background(#000000);
  strokeWeight(0.3);
  smooth();
}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 10)
  {
   
  for (int posY = 20; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 1000, 1000);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY,500, 500);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 60, 60);
    
  }}
 
 for (int posX = 100; posX < width; posX = posX + 10)
  {
   
  for (int posY = 100; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 60, 60);
    
  }}
 
 noLoop();
}
