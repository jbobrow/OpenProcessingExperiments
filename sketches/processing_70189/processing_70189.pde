
//starting x and y coordinates
int xPos=200;
int yPos=200;
//initial x,y direction 
int xDir=0;
int yDir=0;
//directional speed
int sTep=2;
//window size
int sizeX=800;
int sizeY=600;
//initialize random variable
int doRandom=0;
int useRandom=10; //change random direction every 10 draws
void setup()
{
  size (sizeX,sizeY);
  smooth();
  background(0,255,255);
  noStroke();
  fill(0,255,0);
  noLoop(); //do not start draw function
};


void draw(){
  //randomize RGB colors for drawing boxes
  int randR = 1 + (int)(Math.random()*255); 
  int randG = 1 + (int)(Math.random()*255); 
  int randB = 1 + (int)(Math.random()*255); 
  fill(randR,randG,randB);
  rect(xPos, yPos, 20, 20);
  //continues to the opposite side  when reaches to the end (left & right)
  if (xPos >= sizeX)
  {xPos=0;}
  else if (xPos < 0)
  {xPos=sizeX;}
 //continues to the opposite side  when reaches to the end (up & down)
  if (yPos >= sizeY)
  {yPos=0;}
  else if (yPos < 0)
  {yPos=sizeY;}
  
  //check if "r" key was pressed and randomize xDir and yDir. box will now move in random direction on 10th draw
  if (doRandom == 1){ //if "r" pressed then
    if (useRandom == 10){ //only change random direction on 10th draw
    //randomize X direction 1-3 where 1=-1, 2=0, 3=+1
    int newDirX = 1+ (int)(Math.random()*3);
    if (newDirX==1)
      xDir=-1;
    else if (newDirX==2)
      xDir=0;
    else
      xDir=1;
    //randomize Y direction 1-3 where 1=-1, 2=0, 3=+1
    int newDirY = 1+ (int)(Math.random()*3);
    if (newDirY==1)
      yDir=-1;
    else if (newDirY==2)
      yDir=0;
    else
      yDir=1; 
    //check if both random direction are zero and change one so it doesnt stay in same place for 10 draws
    if (xDir==0 && yDir==0){
      int pickXY = 1+ (int)(Math.random()*2); //decide which axis to change (1=X, 2=Y)
      if (pickXY==1){ //picked X 
        newDirX = 1+ (int)(Math.random()*2); //now randomly decide left or right
        if (newDirX==1)
          xDir=-1; //move left
        else if (newDirX==2)
          xDir=1;  //move right
      }
     else{ //picked Y
        newDirY = 1+ (int)(Math.random()*2); //now randomly decide up or down
        if (newDirY==1)
          yDir=-1; //move up
        else if (newDirY==2)
          yDir=1; //move down
     } 
    };  
      useRandom--; // reduce useRandom by -1 
    }
    else if (useRandom == 0) { //reset useRandom to 10 so we can chage direction on 10th draw again
      useRandom=10;}
    else { 
    useRandom--;}
  }
  //change x and y position 
  xPos=xPos+xDir*sTep;
  yPos=yPos+yDir*sTep;
};

void keyReleased(){
  //noLoop();
};

void keyPressed(){
if (key =='d'){xDir=1;yDir=0;doRandom=0;loop();}; //right

if (key =='w'){xDir=0;yDir=-1;doRandom=0;loop();};//up

if (key =='a'){xDir=-1;yDir=0;doRandom=0;loop();};//left

if (key =='x'){xDir=0;yDir=1;doRandom=0;loop();}; //down

if (key =='q'){xDir=-1;yDir=-1;doRandom=0;loop();}; //up-left

if (key =='e'){xDir=1;yDir=-1;doRandom=0;loop();}; //up-right

if (key =='z'){xDir=-1;yDir=1;doRandom=0;loop();}; //down-left

if (key =='c'){xDir=1;yDir=1;doRandom=0;loop();}; //down-right

if (key =='r'){doRandom=1;useRandom=10;loop();}; //randomize direction

if (key == 's'){noLoop();};//pause
};









