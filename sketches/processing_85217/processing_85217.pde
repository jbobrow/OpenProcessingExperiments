
void setup()
{
  size(500, 500);
  stroke(200);
  background(#007162);
}



void draw()
{
  noFill();

for (int posX = 250; posX < width; posX = posX + 5)
  {
   
  for (int posY = 250; posY < height; posY = posY + 5)
  {
    ellipse(posX, posY, 5, 5);
  }}

for (int posX = 125; posX < width; posX = posX + 10)
  {
   
  for (int posY = 125; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
 
 for (int posX = 100; posX < width; posX = posX + 10)
  {
   
  for (int posY = 100; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 10, 10);
    
  }}



noLoop();
}
