
/* --------------------------------------------------------------------------
 * SimpleOpenNI User Test
 * --------------------------------------------------------------------------
 * Processing Wrapper for the OpenNI/Kinect library
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Max Rheiner / Interaction Design / zhdk / http://iad.zhdk.ch/
 * date:  02/16/2011 (m/d/y)
 * ----------------------------------------------------------------------------
 *
 *
 * Swaps Torsos of all detected people
 * 
 */

import SimpleOpenNI.*;
import java.awt.*;
import java.util.List;
import java.util.ArrayList;
import fullscreen.*; 
FullScreen fs; 

SimpleOpenNI  context;
boolean       autoCalib=true;

PImage rgbImage;
PImage userImage;
int[] userMap;
int[] sceneMap;//this will store data about the scene (bg pixels will be 0, and if there are any users, they will have the value of the user id - e.g. if there are no users, the array will be filled with zeros, if there is one user, some array entries will be equal to 1, etc. the size of the array is the same as the number of pixels in scene image, so it's easy to use with the pixels[] of a PImage

List<PImage> userTorsos = new ArrayList<PImage>();
List<Integer> torsosList = new ArrayList<Integer>();

void setup()
{
  context = new SimpleOpenNI(this);
   
  // mirror is by default enabled
  context.setMirror(true);
  
  // enable depthMap generation 
  if(context.enableDepth() == false)
  {
     println("Can't open the depthMap, maybe the camera is not connected!"); 
     exit();
     return;
  }
  
  // enable ir generation
  //context.enableRGB(640,480,30);
  //context.enableRGB(1280,1024,15);  
  if(context.enableRGB() == false)
  {
     println("Can't open the rgbMap, maybe the camera is not connected or there is no rgbSensor!"); 
     exit();
     return;
  }

  context.enableScene();
  context.alternativeViewPointDepthToImage();
  
  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
 
  background(0,0,0);
  size(context.rgbWidth(), context.rgbHeight()); 
  
  userImage = createImage(context.rgbWidth(), context.rgbHeight(), ARGB);
  sceneMap = new int[context.sceneWidth()*context.sceneHeight()];  

  // Create the fullscreen object
  fs = new FullScreen(this); 
  
  // enter fullscreen mode
  fs.enter();  

}

void draw()
{
  
  background(0,0,0);

  // update the cam
  context.update();

  // grab sceneMap (userID for each pixel)
  context.sceneMap(sceneMap);
  // grab camera image
  rgbImage = context.rgbImage();
  rgbImage.loadPixels();


  // Add all Users to the Scene
  // drawAllUsers();
  
  // draw the skeleton if it's available
  int[] userList = context.getUsers();
  int userId;
  int prevUserId = 0;
  if (userList.length > 0) prevUserId = userList[userList.length-1];
  for(int i=0;i<userList.length;i++)
  {
    userId = userList[i];
    if(context.isTrackingSkeleton(userId))
      { 
        captureTorso(userId);
        drawSkeleton(userId);
        drawTorso(userId, prevUserId);
        
        prevUserId = userId;
      }
  }    
  rgbImage.updatePixels();
}

void drawTorso(int userId, int prevUserId)
{
  if (userTorsos.size() == torsosList.size())
  {
   Rectangle recTorso = getTorsoBounds(userId);
   if (torsosList.contains(prevUserId))
    {
      println("draw torso" + userId);
      image(userTorsos.get(torsosList.indexOf(prevUserId)), recTorso.x, recTorso.y, recTorso.width, recTorso.height);
    }
  }
}

