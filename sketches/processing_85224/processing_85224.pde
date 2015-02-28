
void setup()
{
  size(500, 500);
  stroke(200);
  background(#182165);
}



void draw()
{
  noFill();

for (int posX = 250; posX < width; posX = posX + 5)
  {
   
  for (int posY = 250; posY < height; posY = posY + 15)
  {
    ellipse(posX, posY, 20,20);
  }}

for (int posX = 125; posX < width; posX = posX + 10)
  {
   
  for (int posY = 125; posY < height; posY = posY + 25)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
 
 for (int posX = 100; posX < width; posX = posX + 30)
  {
   
  for (int posY = 100; posY < height; posY = posY + 10)
  {
    ellipse(posX, posY, 10, 10);
    
  }}
  
  for (int posX = 200; posX < width; posX = posX + 10)
  {
   
  for (int posY = 200; posY < height; posY = posY + 30)
  {
    ellipse(posX, posY, 25,25);
  }}

 for (int posX = 100; posX < width; posX = posX + 60)
  {
   
  for (int posY = 100; posY < height; posY = posY + 60)
  {
    ellipse(posX, posY, 20, 20);
    
  }}

noLoop();
}
