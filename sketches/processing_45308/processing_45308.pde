
float redPositionX = 300;
float redPositionY = 300;
float blueDistanceX = 0;
float blueDistanceY = 100;
float redHandX;
float redHandY;
float blueHandX;
float blueHandY;

float [] boardLeftTopX = new float [12];
float [] boardLeftTopY = new float [12];

  
float boardCurrentX;
float boardCurrentY;
  
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
float [] redBallXpos = new float [12];
float [] blueBallXpos = new float [12];
float [] redBallYpos = new float [12];
float [] blueBallYpos = new float [12];
float [] xspeed = new float [12];
float [] yspeed = new float [12];

// declaration ballon array finished ///////////////////
    
void setup()
{
  
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
  
  board = loadImage("board4.png"); 
  momFace = loadImage("momface.jpg");
  redFace = loadImage("redface.jpg"); 
  blueFace = loadImage("blueface.jpg"); 
  wizzardFace = loadImage("wizzardface.jpg"); 
  
  boardCurrentX = boardLeftTopX[0];
  boardCurrentY = boardLeftTopY[0];
  
///////////////initial ballons array//////////////
  
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
  
////////////////// initialization ballons finihed //////////////
} 
 
void draw() 
{ 
  frameRate (20);
  image(board, boardCurrentX, boardCurrentY);
  image(redFace, 0, 0, 150,150);
  image(blueFace, 550,0, 150,150);
  image(momFace, 0,550, 150,150);
  image(wizzardFace, 550,550, 150,150);
  
  
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(redimages[frame], redPositionX, redPositionY, 100, 100);
  image(blueimages[frame], redPositionX + blueDistanceX, redPositionY + blueDistanceY, 100, 100);


///////////////////////////////////////////////////////////////////
/////// draw ballons /////////////////////////////////////////////

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
constrain ( redBallXpos [i], 0,700);
constrain ( redBallYpos [i], 0,700);
constrain ( blueBallXpos [i], 0,700);
constrain ( blueBallYpos [i], 0,700);
///////////////////////////////////////////////////////////////////
/////// drawing ballons finished //////////////////////////////////
}

