
int redPositionX = 300;
int redPositionY = 300;
int blueDistanceX = 0;
int blueDistanceY = 70;
int redHandX;
int redHandY;
int blueHandX;
int blueHandY;
int boardXspeed = 5;
int boardYspeed = 5;
  
int boardLoadingX;
int boardLoadingY;
  

int [] boardLeftTopX = new int [12];
int [] boardLeftTopY = new int [12];


int nX;
int nY;
int numFrames = 10;  // The number of frames in the animation
int frame = 0;
PImage board;
PImage momFace;
PImage redFace;
PImage blueFace;
PImage wizzardFace;
PImage[] redimages = new PImage[numFrames];
PImage[] blueimages = new PImage[numFrames];

// declare ballon array ///////////////////

int r = 63;
int bi= 0;
float [] redBallXpos = new float [12];
float [] blueBallXpos = new float [12];
float [] redBallYpos = new float [12];
float [] blueBallYpos = new float [12];
float [] xspeed = new float [12];
float [] yspeed = new float [12];

// declaration ballon array finished ///////////////////
    
void setup()
{
  frameRate (20);

// intializing the float [] boardLeftTopX and float [] boardLeftTopX

boardLeftTopX[0] = -450;
boardLeftTopY[0] = -1250;
boardLeftTopX[1] = -850;
boardLeftTopY[1] = -1250;   //Y no change
boardLeftTopX[2] = -850;  //X no change
boardLeftTopY[2] = -850; 
boardLeftTopX[3] = -1250;  
boardLeftTopY[3] = -850; //Y no change
boardLeftTopX[4] = -1250; //X no change
boardLeftTopY[4] = -450;
boardLeftTopX[5] = -850;
boardLeftTopY[5] = -450; //Y no change
boardLeftTopX[6] = -850; //X no change
boardLeftTopY[6] = -50; 
boardLeftTopX[7] = -450; 
boardLeftTopY[7] = -50; //Y no change
boardLeftTopX[8] = -450;  //X no change
boardLeftTopY[8] = -450; 
boardLeftTopX[9] = -50;  
boardLeftTopY[9] = -450;  //Y no change
boardLeftTopX[10] = -50;    //X no change
boardLeftTopY[10] = -850;  
boardLeftTopX[11] = -450;    
boardLeftTopY[11] = -850;  //Y no change



  size(700, 700);
  
  redimages[0]  = loadImage("redwalking01.png");
  redimages[1]  = loadImage("redwalking02.png"); 
  redimages[2]  = loadImage("redwalking03.png");
  redimages[3]  = loadImage("redwalking04.png"); 
  redimages[4]  = loadImage("redwalking05.png");
  redimages[5]  = loadImage("redwalking06.png"); 
  redimages[6]  = loadImage("redwalking07.png");
  redimages[7]  = loadImage("redwalking08.png"); 
  redimages[8]  = loadImage("redwalking09.png");
  redimages[9]  = loadImage("redwalking10.png"); 
  
  blueimages[0]  = loadImage("bluewalking01.png");
  blueimages[1]  = loadImage("bluewalking02.png"); 
  blueimages[2]  = loadImage("bluewalking03.png");
  blueimages[3]  = loadImage("bluewalking04.png"); 
  blueimages[4]  = loadImage("bluewalking05.png");
  blueimages[5]  = loadImage("bluewalking06.png"); 
  blueimages[6]  = loadImage("bluewalking07.png");
  blueimages[7]  = loadImage("bluewalking08.png"); 
  blueimages[8]  = loadImage("bluewalking09.png");
  blueimages[9]  = loadImage("bluewalking10.png"); 
  
  board = loadImage("board5.png"); 
  momFace = loadImage("momface.jpg");
  redFace = loadImage("redface.jpg"); 
  blueFace = loadImage("blueface.jpg"); 
  wizzardFace = loadImage("wizzardface.jpg"); 
  
  boardLoadingX = boardLeftTopX[bi];
  boardLoadingY = boardLeftTopY[bi];
  
///////////////initial balloons array//////////////
  
    noStroke();
   
  int i = 0;
  while (i< redBallXpos.length) { 
    redBallXpos [i] = random (0,300);
    redBallYpos [i] = random (0,300);
    xspeed [i] = random (2,5);
    yspeed [i] = random (1,4);
    i=i+1;
  }
      while (i< blueBallXpos.length) { 
    blueBallXpos [i] = random (250,550);
    blueBallYpos [i] = random (250,550);
    xspeed [i] = random (2,5);
    yspeed [i] = random (1,4);
    i=i+1;
  }
  
////////////////// initialization balloons finihed //////////////

} 

