
void setup()
{
  size(500, 500);
  stroke(200);
  background(#d24b01);
}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 70)
  {
   
  for (int posY = 20; posY < height; posY = posY + 70)
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
