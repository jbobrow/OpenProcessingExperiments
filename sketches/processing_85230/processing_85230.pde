
void setup()
{
  size(500, 500);
  stroke(200);
  background(#7a0f3c);
}



void draw()
{
  noFill();

  for (int posX = 10; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 10, 10);
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
 
 for (int posX = 20; posX < width; posX = posX + 60)
  {
   
  for (int posY = 20; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 155, 55);
    
  }}
  
   for (int posX = 20; posX < width; posX = posX + 70)
  {
   
  for (int posY = 20; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 2200, 150);
    
  }}
 
 noLoop();
}
