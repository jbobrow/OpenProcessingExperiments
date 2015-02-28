
import SimpleOpenNI.*;
import dmxP512.*;
import processing.serial.*;
DmxP512 dmxOutput;
int universeSize=512;
int i= 255;

String DMXPRO_PORT="COM4";//case matters ! on windows port must be upper cased.
int DMXPRO_BAUDRATE=115000;

SimpleOpenNI  context;
boolean autoCalib=true;

/*//////////////////
 V A R I A B L E S
 ///////////////// */
int numLED; // Define el LED seleccionado 0-3
int posLED; // Define la parte del led que está encendida 0-7
int posOldLED; // Define el led que estaba encencido 0-7
int R; // Cantidad de luz ROJA 0-255
int G; // Cantidad de luz VERDE 0-255
int B; // Cantidad de luz AZUL 0-255
int bgR; // Cantidad de luz ROJA de fondo 0-255
int bgG; // Cantidad de luz VERDE de fondo 0-255
int bgB; // Cantidad de luz AZUL de fondo 0-255
int ledPartD;
int ledPartI;

// Crea un array 2D con los canales DMX de las 4 barras LED
int[][] ledDMX = {  
  {
    3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26
  }
  , 
  {
    29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52
  }
  , 
  {
    55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78
  }
  , 
  {
    81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104
  }
};

void setup () {
  size(100, 400, JAVA2D);  
  dmxOutput=new DmxP512(this, universeSize, false);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);
// Reseteo inicial de los LEDs (pasamos por 1 por algún problena extraño que no se traga el 0 inicial)
  bgR=1;  
  bgG=1;  
  bgB=1;
  bg();
  bgR=0;  
  bgG=0;  
  bgB=0;
  bg();
  
  context = new SimpleOpenNI(this);

  // enable depthMap generation 
  if (context.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);

  background(200, 0, 0);

  stroke(0, 0, 255);
  strokeWeight(3);
  smooth();

  size(context.depthWidth(), context.depthHeight()); 
}

void draw() {
    // update the cam
  context.update();

  // draw depthImageMap
  image(context.depthImage(), 0, 0);

  // draw the skeleton if it's available
  int[] userList = context.getUsers();
  for (int i=0;i<userList.length;i++)
  {
    if (context.isTrackingSkeleton(userList[i]))
      drawSkeleton(userList[i]);
  }
}

// BACKGROUND Función que manda BG a todos los LED
void bg () { 
  for (int a=0; a<4; a++) {
    bgLED(a);
  }
}
// RESET BG
void resetBG() {
  bgR=0;
  bgG=0;
  bgB=0;
  bg();
}

// Función que define el fondo (iluminación tenue). Le llega el número de led y los valores R G B
void bgLED (int bgNumLED) { 
  for (int n=0; n<24; n=n+3) {
    dmxOutput.set((ledDMX[bgNumLED][n]), bgR);
    dmxOutput.set((ledDMX[bgNumLED][n+1]), bgG);
    dmxOutput.set((ledDMX[bgNumLED][n+2]), bgB);
  }
  return;
}



