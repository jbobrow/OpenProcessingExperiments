
PImage Cute1;
PImage Cute2;
boolean happyIn = true;
int randNum = 2;
 
void setup()
{
  size(400, 300);
  background(202,225,255);
  Cute1 = loadImage("TickledCute- OpenProcessing.png");
  Cute2 = loadImage("Cute2- OpenProcessing.png");
}
void draw()
{
  frameRate(5);
  if (happyIn == false)
  {
    background(202,225,255);
    image(Cute2, 50 + randNum, 20 + randNum, 300, 300);
  }
  else
  {
    background(202,225,255);
    image(Cute1, 50, 20, 299, 297);
    
  }
  randNum = randNum + int(random(-5,5));
}
 
void mousePressed()
{
  happyIn = !happyIn;
}



  


