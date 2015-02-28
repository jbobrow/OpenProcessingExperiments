
// 20 mouth objects which bounce over the screen
// the kiss mouths are moving and bounce with the walls and with each other; the biggest mouth is following the mouse and doesn't bounce; 
//if the mouse is clicked all mouths come together at the mouse position and the biggest kiss mouth trunes into a normal mouth which shows his tongue


mouth [] mymouths; //array for different mouthes
int x;
int y;
int Anzahl=20; // how many mouths should bounce over the screen?
int [] [] actualPositions; // an array to save all actual mouth-positions
int mousex, mousey; // variables to save mouseX and mouseY at the clicked moment to stop the movement of the biggest mouse
boolean mouse_pressed = false; //is true if the mouse was clicked/pressed before
int time; //counter to stop a process
boolean fullmouth = false;//is true after the mouse was clicked and all mouthes have come together


void setup() 
{
  mymouths = new mouth [Anzahl];
  size(500,500);
  background(0);
  smooth();

  actualPositions = new int [Anzahl] [2]; //two-dimensional to save the x and y position for every mouth


  mymouths[0]= new mouth (1, width, height, 0, 0, 0, true); // big mouth which follows the mouse

    //fill the mouth array with different mouthes
  for(int i= 1;i<Anzahl;i++)
  {
    float randomSize = random(0.2,0.6);

    //set a random start position
    int randomXPosition = int(random(0,width-100)); 
    int randomYPosition = int(random(0,height-82));

    actualPositions [i] [0] = randomXPosition;
    actualPositions [i] [1] = randomYPosition; 

    //set a random move direction
    int randomXMove = int(random(1,5));
    int randomYMove = int(random(1,5));

    //set a random green color
    int Color = int (random(0,220));

    mouth mymouth = new mouth(randomSize, randomXPosition, randomYPosition, randomXMove, randomYMove, Color, false);
    mymouths[i] = mymouth;

    time = 0;
  }
}


void draw() 
{
  frameRate(10);
  background(0);

  if(!mouse_pressed) //the normal process which happens without doing anything --> just bouncing
  {
    for(int i =0; i<Anzahl;i++)
    {
      this.contact(i);//checks if this mouth touches another mouth
      this.bounce(mymouths[i],i); //checks if this mouth touches a wall
      mymouths[i].move(x,y); //let this mouth move to the next position -> just straight if it didn't touch anything

      //fill the actualPositions array with the changed position of this mouth
      actualPositions [i] [0] = mymouths[i].positionx;
      actualPositions [i] [1] = mymouths[i].positiony; 

      //display this mouth
      mymouths[i].display(mouseX, mouseY);
    }
  }

  else if (mouse_pressed)//after the mouse has been pressed
      //all mouthes should come together at the mouth position, so at the position of the biggest mouth and should disappear behind the big one
    //after no little mouth is left the big kiss mouth should change into a normal mouth which shows his tongue

  {
    if(!fullmouth) //the mouthes aren't all together yet
    {
      time++;
      this.moveToMouth(); //if the time variable didn't reached a special level all small mouthes are going to move to the mouse position really fast
    }
    else // the mouthes are all together, the time variable has reached the level of 400

    {
      if (time <4)
      {
        frameRate(2);
        background(0);
        translate(width/2-100, height/2-80);
        mymouths[0].display_full();
        time++;
      }
      else
      {
        frameRate(10);
        background(0);
        mymouths[0].display(mousex, mousey);

        //bring all mouthes back to their last positions
        for(int i= 1; i<Anzahl; i++ )  
        {
          mymouths[i].positionx = actualPositions [i] [0];
          mymouths[i].positiony = actualPositions [i] [1];
          mymouths[i].back = true;
          mymouths[i].display(mouseX, mouseY);
        }

        fullmouth = false;
        mouse_pressed = false;
        time = 0;
      }
    }
  }
}

//check if the mouth touches the walls 
void bounce(mouth mymouth, int i)
{
  int positionX=mymouth.positionx;
  int positionY=mymouth.positiony;

  //moving variables
  x = 1;
  y = 1;

  if(positionX<=0) //left wall
  {
    mymouths[i].movex=mymouths[i].movex*-1;
    mymouths[i].positionx=1;
  }
  else if (positionX>=width-100*mymouth.Size) //right wall
  {
    mymouths[i].movex=mymouths[i].movex*-1;
    mymouths[i].positionx=int(width-100*mymouth.Size-1);
  }
  if(positionY<=0) //top
  {
    mymouths[i].movey=mymouths[i].movey*-1;
    mymouths[i].positiony=1;
  }
  else if (positionY>=height-82*mymouth.Size) //bottom
  {
    mymouths[i].movey=mymouths[i].movey*-1;
    mymouths[i].positiony=int(height-82*mymouth.Size-1);
  }
}


