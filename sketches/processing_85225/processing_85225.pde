
void setup()
{
  size(500, 500);
  stroke(200);
  background(#02765f);
  strokeWeight(1);
  smooth();


}



void draw()
{
  noFill();

  for (int posX = 20; posX < width; posX = posX + 150)
  {
   
  for (int posY = 20; posY < height; posY = posY + 150)
  {
    ellipse(posX, posY, 40, 40);
  }}

for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 2, 2);
  }}

for (int posX = 20; posX < width; posX = posX + 100)
  {
   
  for (int posY = 60; posY < height; posY = posY + 100)
  {
    ellipse(posX, posY, 40, 40);
    
  }}
 
 for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 2, 2);
    
  }}
 
 for (int posX = 20; posX < width; posX = posX + 70)
  {
   
  for (int posY = 150; posY < height; posY = posY + 70)
  {
    ellipse(posX, posY, 2, 2);
  }}
  for (int posX = 1; posX < width; posX = posX + 70)
  {
   
  for (int posY = 1; posY < height; posY = posY + 70)
  {
    ellipse(posX, posY, 2, 2);
  }}
 noLoop();
}