// TECLAS
void keyReleased () {
  if (key=='q') {
    resetBG();
  }
  if (key=='r') {
    bgR= bgR +5;
    if (bgR>255) {
      bgR=0;
    }
    println(bgR);
    bg();
  }
  if (key=='f') {
    bgR= bgR -5;
    if (bgR<0) {
      bgR=255;
    }
    println(bgR);
    bg();
  }
  if (key=='v') {
    bgR=0;
    println(bgR);
    bg();
  }
  if (key=='t') {
    bgG= bgG +5;
    if (bgG>255) {
      bgG=0;
    }
    println(bgG);
    bg();
  }
  if (key=='g') {
    bgG= bgG -5;
    if (bgG<0) {
      bgG=255;
    }
    println(bgG);
    bg();
  }
  if (key=='b') {
    bgG=0;
    println(bgG);
    bg();
  }
  if (key=='y') {
    bgB= bgB +5;
    if (bgB>255) {
      bgB=0;
    }
    println(bgB);
    bg();
  }
  if (key=='h') {
    bgB= bgB -5;
    if (bgB<0) {
      bgB=255;
    }
    println(bgB);
    bg();
  }
  if (key=='n') {
    bgB=0;
    println(bgB);
    bg();
  }

  //if (key=='2') {
  //  // for (int cdmx = 4; cdmx < 27; cdmx = cdmx+3) {
  //  dmxOutput.set(4, 55);
  //  //      dmxOutput.set(7, 50);
  //  //}
  //}
  //if (key=='3') {
  //  //  for (int cdmx = 5; cdmx < 27; cdmx = cdmx+3) {
  //  dmxOutput.set(5, 55);
  //  //      dmxOutput.set(8, 50);
  //  //}
  //}
  //if (key=='a') {
  //  for (int cdmx = 0; cdmx <27; cdmx = cdmx+1) {
  //    dmxOutput.set(cdmx, 0);
  //  }
  //}
  //if (key=='w') {
  //  dmxOutput.set(1, 15);
  //}
  //if (key=='e') {
  //  dmxOutput.set(1, 1);
  //}
}
// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data

  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, jointPos);
  float handDY= map(jointPos.y, 800, -500, 1, 8);
  ledPartD= (int(handDY))+1;
  if (ledPartD != ledPartDOld) {
    // println(ledPartD);
    colorDI=1;
    ledBar(ledPartD);
    ledPartDOld=ledPartD;
  }
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, jointPos);
  float handIY= map(jointPos.y, 800, -500, 1, 8);
  ledPartI= (int(handIY))+1;
  if (ledPartI != ledPartIOld) {
    // println(ledPartI);
    colorDI=1;
    ledBar(ledPartI);
    ledPartIOld=ledPartI;
  }

  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

}

void ledBar(int barra) {
  switch(barra) {
  case 0:
    for (int cdmx =3+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    println("apagados");
    break;
  case 1:
    for (int cdmx =6+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =3+colorDI; cdmx< 6; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }   
    break;

  case 2:
    for (int cdmx =3+colorDI; cdmx< 6; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =9+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =6+colorDI; cdmx< 9; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;

  case 3:
    for (int cdmx = 3+colorDI; cdmx< 9; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =12+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx,nivelBajo);
    }
    for (int cdmx =9+colorDI; cdmx< 12; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;

  case 4:
    for (int cdmx =3+colorDI; cdmx< 12; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =15+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =12+colorDI; cdmx< 15; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;

  case 5:
    for (int cdmx =3+colorDI; cdmx< 16; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =18+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =15+colorDI; cdmx< 18; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;

  case 6:
    for (int cdmx =3+colorDI; cdmx< 18; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =21+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =18+colorDI; cdmx< 21; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;

  case 7:
    for (int cdmx =3+colorDI; cdmx< 21; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =24+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =21+colorDI; cdmx< 24; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;

  case 8:
    for (int cdmx =3+colorDI; cdmx< 24; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, nivelBajo);
    }
    for (int cdmx =24+colorDI; cdmx< 27; cdmx = cdmx+rgb) {
      dmxOutput.set(cdmx, brillo);
    }
    break;
  }
}

void onNewUser(int userId)
{
  println("onNewUser - userId: " + userId);
  println("  start pose detection");

  if (autoCalib)
    context.requestCalibrationSkeleton(userId, true);
  else    
    context.startPoseDetection("Psi", userId);
}

void onLostUser(int userId)
{
  println("onLostUser - userId: " + userId);
}

void onExitUser(int userId)
{
  println("onExitUser - userId: " + userId);
}

void onReEnterUser(int userId)
{
  println("onReEnterUser - userId: " + userId);
}

void onStartCalibration(int userId)
{
  println("onStartCalibration - userId: " + userId);
}

void onEndCalibration(int userId, boolean successfull)
{
  println("onEndCalibration - userId: " + userId + ", successfull: " + successfull);

  if (successfull) 
  { 
    println("  User calibrated !!!");
    context.startTrackingSkeleton(userId);
  } 
  else 
  { 
    println("  Failed to calibrate user !!!");
    println("  Start pose detection");
    context.startPoseDetection("Psi", userId);
  }
}

void onStartPose(String pose, int userId)
{
  println("onStartPose - userId: " + userId + ", pose: " + pose);
  println(" stop pose detection");

  context.stopPoseDetection(userId); 
  context.requestCalibrationSkeleton(userId, true);
}

void onEndPose(String pose, int userId)
{
  println("onEndPose - userId: " + userId + ", pose: " + pose);
}




