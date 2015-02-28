
void setup()
{
  //framerate is default at 60fps, no need to include frameRate()
}

void draw()
{
  calculateTimePass();
}


void calculateTimePass()
{
  print("The program has been running for: ");
  print(frameCount/60);
  if (frameCount/60 == 1) //code to make sure the program doesn't print "1 seconds". Grammar is important
  {
    println(" second.");
  }
  else println(" seconds.");
}
