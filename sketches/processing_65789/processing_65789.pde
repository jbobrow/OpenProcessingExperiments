
// rectMovesClick.
//
// This sketch will create a bunch of rectangles
// in a grid formation. When clicked each rectangle will
// move to the center. The ulitmate use for this will
// be to create a quiz show game, where the rectangles
// will represent question paneles. When a certain
// panel is clicked it will move to the center.
// more animation will be necessary to reveal the questions,
// reset the game and celebrate a correct, or incorrect answer.

// release under Creative Commons Atribution licence.
// by James McLain from whalebone IR and Software.
//   http://whaleboneir.com
// July 19, 2012

int cols      = 5;
int rows      = 5;
int colWidth  = 135;
int rowHeight = 95;
int gridLeft  = 80;
int gridTop   = 140;
int colGap    = 5; // gap between coluns;
int rowGap    = 5;  // gap between rows;
public PFont sFont, tFont;
int currentCell = 0;
int totalCells = rows*cols;
int goalX     = 350;
int goalY     = 400;
color imUpColor;
color atRestColor;
Seeker[] mySeekers = new Seeker[rows*cols];


public class Seeker {
    
  color c,shadow,highlights,sparkleColor; 
  String buttonMessage; 
  PVector mypos;
  PVector mysize;
  PVector myvel;
  PVector mygoal;
  float   leftBound; 
  float   rightBound;
  float   upperBound; 
  float   lowerBound; 
  boolean imUp;
  boolean imPlayer; // i.e. I am not a title or info. only cell.

  // The default constructor
  Seeker() {
    c      = color(0,0,0);  
    mypos  = new PVector( gridLeft, gridTop );
    mysize = new PVector( colWidth, rowHeight );
    myvel  = new PVector( 2, 3 );
    mygoal   = new PVector( width/2, height/2 );
    leftBound =  mypos.x;
    rightBound = mypos.x + mysize.x;
    upperBound = mypos.y; 
    lowerBound = mypos.y + mysize.y; 
    imUp   = false;

  } // end default constructor
 
  // Constructor with full parameters.
  public void Seeker(
    color tempC,  
    PVector tempMyPos,
    PVector tempMySize,
    PVector tempMyVel,
    PVector tempGoal,
    boolean tempImUp  
  ) 
  
  {
    c      = tempC;  
    mypos  = tempMyPos;
    mysize = tempMySize;
    myvel  = tempMyVel;
    mygoal   = tempGoal;
    leftBound =  mypos.x;
    rightBound = mypos.x + mysize.x;
    upperBound = mypos.y; 
    lowerBound = mypos.y + mysize.y; 
    imUp   = tempImUp;
    
  }  // end constructor with params
  
void init() {

 
}// end of init()

void setButtonText (String theText)
 
{
 theText = theText.trim(); 
 if (theText.length() > 7)
 {
   theText = theText.substring(0,7); 
 }
 buttonMessage =  theText;   
  
} // end of setButtonText
  
void calcBounds() 
 {
   this.leftBound = this.mypos.x - (this.mysize.x/2);;
   this.rightBound = this.mypos.x + (this.mysize.x/2);
   this.upperBound = this.mypos.y - (this.mysize.y/2);
   this.lowerBound = this.mypos.y + (this.mysize.y/2);
 }
  
  
  
void setPos(PVector newPos) 
   {
     mypos.x = newPos.x;
     mypos.y = newPos.y;
     this.calcBounds();
    
   } // end setPos
  
  
  void setGoal(PVector newGoal) 
   {
    
     mygoal = newGoal;
    
   }  // end setGoal 
   
