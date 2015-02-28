
void setup()
{
  size(500, 500);
  stroke(200);
  background(#575f85);
    strokeWeight(0.5);
  smooth();
}



void draw()
{
  noFill();



for (int posX = 40; posX < width; posX = posX + 35)
  {
   
  for (int posY = 05; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
 
 for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 10; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 25, 25);
    
  }}
  
   for (int posX = 20; posX < width; posX = posX + 35)
  {
   
  for (int posY = 10; posY < height; posY = posY + 35)
  {
    ellipse(posX, posY, 35, 35);
    
  }}
 
 for (int posX = 40; posX < width; posX = posX + 10)
  {
   
  for (int posY = 05; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
  
   for (int posX = 80; posX < width; posX = posX + 10)
  {
   
  for (int posY = 80; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
 
   for (int posX = 300; posX < width; posX = posX + 6)
  {
   
  for (int posY = 130; posY < height; posY = posY + 5)
  {
    ellipse(posX, posY, 30, 30);
    
  }}
 
 
    


noLoop();
}