void mousePressed () {
   if((boardLoadingX == boardLeftTopX[bi+1]) && (boardLoadingY == boardLeftTopY[bi+1])) {
    bi++; 
    
  }
}

void draw() 
{ 
  
// define the right turn and left turn parameter//


  
  // board move//



if (bi==0) {
  nX = -1;
  nY = 0;}
if (bi==1) {
  nX = 0;
  nY = 1;}
if (bi==2) {
  nX = -1;
  nY = 0;}
if (bi==3) {
  nX = 0;
  nY = 1;}
if (bi==4) {
  nX = 1;
  nY = 0;}
if (bi==5) {
  nX = 0;
  nY = 1;}
if (bi==6) {
  nX = 1;
  nY = 0;}
if (bi==7) {
  nX = 0;
  nY = -1;}
if (bi==8) {
  nX = 1;
  nY = 0;}
if (bi==9) {
  nX = 0;
  nY = -1;}
if (bi==10) {
  nX = -1;
  nY = 0;}
if (bi==11) {
  nX = 0;
  nY = -1;
  bi=-1;
      }
 


   if ((boardLoadingX != boardLeftTopX[bi+1]) || (boardLoadingY != boardLeftTopY[bi+1])) {
         boardLoadingX = boardLoadingX + boardXspeed * nX;
         boardLoadingY = boardLoadingY + boardYspeed * nY;

         image(board, boardLoadingX, boardLoadingY);
         image(redFace, 0, 0, 100,100);
         image(blueFace, 600,0, 100,100);
         image(momFace, 0,600, 100,100);
         image(wizzardFace, 600,600, 100,100);
          

         frame = (frame+1) % numFrames;  // Use % to cycle through frames
         image(redimages[frame], redPositionX, redPositionY, 100, 100);
         image(blueimages[frame], redPositionX + blueDistanceX, redPositionY + blueDistanceY, 100, 100);

   } 

       

  
   

  image(board, boardLoadingX, boardLoadingY);
  image(redFace, 0, 0, 100,100);
  image(blueFace, 600,0, 100,100);
  image(momFace, 0,600, 100,100);
  image(wizzardFace, 600,600, 100,100);
  

  frame = (frame+1) % numFrames;  // Use % to cycle through frames
 
  image(redimages[frame], redPositionX, redPositionY, 100, 100);
  image(blueimages[frame], redPositionX + blueDistanceX, redPositionY + blueDistanceY, 100, 100);




///////////////////////////////////////////////////////////////////
/////// draw balloons /////////////////////////////////////////////

redHandX = 350+10;
redHandY = 350-10;
blueHandX = redHandX + blueDistanceX;
blueHandY = redHandY + blueDistanceY;

int i=0;
 while ( i < redBallXpos.length-1) {     
      stroke(80);
      line (redHandX,redHandY,redBallXpos[i], redBallYpos[i]);
      fill (255-i*16,redBallXpos[i]/2.72-i*2, redBallYpos[i]/2.72-i*12, 150);
      noStroke();
      ellipse (redBallXpos[i], redBallYpos[i], r, r);
      i=i+1;
   }
    
i=0;
 while ( i < redBallXpos.length-1) {
   constrain ( redBallXpos [i], 0,700);
   constrain ( redBallYpos [i], 0,700);
       redBallXpos [i]  = redBallXpos[i] + xspeed[i];
       redBallYpos [i] = redBallYpos[i] +yspeed[i];
         if ((redBallXpos[i] >= width) || (redBallXpos[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;   
  }
         if ((redBallYpos [i]>= height) || (redBallYpos[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
  i=i+1;
}

i=0;
 while ( i < blueBallXpos.length-1) {     
      stroke(80);
      line (blueHandX,blueHandY,blueBallXpos[i], blueBallYpos[i]);
      fill (255-i*16,blueBallXpos[i]/2.72-i*2, blueBallYpos[i]/2.72-i*12, 150);
      noStroke();
      ellipse (blueBallXpos[i], blueBallYpos[i], r, r);
      i=i+1;
   }
    
i=0;
 while ( i < blueBallXpos.length-1) {
   constrain ( blueBallXpos [i], 0,700);
   constrain ( blueBallYpos [i], 0,700);
       blueBallXpos [i]  = blueBallXpos[i] + xspeed[i];
       blueBallYpos [i] = blueBallYpos[i] +yspeed[i];
         if ((blueBallXpos[i] >= width) || (blueBallXpos[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;   
  }
         if ((blueBallYpos [i]>= height) || (blueBallYpos[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
  i=i+1;
}


///////////////////////////////////////////////////////////////////
/////// drawing balloons finished //////////////////////////////////



}




