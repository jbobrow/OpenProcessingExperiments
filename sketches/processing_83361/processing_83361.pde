
class grooveBar {

  //VARIABLES WHICH NEED TO BE ACCESSED FROM DIFFERENT POINTS WITHN THE FUNCTIONS INSIDE THIS CLASS
  float xLoc;
  float yLoc;  
  int w;
  int h;
  int step;
  float reactRatio, wButton;

  int []xPos= new int[width];
  int []yPos= new int[height];
  boolean [] flag = new boolean[width];




  grooveBar(float ixp, float iyp, int iw, int ih, int iStep)//CONSTRUCTOR VARIABLES
  {
    xLoc=ixp;//POSITION X
    yLoc=iyp;//POSITION Y
    w=iw;//WIDTH
    h=ih;//HEIGHT
    step=iStep;//STEPS
  }

  void initButtons()//FUNCTION FOR INITIALIZING BAR VALUES(NOT SURE THAT THIS IS STILL PLAYING A ROLE
  {
    for (int i=0;i<w;i=i+step)
    {
      for (int j=0;j<h;j=j+step)
      {
        xPos[i]=i;
        yPos[j]=j;
        flag[i]=false;
      }
    }
  }

  void display(int x, int y, float dwB, float dhB, float dfB, float drB, float dgB, float dbB, int indexPressed)//FUNCTION FOR DISPLAYING 
  {

    PVector centerBlock= new PVector(xPos[x]+xLoc, yPos[y]+yLoc);

    if (flag[indexPressed]== true)
    {
      block(centerBlock.x, centerBlock.y, dwB, dhB, dfB, drB+182, dgB-50, dbB+50);
    }
    else
    {
      block(centerBlock.x, centerBlock.y, dwB, dhB, dfB, drB, dgB, dbB);
    }
  }


  void block(float x, float y, float wB, float hB, float fB, float R, float G, float B)//FUNCTION FOR INDIVIDUAL BLOCKS
  {

    noStroke();
    fill(R, G, B);
    rectMode(CORNER);
    rect(x, y, wB, hB); 
    reactRatio=wB-15;
  }

  void buttonOver(int x, int y, float mX, float mY, float rbW, float fillet, float reactRange, int indexOver)//FUNCTION FOR MOUSE OVER
  {

    PVector centerMouse= new PVector(mX, mY);
    PVector centerReact= new PVector(xPos[x]+xLoc+reactRange, yPos[y]+yLoc+reactRange);
    PVector centerReactDraw= new PVector(xPos[x]+xLoc, yPos[y]+yLoc);

    if (centerMouse.dist(centerReact)<=reactRange)
    {
      if (flag[indexOver]== true)
      {
        block(centerReactDraw.x, centerReactDraw.y, rbW, rbW, fillet-1, 230, 230, 230);
      }
      else
      {
        block(centerReactDraw.x, centerReactDraw.y, rbW, rbW, fillet-1, 170, 170, 170);
      }
    }
  }

  void mousePressed(int x, int y, int index, int R, int G, int B, float reactRange, float mX, float mY)//FUNCTION FOR MOUSE PRESS + CALLING AND WRITING THE OSC MESSAGES
  {
    PVector centOnPressed= new PVector(xPos[x]+xLoc+reactRange, yPos[y]+yLoc+reactRange);
    PVector centerMouse= new PVector(mX, mY);

    if (centerMouse.dist(centOnPressed)<=reactRange)
    {
      if (flag[index]==false)
      {
        flag[index]=true;
        addIndex=addIndex+1;//THE VALUE ADDED EACH TIME A BUTTON IS RECOGNIZED AS ON     
        rasBS=addIndex;//changing directly the value for the rasBS=value;
//        rasON_OFF();//calling the oscMessage function for changing the rasON_OFF
        println(index + " is ON");
        println(rasBS);
      }
      else
      {
        flag[index]=false;
        addIndex=addIndex-1;//THE VALUE SUBSTRACTED EACH TIME A BUTTON IS RECOGNIZED AS OFF     
        rasBS=addIndex;//changing directly the value for the rasBS=value;
//        rasON_OFF();//calling the oscMessage function for changing the rasON_OFF
        println(index + " is OFF");
        println(rasBS);
        
      }
    }
  }
}


