
///GROOVE BAR FOR BUILDING YOUR OWN CHAOS PAD
///WHICH YOU CAN USE AFTER FOR HOOKING IT TO LIVE ABLETON THROUGH MIDI OR OSC OR...
///SENDING MIDI TO YOUR FAVORITE ANALOGUE SYNTH OR...
///SENDING SIGNALS TO SUPERCOLLIDER FOR TRIGGERING SYNTHS
///PROJECT STARTED AT DECEMBER 13TH 2012, AT ZURICH, SWITZERLAND
///AUTHOR: ANDRÉS VILLA TORRES/andresvillatorres@gmail.com
///PLEASE SERVE YOUR SELF, AND FEEL FREE TO COMMENT/CONTACT ME

//CLASS GROOVE BAR DEFINITION
grooveBar gB1;

//MANY VARIABLES FOR AFFECTING WHEN STARTING THE GROOVE BAR*****HERE YOU CAN CONTRIBUTE TO SIMPLIFY THE SINTAXIS, IM VERY BEGINNER WRITING CLASSES
float posgB_X=100;//GLOBAL POSITION X FOR THE BAR (LEFT UP CORNER)
float posgB_Y=100;//GLOBAL POSITION Y FOR THE BAR (LEFT UP CORNER)
int w_gB=1300;//GLOBAL WIDTH OF THE BAR
int h_gB=520;//GLOBAL HEIGHT OF THE BAR
int step_gB=260;//STEP BETWEEN ONE BUTTON AND THE NEXT
int w_Butt=250;//WIDTH OF SINGLE BUTTON
int h_Butt=250;//HEIGHT OF SINGLE BUTTON
int f_Butt=20;//FILLET OF SINGLE BUTTON
int r_Butt=50;//R VALUE FOR THE RGB FROM THE BUTTON
int g_Butt=50;//G VALUE FOR THE RGB FROM THE BUTTON
int b_Butt=50;//B VALUE FOR THE RGB FROM THE BUTTON
int barArea;//CALCULATING THE AREA OF THE BAR
int buttonArea;//CALCULATING THE AREA OF THE BUTTON
int addIndex=0;//VALUE ADDED TO THE OSC MESSAGE RAS(IN THIS PARTICULAR SKETCH STANDS FOR RYTHMIC AUDITORY STIMULATION) BEAT SUBDIVISIONS
int indexB_Bar;//VALUE THAT STANDS FOR THE ID'S OF THE SINGLE BUTTONS WITHIN THE GROOVE BAR
int rasBS=5;

void setup()
{
  size(screenWidth, screenHeight);
  background(255);
    smooth();
//GROOVE BAR SETTINGS    
posgB_X=(width/2-650);
posgB_Y=(height/2 - 260);
grooveBarVar();

}

void draw()
{

 smooth();
  //DRAWING GROOVE BAR

   grooveBarVarDraw();  


}



void grooveBarVar()//FUNCTION FOR INITIALIZING THE BAR OUT OF THE CLASS
{
  gB1= new grooveBar(posgB_X, posgB_Y, w_gB, h_gB, step_gB);
  barArea=w_gB*h_gB;
  buttonArea=w_Butt*h_Butt;
  gB1.initButtons();
}



void grooveBarVarDraw()//FUNCTION FOR DRAWING THE BAR OUT OF THE CLASS
{
  for (int i=0;i<(w_gB/step_gB);i++)
  {
    for (int j=0;j<(h_gB/step_gB);j++)
    { 
      if (i<(w_gB/step_gB)&&j==0)
      {
        indexB_Bar=i;
      }
      else
      {
        indexB_Bar=i+5;
      }
      gB1.display(i*step_gB, j*step_gB, w_Butt, h_Butt, f_Butt, r_Butt, g_Butt, b_Butt, indexB_Bar);
      gB1.buttonOver(i*step_gB, j*step_gB, mouseX, mouseY, w_Butt, f_Butt, w_Butt/2, indexB_Bar);
    }
  }
}

void mousePressed()
{
  //CONDITIONS FOR GROOVEBAR BUTTONS
 
  for (int i=0;i<(w_gB/step_gB);i++)
  {
    for (int j=0;j<(h_gB/step_gB);j++)
    {

      if (i<(w_gB/step_gB)&&j==0)
      {
        indexB_Bar=i;
      }
      else
      {
        indexB_Bar=i+5;
      }
      gB1.mousePressed(i*step_gB, j*step_gB, indexB_Bar, 100, 100, 100, w_Butt/2, mouseX, mouseY);
       
    }
  }

}
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
    rect(x, y, wB, hB, fB); 
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