 void setVel(PVector newVel) 
   {
    
     myvel = newVel;
     
   } // end setVel 
   
void seekerClicked (int inX, int inY)
  {
   
    // this rutuine is designed for rectangle mode CENTER.
    // If this is the case x and y do not represent
    // the upper left corner, so the boarders of the
    // rectangle must be calculated.
     
     if ((inX >= this.leftBound) && (inX <= this.rightBound) &&
         (inY >= this.upperBound) && (inY <= this.lowerBound))
        {

          imUp = true;
          moveSeeker();
       
        } else {
        
        }
     
 } // seekerClicked 
  
  
 void moveSeeker()  
  {

   if (this.imUp  && this.imPlayer) 
    {
      mypos.x = mypos.x + (mygoal.x - mypos.x)/5.0;
      mypos.y = mypos.y + (mygoal.y - mypos.y)/5.0;
      this.calcBounds();
    } // if imUP
   
  }  // end moveSeeker 
  
  
 void display() 
  {
    rectMode(CENTER);
    
    if (imUp && imPlayer) 
     {
      fill(imUpColor);
     
      rect(mypos.x,mypos.y,mysize.x,mysize.y);
      
      text(this.buttonMessage,leftBound+30,upperBound+70);

      fill(atRestColor);
     } else {
       
       
       rect(mypos.x,mypos.y,mysize.x,mysize.y);
       if (!imPlayer) 
       {
         
         textFont(tFont,28);
       
        } else {
          
         textFont(sFont,48);
          
        }
       text(this.buttonMessage,leftBound+30,upperBound+70);

     } // end if imUp else
     
     rectMode(CORNER);
  } // end display
}  // end seeker class

void setup()
{
  // these calculation should make it
  // easy to change the number or rows or
  // columns or change any of the size 
  // parameters and yet the size of
  // the sketch itself will adjust.
  
  int goodWidth  = gridLeft + ( colWidth  * (cols-1) )
                            + ( colGap    * (cols-1) )
                            + gridLeft;
  int goodHeight = gridTop  + ( rowHeight * (rows-1) )
                            + ( colGap    * (rows-1) )
                            + gridTop;
  
  //Use this calculated version to make the
  //sketch flexible.
  //size ( goodWidth, goodHeight );
  sFont = loadFont("ComicSansMS-Bold-48.vlw");
  tFont = loadFont("KodchiangUPCBold-28.vlw");  
  
  // Using hard coded values for the online applet.
  size (720,560);
 
  //println("goodWidth: "+ goodWidth);
  //println("goodHeigh: "+ goodHeight);
  
  imUpColor = color( 23,128,0 );
  atRestColor = color( 128,50 );
  goalX = (int) width/2;
  goalY = (int) height/2;
  

  for ( int i = 0; i < rows*cols; i++ )
   {
       mySeekers[i] = new Seeker();
       mySeekers[i].init();
   } //end i
   
   int i,j = 0;
  int jmCell = 0;
  int checkX = 0;
  int checkY = 0;
  for (i = 0; i< rows; i++) 
   {
     checkX = gridLeft + (colWidth*i)+ (colGap*i);
    
   
     for (j = 0; j<cols; j++)
     {
    
         checkY = gridTop + ( rowHeight*j )+ ( rowGap*j );
         mySeekers[ jmCell ].setPos(new PVector(checkX,checkY) );
         
        //mySeekers [ jmCell ].setButtonText(" " + jmCell);
        if  (j==0)  
         {
           textFont(tFont,28);
           mySeekers[jmCell].setButtonText("HISTORY"); 
           mySeekers[jmCell].imPlayer = false;  
         } //end of title row;
        textFont(sFont,48);
        if  (j==1)
          { 
            mySeekers[jmCell].setButtonText("100");
            mySeekers[jmCell].imPlayer = true;
          }
        if  (j==2) 
          { 
            mySeekers[jmCell].setButtonText("200");
            mySeekers[jmCell].imPlayer = true;
          }
        if  (j==3) 
          { 
            mySeekers[jmCell].setButtonText("300");
            mySeekers[jmCell].imPlayer = true;
          }
        if  (j==4)  
          { 
            mySeekers[jmCell].setButtonText("400");
            mySeekers[jmCell].imPlayer = true;
          }
        
        jmCell++;
    
     } // j
   } // i
  background(255);
  smooth();
   
} // end setup
 
void draw()
{
 fill(255);
 // clear the screen the quick way.
 rectMode(CORNER);
 rect(0,0,width,height);
 rectMode(CENTER);
 fill(atRestColor);
 for (int s = 0; s < mySeekers.length; s++)
  { 
    mySeekers[s].moveSeeker();
    mySeekers[s].display();
  } // end s  
} // end draw
 
void mouseReleased()
{
  int currentSeeker = 0; 
  while (currentSeeker < mySeekers.length)
    {
       mySeekers[currentSeeker].seekerClicked(mouseX,mouseY);
        currentSeeker++; 
    }
} // end mouseReleased 


 


