
class Helicopter
{

  float heloYspd=0; //helo vertical speed
  PImage heloImage=loadImage("heloImage.jpg");
  Helicopter (float tempHeloX, float tempHeloY)
  {
    heloX=tempHeloX;
    heloY=tempHeloY; //sets starting altitude
  }
  void drawHelo() //makes helicopter at heloX & heloY
  {
    image(heloImage,heloX,heloY);
  }
  void moveHelo()
  {
    if(mousePressed) //mousepressed=climb, else=fall
    {
      heloYspd=-1*speed;
    }
    else
    {
      heloYspd=1*speed;
    }
    heloY+=heloYspd; //vertical speed affects altitude
  }
  void detectGroundCeilingCollision() //if helicopter hits top or bottom of screen, it's a crash
  {
    if(heloY<0 || heloY+65>height)
    {
      crash();
    }
  }
}