//Find Torso Convert to standard size image.  Add to image array
void captureTorso(int userId)
{
  context.sceneMap(sceneMap);
  rgbImage = context.rgbImage();
  rgbImage.loadPixels();
  
  Rectangle recTorso = getTorsoBounds(userId);
  
  PImage userTorso = new PImage(width, height);
  
  // To find the torso,  I only need to find the pixels between the shoulders and the hips
 //   that are part of a user (IE in the scene > 0)
  //clear userImage - fill everything with transparent (0x00FFFFFF)
  Arrays.fill(userTorso.pixels, color(0));
  int contextWidth = context.depthWidth();
  int contextHeight = context.depthHeight();
  for (int x=0;x < contextWidth;x+=1) {
     for (int y=0;y < contextHeight;y+=1) {
          int i = x + y * contextWidth;
          if(sceneMap[i] == userId && recTorso.contains(x, y)) 
          {
              userTorso.pixels[i] = rgbImage.pixels[i];
          }
     }
   }
  userTorso.updatePixels();

  PImage onlyTorso = userTorso.get(recTorso.x, recTorso.y, recTorso.width, recTorso.height);
 
  println("userTorsos: " + userTorsos.size() + " index: " + torsosList.indexOf(userId));
  if (torsosList.contains(userId))
  {
    userTorsos.set(torsosList.indexOf(userId), onlyTorso);
  }
  else
  {
  userTorsos.add(onlyTorso);
  torsosList.add(userId);
  }
}

Rectangle getTorsoBounds(int userId)
{
  PVector leftShoulder = new PVector();
  PVector rightShoulder = new PVector();
  PVector leftHip = new PVector();
  PVector rightHip = new PVector();
  PVector head = new PVector();
   
  float cLeftShoulder = context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_SHOULDER,leftShoulder);
  float cRightShoulder = context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_SHOULDER,rightShoulder);
  float cLeftHip = context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HIP,leftHip);
  float cRightHip = context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HIP,rightHip);
  float cHead = context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_HEAD,head);
  
  PVector pLeftShoulder = new PVector();
  PVector pRightShoulder = new PVector();
  PVector pLeftHip = new PVector();
  PVector pRightHip = new PVector();
  PVector pHead = new PVector();
  
  context.convertRealWorldToProjective(leftShoulder, pLeftShoulder);
  context.convertRealWorldToProjective(rightShoulder, pRightShoulder);
  context.convertRealWorldToProjective(leftHip, pLeftHip);
  context.convertRealWorldToProjective(rightHip, pRightHip);
  context.convertRealWorldToProjective(head, pHead);

  Polygon torso = new Polygon();
  torso.addPoint((int)pLeftShoulder.x, (int)pLeftShoulder.y);
  torso.addPoint((int)pLeftShoulder.x, (int)(pLeftShoulder.y - 2 * abs(pLeftShoulder.y - pHead.y)));
  torso.addPoint((int)pRightShoulder.x, (int)(pRightShoulder.y - 2 * abs(pRightShoulder.y - pHead.y)));
  torso.addPoint((int)pRightShoulder.x, (int)pRightShoulder.y);
  torso.addPoint((int)pRightHip.x, (int)pRightHip.y);
  torso.addPoint((int)pLeftHip.x, (int)pLeftHip.y); 

  return torso.getBounds();
}


//draw All Users into the image
void drawAllUsers()
{
  //clear userImage - fill everything with black
  Arrays.fill(userImage.pixels,color(0));
  for(int i = 0 ; i < userImage.pixels.length; i++){
    if(sceneMap[i] > 0) userImage.pixels[i] = rgbImage.pixels[i];
  }
  userImage.updatePixels();
  image(userImage, 0, 0);
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  stroke(0,255,0);
  strokeWeight(10); //Skeleton
  smooth();
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
}

// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(int userId)
{
  println("onNewUser - userId: " + userId);
  println("  start pose detection");
  
  if(autoCalib)
    context.requestCalibrationSkeleton(userId,true);
  else    
    context.startPoseDetection("Psi",userId);
}

void onLostUser(int userId)
{
  println("onLostUser - userId: " + userId);
  userTorsos.remove(torsosList.indexOf(userId));
  torsosList.remove(torsosList.indexOf(userId));
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
    context.startPoseDetection("Psi",userId);
  }
  
}

void onStartPose(String pose,int userId)
{
  println("onStartPose - userId: " + userId + ", pose: " + pose);
  println(" stop pose detection");
  
  context.stopPoseDetection(userId); 
  context.requestCalibrationSkeleton(userId, true);
}

void onEndPose(String pose,int userId)
{
  println("onEndPose - userId: " + userId + ", pose: " + pose);
}


