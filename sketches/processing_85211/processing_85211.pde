
void setup()
{
  size(500, 500);
  stroke(200);
  background(#303b5f);
  strokeWeight(0.5);
  smooth();
}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 10)
  {
   
  for (int posY = 20; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 40, 40);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
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
