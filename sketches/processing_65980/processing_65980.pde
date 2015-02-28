
class Gap
{
  boolean done = false;
  boolean collWithPlayer;
  int numGaps; 
  int [] gapXArray;
  int [] gapWidthArray;
  int gapX;
  int gapWidth;
  float currentXVel;
  //= ant.xvel;
  float jumpDistance = (2*(10/0.35))*3;
  Gap() 
  {
    numGaps = 30;
    gapXArray  = new int [numGaps];
    gapWidthArray = new int [numGaps];
  }

  void createAndDisplay()
  {
    for (int i = 0; i < numGaps; i++)
    {
      if (!done)
      {
        gapWidthArray[i] = (int) random(100, jumpDistance);
        gapXArray[i] = (int) random(300, 30000); 

        if (i == numGaps - 1)
          done = true;
      } 
      else 
      { // When done is true, just draw the rectangle
        for (int j = 0; j < numGaps; j++)
        {
          fill(0);
          rect(gapXArray[j], 500, gapWidthArray[j], 100);
        }
        //println("gapX: " + gapX);
      }
    }
  }

  void checkCollisionWithPlayer() 
  {
    //println("3");
//   ant.checkGaps = false;
    if (ant.checkGaps)
    {
      //println("4");
      for (int a = 0; a < numGaps; a++)
      {
        if (gapXArray[a]<=ant.xpos && ((gapXArray[a] + gapWidthArray[a]) >= ant.xpos) && (ant.ypos + ant.radius >= 500))        
        ant.dead = true;        
      }
    }
  }

}


