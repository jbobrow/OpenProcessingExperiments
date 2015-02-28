
class Man
{
  PImage[][] man1=new PImage[4][2];
  int xpos,ypos;
  int count=0;
  int sleepLevel=1;
  int maxSleepLevel=3;
  
  boolean sleep=false;
  Man(int x, int y)
  {
    xpos=x;
    ypos=y;
    
    for(int z=0;z<maxSleepLevel+1;z++)
    {
      for(int i=0;i<2;i++)
      {
        man1[z][i]=loadImage("sleep"+z+"-"+(i+1)+".png");
      }
    }
    
  } 
  void Display()
  {
    int fc=(int)frameCount%(int)frameRate;
    if(fc==0)
    {
      count++;
      count=count%2;
    }
    image(man1[sleepLevel][count], xpos, ypos);
  }
  
  void SleepPlus()
  {
    if(!sleep)sleepLevel++;
    if(sleepLevel>=3) sleepLevel=3; 
  }
  void SleepMinus()
  {
    if(!sleep)sleepLevel--;
    if(sleepLevel<=0) sleepLevel=0; 
  }
  
  void SleepCheck()
  {
    if(sleepLevel>=maxSleepLevel) sleep=true;
  }
  
}

