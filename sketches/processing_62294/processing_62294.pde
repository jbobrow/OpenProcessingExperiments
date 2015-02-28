
void setup()
{
  size(300, 300);
  background(0, 0, 0);
  smooth();
  frameRate(30);
}

void draw()
{

  //settings
  fill(0, 0, 0);
  quad(0, 0, 0, height, width, height, width, 0);
  fill(0, 255, 0);
  textAlign(LEFT);

  //text

  if (frameCount > 10)
  {
    text("Initializing::R00T_deciMAL", 4, 15);
  }

  if (frameCount > 20)
  {
    text("Sequence::DOS_ACCESSOR_3T4", 4, 30);
  }

  if (frameCount > 25)
  {
    text("CmdrHckBackdoor == 1", 4, 45);
  }


  if (frameCount > 35)
  {
    text("DEF REG CONFIG VALUE::", 4, 60);
  }


  if (frameCount > 50)
  {
    text("RCF==§Ü╫", 4, 75);
  }


  if (frameCount > 55)
  {
    text("GGG!=SSS", 4, 90);
  }


  if (frameCount > 65)
  {
    text("DelivCmd '1337h4x'", 4, 105);
  }


  if (frameCount > 75)
  {
    text("CmdP severed. Access Granted.", 4, 120);
  }




  //Access Box
  if(frameCount> 90)
  {
  quad(10, width*1/2, 290, width*1/2, 290, 290, 10, 290);

  fill(0, 0, 0);
  textAlign(CENTER);
  text("ACCESS GRANTED", 150, width*3/4);
  }
}

