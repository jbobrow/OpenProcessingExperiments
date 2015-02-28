
void setup()
{
  size(500, 500);
  stroke(200);
  background(#000000);
  strokeWeight(0.0);
  smooth();
}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 10)
  {
   
  for (int posY = 20; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 100, 150);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY,100, 250);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 100, 250);
    
  }}
 
 for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 100, 100);
    
  }}
 
 noLoop();
}
