
void setup(){
  size(500,500);
  background(0);
  smooth();}


void draw()
{
  noFill();
  
  //red rond
  
 /*noFill ();
 stroke(255);
  for (int posX = 25 ; posX < width ; posX = posX +50)
{
  for (int posY = 25 ; posY < height ; posY = posY +50)
  {
     ellipse(posX-25, posY-25, 100, 100);
  ellipse (posX,posY,50,50);}
  }
  
  //black rond
noFill ();
 stroke(255);
    for (int posX = 25 ; posX < width ; posX = posX +50)
{
  for (int posY = 25 ; posY < height ; posY = posY +50)
  {
  ellipse (posX,posY,25,25);}
  } */
  
  
  //blue rond
noFill ();
 stroke(255);
    for (int posX = 25 ; posX < width ; posX = posX +50)
{
  for (int posY = 25 ; posY < height ; posY = posY +50)
  {
  ellipse (posX,posY,5,50);}
  }
  
  // green 
  noFill ();
 stroke(255);
    for (int posX = 25 ; posX < width ; posX = posX +50)
{
  for (int posY = 25 ; posY < height ; posY = posY +50)
  {
  ellipse (posX,posY,50,5);}
  }
  
  
  // yellow
 noFill ();
 stroke(0);
    for (int posX = 25 ; posX < width ; posX = posX +50)
{
  for (int posY = 25 ; posY < height ; posY = posY +50)
  {
  ellipse (posX,posY,20,20);}
  strokeWeight(8); 
  } 
  
  noFill ();
 stroke(0);
    for (int posX = 25 ; posX < width ; posX = posX +50)
{
  for (int posY = 25 ; posY < height ; posY = posY +50)
  {
  ellipse (posX,posY,100,100);}
  }
  
  noLoop();

}



