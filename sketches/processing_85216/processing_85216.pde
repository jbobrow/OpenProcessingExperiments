
void setup()
{
  size(500, 500);
  stroke(200);
  background(#255652);
    strokeWeight(1.5);
  smooth();
}



void draw()
{
  noFill();

for (int posX = 90; posX < width; posX = posX + 50)
  {
   
  for (int posY = 90; posY < height; posY = posY + 50)
  {
    ellipse(posX, posY, 20, 20);
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
    ellipse(posX, posY, 25, 25);
    
  }}
  
   for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 20; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 35, 35);
    
  }}
 
 
 
    


noLoop();
}
