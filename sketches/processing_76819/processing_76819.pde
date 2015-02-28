
/* --------------------------------------------------------------------------
 * SimpleOpenNI User Test
 * --------------------------------------------------------------------------
 * Processing Wrapper for the OpenNI/Kinect library
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Max Rheiner / Interaction Design / zhdk / http://iad.zhdk.ch/
 * date:  02/16/2011 (m/d/y)
 * ----------------------------------------------------------------------------
 */

import SimpleOpenNI.*;
import dmxP512.*;
import processing.serial.*;

SimpleOpenNI  context;
boolean       autoCalib=true;

DmxP512 dmxOutput;
int universeSize=128;

int ledPartD=1;
int ledPartI=1;
int ledPartDOld;
int ledPartIOld;
int rgb=3;
int colorDI=1;
int brillo=255;
int nivelBajo=5;
int numrgb=3;

String DMXPRO_PORT="COM4";//case matters ! on windows port must be upper cased.
int DMXPRO_BAUDRATE=115000;

void setup()
{
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
  dmxOutput=new DmxP512(this, universeSize, false);

  dmxOutput=new DmxP512(this, universeSize, false);
  dmxOutput.setupDmxPro(DMXPRO_PORT, DMXPRO_BAUDRATE);

  dmxOutput.set(1, 0);
  dmxOutput.set(2, 0);
  dmxOutput.set(27, 0);
  dmxOutput.set(28, 0);
}

void draw()
{
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

  //  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  //
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  //
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
}

// -----------------------------------------------------------------
// SimpleOpenNI events
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



