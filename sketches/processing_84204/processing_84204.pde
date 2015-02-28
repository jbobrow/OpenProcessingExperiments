
void setup()
{
  size(500,500);
   background(255);
  smooth();

  
  
  
  
}

void draw ()
{
  
   noStroke();
  fill(random(0,255),random(0,255),random(0,255));
  for (int posX=250; posX<width; posX=posX+10)
  {
  
   for (int posY=250; posY<height; posY=posY+10)
   {
  rotate(random(PI/360));
ellipse(posX, posY,1,1);

   }}
   
     for (int posX=-250; posX<width; posX=posX+10)
  {
  
   for (int posY=-250; posY<height; posY=posY+10)
   {
  rotate(random(PI/360));
ellipse(posX, posY,1,1);
   
   
   }}}
