
void setup()
{
  size(500, 500);
  stroke(150);
  background(#603f4d);
   strokeWeight(0.4);
  smooth();
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
    ellipse(posX, posY, 755, 455);
    
  }}
  
   for (int posX = 20; posX < width; posX = posX + 70)
  {
   
  for (int posY = 20; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 2200, 150);
    
  }}
 
 noLoop();
}
