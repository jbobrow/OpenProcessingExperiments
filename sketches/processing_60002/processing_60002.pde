
public class JellyFish
{
  //Points on the Bell according to bezier vertex.
  private float[][] pt = new float[7][2];

  //Point discrepencies permeating the first three layers.
  private float[][] pd = new float[3][2];
  
  //Points on the bottom of the bell where the stingers will grow from
  private int numStingers = 7;
  private Stinger[] stingers = new Stinger[numStingers+1];

  //Action is equal to expanding, true;
  private boolean action;
  
  private final static boolean CONTRACTING = false;
  private final static boolean EXPANDING = true;
  private final static int X = 0;
  private final static int Y = 1;
  private float x;
  private float y;
  private float speed;
  private float colorNum;
  private int functionNum;
  private int transparency;
  private int stingerThickness;
  private int frame;

  public JellyFish()
  {
    /**************************************************
                             pt3
                 pt2(pd2)            pt4(pd2)
           pt1(pd1)                      pt5(pd1)
         pt0(pd0)       Strarting Bell      pt6(pd0)
     ***************************************************/
    transparency = 50;
    stingerThickness = 2;
    colorNum = 0;
    for (int i=0; i<pd.length; i++)
      for (int j=0; j<pd[i].length; j++)
        pd[i][j] = 0;
    for(int i=0; i<stingers.length; i++)
      stingers[i] = new Stinger( (int)(random(10,12)),0,0,transparency,stingerThickness );
    randStartingValues();
    updatePoints();
  }

  public void display()
  {
    jellyColor();
    
    colorMode(HSB, 360, 100, height);
    strokeWeight(stingerThickness);
    stroke(colorNum, 100, height, transparency);
    noFill();
    
    beginShape();
    vertex( pt[0][X], pt[0][Y] );
    bezierVertex( pt[1][X], pt[1][Y], pt[1][X], pt[1][Y], pt[2][X], pt[2][Y] );
    bezierVertex( pt[3][X], pt[3][Y], pt[3][X], pt[3][Y], pt[4][X], pt[4][Y] );
    bezierVertex( pt[5][X], pt[5][Y], pt[5][X], pt[5][Y], pt[6][X], pt[6][Y] );
    endShape();
    
    line( pt[0][X],pt[0][Y],pt[6][X],pt[6][Y] );

    setStingerCoor();
    for(int i=0; i<stingers.length; i++)
      stingers[i].display();
    
    moveJelly();
    frame++;
  }
  
  public void jellyColor()
  {
    colorNum += 0.1;
    
    if(colorNum>360)
      colorNum = 0;
  }
  
  private void randStartingValues()
  {
    x = random(25,width-25);
    y = random(1000,height+25);
    speed = (int)random(3,6);
    frame = (int)random(0,30);
  }
  
  private void setStingerCoor()
  {
    for(int i=0; i<stingers.length; i++)
    {
       if(i == numStingers)
         stingers[i].setX( pt[6][X] );
       else stingers[i].setX( pt[0][X]+i*((pt[6][X]-pt[0][X])/numStingers) );
       stingers[i].setY( pt[0][Y] );
       stingers[i].setColor( colorNum );
    }
  }
  

  private void moveJelly()
  {
    if(y <= -25)
      randStartingValues();
    
    if ((pt[6][X]-x) < 10)
    {
      action = EXPANDING;
      functionNum = 1;
    }
    if ((pt[0][Y]-y) < 0)
    {
      action = CONTRACTING;
      functionNum = 3;
    }

    if ((frame%speed == 0 && action) || (frame%speed == 0 && !action))
    {
      updatePointDiscrepency(action, functionNum);
      updatePoints();
      functionNum++;
    }
    
    y -= pd[0][X]/(speed);
  }

  private void updatePoints()
  {
    pt[0][X] = x+pd[0][X]-20;  
    pt[0][Y] = y+pd[0][Y];   
    pt[1][X] = x+pd[1][X]-19;  
    pt[1][Y] = y+pd[1][Y]-5;  
    pt[2][X] = x+pd[2][X]-14;  
    pt[2][Y] = y+pd[2][Y]-7;  
    pt[3][X] = x;              
    pt[3][Y] = y-10;  
    pt[4][X] = x-pd[2][X]+14;  
    pt[4][Y] = y+pd[2][Y]-7;  
    pt[5][X] = x-pd[1][X]+19;  
    pt[5][Y] = y+pd[1][Y]-5;  
    pt[6][X] = x-pd[0][X]+20;  
    pt[6][Y] = y+pd[0][Y];
  }

  private void updatePointDiscrepency(boolean expanding, int num)
  {
    int multiplier = 1;
    if (expanding)
      multiplier = -1;
      
     pd[0][X] += multiplier*(num*0.25);      pd[0][Y] += multiplier*(num*0.25);
     pd[1][X] += multiplier*(num*0.1625);    pd[1][Y] += multiplier*(num*0.25);
     pd[2][X] += multiplier*(num*.1);        pd[2][Y] += multiplier*(num*0.125);
  }
}

