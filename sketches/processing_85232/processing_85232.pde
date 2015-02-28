
void setup()
{
  size(500, 500);
  stroke(200);
  background(#cc2727);
  strokeWeight(0.5);
  smooth();
}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 10)
  {
   
  for (int posY = 45; posY < height; posY = posY + 20)
  {
    ellipse(posX, posY, 40, 40);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 5, 5);
  }}

for (int posX = 90; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 25)
  {
    ellipse(posX, posY, 25, 5);
    
  }}
 
 for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 15)
  {
    ellipse(posX, posY, 15, 15);
    
  }}
 
 noLoop();
}
