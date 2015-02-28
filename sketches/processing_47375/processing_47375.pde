
int redPositionX = 350;
int redPositionY = 350;
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
float [] redBallXpos = new float [13];
float [] blueBallXpos = new float [13];
float [] redBallYpos = new float [13];
float [] blueBallYpos = new float [13];
float [] xspeed = new float [13];
float [] yspeed = new float [13];

int numReduceball1=1;
int numReduceball2=1;
int reduceTurn = 1;
float girlTurn = 0;

// declaration ballon array finished ///////////////////

void setup()
{
  frameRate (22);

  // intializing the float [] boardLeftTopX and float [] boardLeftTopX

  boardLeftTopX[11] = -450;
  boardLeftTopY[11] = -1250;
  boardLeftTopX[0] = -850;
  boardLeftTopY[0] = -1250;   //Y no change
  boardLeftTopX[1] = -850;  //X no change
  boardLeftTopY[1] = -850; 
  boardLeftTopX[2] = -1250;  
  boardLeftTopY[2] = -850; //Y no change
  boardLeftTopX[3] = -1250; //X no change
  boardLeftTopY[3] = -450;
  boardLeftTopX[4] = -850;
  boardLeftTopY[4] = -450; //Y no change
  boardLeftTopX[5] = -850; //X no change
  boardLeftTopY[5] = -50; 
  boardLeftTopX[6] = -450; 
  boardLeftTopY[6] = -50; //Y no change
  boardLeftTopX[7] = -450;  //X no change
  boardLeftTopY[7] = -450; 
  boardLeftTopX[8] = -50;  
  boardLeftTopY[8] = -450;  //Y no change
  boardLeftTopX[9] = -50;    //X no change
  boardLeftTopY[9] = -850;  
  boardLeftTopX[10] = -450;    
  boardLeftTopY[10] = -850;  //Y no change



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
    redBallXpos [i] = random (0, 300);
    redBallYpos [i] = random (0, 300);
    xspeed [i] = random (2, 5);
    yspeed [i] = random (1, 4);
    i=i+1;
  }
  while (i< blueBallXpos.length) { 
    blueBallXpos [i] = random (250, 550);
    blueBallYpos [i] = random (250, 550);
    xspeed [i] = random (2, 5);
    yspeed [i] = random (1, 4);
    i=i+1;
  }

  ////////////////// initialization balloons finihed //////////////
} 

void mousePressed () {
  if ((boardLoadingX == boardLeftTopX[bi+1]) && (boardLoadingY == boardLeftTopY[bi+1])) {
    bi++;
    println("numReduceball1: " + numReduceball1 + ", numReduceball2: " + numReduceball2);
    if ( reduceTurn == 1) {
      numReduceball1= numReduceball1+1;
    } 
    else {
      numReduceball2= numReduceball2+1;
     
    }
    // set the parameter to define whose balloons should be reduced beween red girl and blue girl by their locations)
  }
}

