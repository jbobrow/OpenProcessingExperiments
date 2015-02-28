
void setup()
{
  size(500, 500);
  stroke(200);
  background(#3c485e);
  strokeWeight(0.0);
  smooth();
}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 10)
  {
   
  for (int posY = 20; posY < height; posY = posY + 70)
  {
    ellipse(posX, posY, 1000, 9000);
  }}

for (int posX = 20; posX < width; posX = posX + 150)
  {
   
  for (int posY = 20; posY < height; posY = posY + 150)
  {
    ellipse(posX, posY,500, 500);
  }}

for (int posX = 20; posX < width; posX = posX + 15)
  {
   
  for (int posY = 20; posY < height; posY = posY + 15)
  {
    ellipse(posX, posY, 60, 60);
    
  }}
 
 for (int posX = 100; posX < width; posX = posX + 10)
  {
   
  for (int posY = 100; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 500, 250);
    
  }}
 
 noLoop();
}