void contact (int leaveOut)  //check if two mouthes touch each other
{
  int r1 = int (45*mymouths[leaveOut].Size);//radius of the mouth with which this method starts -> leaveOut
  int r2; //variable for the radius of the other mouth
  int centerX = mymouths[leaveOut].give_center() [0]; //position of the middel point of the mouth
  int centerY = mymouths[leaveOut].give_center() [1]; // [0] = xposition, [1] = yposition
  int centerX2; //the same for the other mouth
  int centerY2;
  int BX; //distance between the xpositions of both middel-points
  int BY; //distance between the ypositions of both middel-points

  //check the collision with every other mouth
  for ( int i=1; i<Anzahl; i++)
  {
    r2 = int (45*mymouths[i].Size);
    centerX2 = mymouths[i].give_center() [0];
    centerY2 = mymouths[i].give_center() [1];

    if (i!=leaveOut) //don't check with himself
    {

      if(small_difference(i,leaveOut)) //if they touch each other
      {

        if(leaveOut == 0)//if the mouth to check is the big mouth just the other mouth changes his direction

        {
          BX = centerX-centerX2;
          BY = centerY-centerY2;
          int GCD=1;
          if (BX!=0 && BY!=0)
          {
            GCD = abs(GCD(BX, BY));
          }
          if (BX==0 && BY!=0) 
          {
            GCD=abs(BY);
          }
          else if (BY==0 && BX!=0)  GCD=abs(BX);

          mymouths[i].movex = -BX/GCD;
          mymouths[i].movey = -BY/GCD;
        }
        else //otherwise both mouthes change their direction
        {

          mymouths[i].movex = mymouths[i].movex*-1;
          mymouths[i].movey = mymouths[i].movey*-1;
          mymouths[leaveOut].movex = mymouths[leaveOut].movex*-1;
          mymouths[leaveOut].movey = mymouths[leaveOut].movey*-1;

          while (small_difference(i,leaveOut)) //they move away from each other as long as they don't touch each other any more
          {
            mymouths[i].move(1,1);
          }
        }
      }
    }
  }
}


void all_together()//if you click the mouse all mouthes should come together at the positino of the big mouth -> after that you can only see the big one
{
  int GCD=1;
  for(int i=1; i<Anzahl; i++)
  {
    if(!mymouths[i].mouse)//if this mouth isn't at the position of the big one yet
    { 
      //difference between this mouths and the big mouth
      int diffX = mousex-mymouths[i].positionx;
      int diffY = mousey-mymouths[i].positiony;

      //the move variables shouldn't have too big values, so we search for the GCD of both variables and divide them by it to make them smaller
      if(diffX!=0&&diffY!=0)   GCD = abs(GCD(diffX, diffY)); 

      if(diffX==0)  GCD = -diffY;

      else if (diffY==0) GCD = -diffX;

      mymouths[i].movex = diffX/GCD;
      mymouths[i].movey = diffY/GCD;
    }
  }
}



public static int GCD (int m, int n) //greatest common divider of m and n
{
  int a = m ;
  int b = n ;
  int p = a ;
  if (n > m) 
  {
    b = m ;
    a = n ;
  }
  while (b != 0) 
  {
    p = a ;
    a = b ;
    b %= p ;
  }
  return a ;
}


void mouseClicked()
{
  mouse_pressed= true;
  mousex=mouseX;
  mousey=mouseY;
  all_together();
}

boolean all_back()  //checks if all mouthes are back on their positions
{
  boolean b = true; // true = all are back
  for(int i=1;i<Anzahl;i++)
  {
    if(mymouths[i].positionx != actualPositions [i] [0] && mymouths[i].positiony != actualPositions [i] [1]) b= false; //if just one mouth isn't back b is false
  }
  return b;
}


void bounceObjects(int i) //bouncing of one mouth and check if they bounce against a wall or another mouth
{

  this.contact(i);
  this.bounce(mymouths[i],i);
  mymouths[i].move(x,y);

  actualPositions [i] [0] = mymouths[i].positionx;
  actualPositions [i] [1] = mymouths[i].positiony; 

  mymouths[i].display(mouseX, mouseY);
}

void moveToMouth() //after the mouse was clicked all mouthes should move to the big one
{
  if (time<200) 
  {
    frameRate(200);
    mymouths[0].display(mousex,mousey); //big  mouth
    for(int i=1; i<Anzahl;i++)
    {
      //check if this mouth is behind the big one
      if ( mymouths[i].positionx>=mousex-41 && mymouths[i].positionx<=mousex+41-mymouths[i].Size*82 && mymouths[i].positiony>=mousey-50 && mymouths[i].positiony<=mousey+50-mymouths[i].Size*100) 
      {
        mymouths[i].mouse=true;
      }
      //otherwise the mouth has to move
      else if(mymouths[i].positionx!=mousex&&mymouths[i].positiony!=mousey&&!mymouths[i].mouse)
      {
        mymouths[i].move(1,1);
        mymouths[i].display(mousex, mousey);
      }
    }
  }
  if(time>=200) //time variable stops the process
  {
    fullmouth = true;
    time = 0;
  }
}


boolean small_difference (int a, int b) //checks if circle a and b touch each other
{
  int r1 = int (45*mymouths[a].Size);
  int r2 =  int (45*mymouths[b].Size);
  int centerX = mymouths[a].give_center() [0];
  int centerY = mymouths[a].give_center() [1];
  int centerX2 = mymouths[b].give_center() [0];
  int centerY2 = mymouths[b].give_center() [1];
  int BX;
  int BY;
  boolean diff = false;

  if(((pow((centerX-centerX2),2))+(pow((centerY-centerY2),2)))<=(pow((r2+r1),2))) //if the distance between one middel-point to the other is smaller or equal radius1+ radius2 
      diff = true;

  return diff;
}