void draw() 
{ 

// define the right turn and left turn parameter//

//  redHandX = 350+10; //360
//  redHandY = 350-10; //340
//  blueHandX = redHandX + blueDistanceX; //360
//  blueHandY = redHandY + blueDistanceY; //410


  if (bi==0) {
    nX = 0;
    nY = 1;
    girlTurn = 0;
    redHandX = 350+10; //360
    redHandY = 350-10; //340
    blueHandX = redHandX + blueDistanceX; //360
    blueHandY = redHandY + blueDistanceY; //410
  }
  if (bi==1) {
    nX = -1;
    nY = 0;
    girlTurn = 0.5;
    redHandX = 360;
    redHandY = 360;
    blueHandX = 290;
    blueHandY = 360;
  }
  if (bi==2) {
    nX = 0;
    nY = 1;
    girlTurn = 0;
    redHandX = 360;
    redHandY = 340;
    blueHandX = 360;
    blueHandY = 410;
  }
  if (bi==3) {
    nX = 1;
    nY = 0;
    girlTurn = -0.5;
    redHandX = 340;
    redHandY = 340;
    blueHandX = 410;
    blueHandY = 340;
  }
  if (bi==4) {
    nX = 0;
    nY = 1;
    girlTurn = 0;
    redHandX = 360;
    redHandY = 340;
    blueHandX = 360;
    blueHandY = 410;
  }
  if (bi==5) {
    nX = 1;
    nY = 0;
    girlTurn = -0.5;
    redHandX = 340;
    redHandY = 340;
    blueHandX = 410;
    blueHandY = 340;
  }
  if (bi==6) {
    nX = 0;
    nY = -1;
    girlTurn = -1;
    redHandX = 340;
    redHandY = 360;
    blueHandX = 340;
    blueHandY = 290;
  }
  if (bi==7) {
    nX = 1;
    nY = 0;
    girlTurn = -0.5;
    girlTurn = -0.5;
    redHandX = 340;
    redHandY = 340;
    blueHandX = 410;
    blueHandY = 340;
  }
  if (bi==8) {
    nX = 0;
    nY = -1;
    girlTurn = -1;
    redHandX = 340;
    redHandY = 360;
    blueHandX = 340;
    blueHandY = 290;
  }
  if (bi==9) {
    nX = -1;
    nY = 0;
    girlTurn = 0.5;
    redHandX = 360;
    redHandY = 360;
    blueHandX = 290;
    blueHandY = 360;
  }
  if (bi==10) {
    nX = 0;
    nY = -1;
    girlTurn = -1;
    redHandX = 340;
    redHandY = 360;
    blueHandX = 340;
    blueHandY = 290;
  }
  if (bi==11) {
    nX = -1;
    nY = 0;
    girlTurn = 0.5;
    girlTurn = 0.5;
    redHandX = 360;
    redHandY = 360;
    blueHandX = 290;
    blueHandY = 360;
    
    bi=-1;
  }
  
  reduceTurn =  abs (nX);


  image(board, boardLoadingX, boardLoadingY);

  if ((boardLoadingX != boardLeftTopX[bi+1]) || (boardLoadingY != boardLeftTopY[bi+1])) {
    // WALK
    boardLoadingX = boardLoadingX + boardXspeed * nX;
    boardLoadingY = boardLoadingY + boardYspeed * nY;
    frame = (frame+1) % numFrames;  // Use % to cycle through frames
    // translate(width/2, height/2);
  }

  if ((boardLoadingX == boardLeftTopX[bi+1]) && (boardLoadingY == boardLeftTopY[bi+1])) {
    // STAND STILL
    frame = 3;
  }

  // DRAW
  /*
  pushMatrix();
  rotate (PI/2*(nY-nX));
  println("nX: " + nX + ", nY: " + nY);
  translate (0, -700); 
  image(redimages[frame], redPositionX, redPositionY, 100, 100);
  image(blueimages[frame], redPositionX + blueDistanceX, redPositionY + blueDistanceY, 100, 100);
  popMatrix();     */
  
 pushMatrix();
 imageMode(CENTER);
 translate (redPositionX, redPositionY);
 rotate (PI*girlTurn);  // NEEDS CORRECTION
 //println("nX: " + nX + ", nY: " + nY);

 image(redimages[frame], 0,0, 100, 100);  // notice this is 0,0 now because of translate above
 image(blueimages[frame], blueDistanceX, blueDistanceY, 100, 100);  // notice this omits redPositionX because of translate
 imageMode(CORNER);
 popMatrix();


  /*
//(previous codes)  frame = (frame+1) % numFrames;  // Use % to cycle through frames
   
   //(previous codes)   image(redimages[frame], redPositionX, redPositionY, 100, 100);
   //(previous codes)  image(blueimages[frame], redPositionX + blueDistanceX, redPositionY + blueDistanceY, 100, 100);
   
   if ((boardLoadingX == boardLeftTopX[bi+1]) && (boardLoadingY == boardLeftTopY[bi+1])) {
   image (redimages[3],redPositionX, redPositionY, 100, 100);
   image(blueimages[3], redPositionX + blueDistanceX, redPositionY + blueDistanceY, 100, 100);
   } 
   */


  ///////////////////////////////////////////////////////////////////
  /////// draw balloons /////////////////////////////////////////////

  image(redFace, 0, 0, 100, 100);
  image(blueFace, 600, 0, 100, 100);
  image(momFace, 0, 600, 100, 100);
  image(wizzardFace, 600, 600, 100, 100);
 
  int i=0; 


  while (i < redBallXpos.length-numReduceball1) {     
    drawBallsLinesRed (i);
    i=i+1;
  }

  i=0;
  while ( i < redBallXpos.length-1) {
    checkBounceRed (i);
    i=i+1;
  }

  i=0;
  while ( i < blueBallXpos.length-numReduceball2) {     
    drawBallsLinesBlue (i);
    i=i+1;
  }

  i=0;
  while ( i < blueBallXpos.length-1) {
    checkBounceBlue (i);
    i=i+1;
  }


  


  ///////////////////////////////////////////////////////////////////
  /////// drawing balloons finished //////////////////////////////////
}

/////// functions //////////////////////////////////////////////////

void drawBallsLinesRed (int i) {
  stroke(115,80,80);
  line (redHandX, redHandY, redBallXpos[i], redBallYpos[i]);
 // line (350, 350, redBallXpos[i], redBallYpos[i]);
  fill (255-i*16, redBallXpos[i]/2.72-i*2, redBallYpos[i]/2.72-i*12, 150);
  noStroke();
  ellipse (redBallXpos[i], redBallYpos[i], r, r);
  constrain (numReduceball1, 0, 12);
}

void drawBallsLinesBlue (int i) {
  stroke(80,80,115);
  line (blueHandX, blueHandY, blueBallXpos[i], blueBallYpos[i]); 
 // line (350, 350, blueBallXpos[i], blueBallYpos[i]);
  fill (255-i*16, blueBallXpos[i]/2.72-i*2, blueBallYpos[i]/2.72-i*12, 150);
  noStroke();
  ellipse (blueBallXpos[i], blueBallYpos[i], r, r);
  constrain (numReduceball2, 0, 12);
}

void checkBounceRed (int i) {
  constrain ( redBallXpos [i], 0, 700);
  constrain ( redBallYpos [i], 0, 700);
  redBallXpos [i]  = redBallXpos[i] + xspeed[i];
  redBallYpos [i] = redBallYpos[i] +yspeed[i];
  if ((redBallXpos[i] >= width) || (redBallXpos[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;
  }
  if ((redBallYpos [i]>= height) || (redBallYpos[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
}

void checkBounceBlue (int i) {
  constrain ( blueBallXpos [i], 0, 700);
  constrain ( blueBallYpos [i], 0, 700);
  blueBallXpos [i]  = blueBallXpos[i] + xspeed[i];
  blueBallYpos [i] = blueBallYpos[i] +yspeed[i];
  if ((blueBallXpos[i] >= width) || (blueBallXpos[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;
  }
  if ((blueBallYpos [i]>= height) || (blueBallYpos[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
}





