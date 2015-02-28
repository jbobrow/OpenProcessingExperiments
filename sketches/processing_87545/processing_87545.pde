
import SimpleOpenNI.*;
SimpleOpenNI  kinect;
import oscP5.*;
import netP5.*;

//declarations
PVector head = new PVector();
PVector neck = new PVector();
PVector leftShoulder = new PVector();
PVector rightShoulder = new PVector();
PVector leftElbow = new PVector();
PVector rightElbow = new PVector();
PVector leftHand = new PVector();
PVector rightHand = new PVector();
PVector torso = new PVector();
PVector leftHip = new PVector();
PVector rightHip = new PVector();
PVector leftKnee = new PVector();
PVector rightKnee = new PVector();
PVector leftFoot = new PVector();
PVector rightFoot = new PVector();

PVector jnt = new PVector();//temp to test confidence!!!
float confidence;

OscP5 oscP5;

NetAddress MaxAddress;
OscMessage skeletonData;

/////
void setup() 
{
  
  oscP5 = new OscP5(this, 12345);
  MaxAddress = new NetAddress("127.0.0.1", 12346);

  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
  size(640, 480);
  fill(255, 0, 0);

}

void draw() 
{
  kinect.update();
  image(kinect.depthImage(), 0, 0);////something to send the depth image to max
  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  if (userList.size() > 0) 
  {
    int userID = userList.get(0); 
    if ( kinect.isTrackingSkeleton(userID)) 
    {
      drawSkeleton(userID);
    }
    getAndSendOSC(userID);
  }
}

void getAndSendOSC(int userID)
{
  getJoint(userID, SimpleOpenNI.SKEL_HEAD, head); 
  getJoint(userID, SimpleOpenNI.SKEL_NECK, neck);
  getJoint(userID, SimpleOpenNI.SKEL_LEFT_SHOULDER, leftShoulder);
  getJoint(userID, SimpleOpenNI.SKEL_LEFT_ELBOW, leftElbow);
  getJoint(userID, SimpleOpenNI.SKEL_RIGHT_SHOULDER, rightShoulder);
  getJoint(userID, SimpleOpenNI.SKEL_RIGHT_ELBOW, rightElbow);
  getJoint(userID, SimpleOpenNI.SKEL_TORSO, torso);
  getJoint(userID, SimpleOpenNI.SKEL_LEFT_KNEE, leftKnee);
  getJoint(userID, SimpleOpenNI.SKEL_RIGHT_HIP, rightHip);
  getJoint(userID, SimpleOpenNI.SKEL_LEFT_FOOT, leftFoot);
  getJoint(userID, SimpleOpenNI.SKEL_RIGHT_KNEE, leftKnee);
  getJoint(userID, SimpleOpenNI.SKEL_LEFT_HIP, leftHip);
  getJoint(userID, SimpleOpenNI.SKEL_RIGHT_FOOT, rightFoot);
  getJoint(userID, SimpleOpenNI.SKEL_RIGHT_HAND, rightHand);
  getJoint(userID, SimpleOpenNI.SKEL_LEFT_HAND, leftHand);
  
  skeletonData = new OscMessage("/head");
  skeletonData.add(head.x);
  skeletonData.add(head.y);
  skeletonData.add(head.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/neck");
  skeletonData.add(neck.x);
  skeletonData.add(neck.y);
  skeletonData.add(neck.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/rightShoulder");
  skeletonData.add(rightShoulder.x);
  skeletonData.add(rightShoulder.y);
  skeletonData.add(rightShoulder.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/leftShoulder");
  skeletonData.add(leftShoulder.x);
  skeletonData.add(leftShoulder.y);
  skeletonData.add(leftShoulder.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/rightElbow");
  skeletonData.add(rightElbow.x);
  skeletonData.add(rightElbow.y);
  skeletonData.add(rightElbow.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/leftElbow");
  skeletonData.add(leftElbow.x);
  skeletonData.add(leftElbow.y);
  skeletonData.add(leftElbow.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/rightHand");
  skeletonData.add(rightHand.x);
  skeletonData.add(rightHand.y);
  skeletonData.add(rightHand.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/leftHand");
  skeletonData.add(leftHand.x);
  skeletonData.add(leftHand.y);
  skeletonData.add(leftHand.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/torso");
  skeletonData.add(torso.x);
  skeletonData.add(torso.y);
  skeletonData.add(torso.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/leftHip");
  skeletonData.add(leftHip.x);
  skeletonData.add(leftHip.y);
  skeletonData.add(leftHip.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/rightHip");
  skeletonData.add(rightHip.x);
  skeletonData.add(rightHip.y);
  skeletonData.add(rightHip.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/leftKnee");
  skeletonData.add(leftKnee.x);
  skeletonData.add(leftKnee.y);
  skeletonData.add(leftKnee.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/rightKnee");
  skeletonData.add(rightKnee.x);
  skeletonData.add(rightKnee.y);
  skeletonData.add(rightKnee.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/leftFoot");
  skeletonData.add(leftFoot.x);
  skeletonData.add(leftFoot.y);
  skeletonData.add(leftFoot.z);
  oscP5.send(skeletonData, MaxAddress);
  
  skeletonData = new OscMessage("/rightFoot");
  skeletonData.add(rightFoot.x);
  skeletonData.add(rightFoot.y);
  skeletonData.add(rightFoot.z);
  oscP5.send(skeletonData, MaxAddress);
  
}

void getJoint(int userID, int jointID, PVector jointName)
{
  confidence = kinect.getJointPositionSkeleton(userID, jointID, jnt);
  if(confidence == 0.)
  {
    return;
  }
  jointName.set(jnt);  
}

void drawJoint(int userID, int jointID) 
{ 

  PVector joint = new PVector();  

  float confidence = kinect.getJointPositionSkeleton(userID, jointID, joint);

  if(confidence < 0.5)
  {

    return; 

  }
  
  PVector convertedJoint = new PVector();

  kinect.convertRealWorldToProjective(joint, convertedJoint);

  ellipse(convertedJoint.x, convertedJoint.y, 5, 5);

}

// user-tracking callbacks!
void onNewUser(int userID) 
{
  println("start pose detection");
  kinect.startPoseDetection("Psi", userID);
}

void onEndCalibration(int userID, boolean successful) 
{
  if (successful) 
  {
    println("  User calibrated !!!");
    kinect.startTrackingSkeleton(userID);
  }
  else 
  {
    println("  Failed to calibrate user !!!");
    kinect.startPoseDetection("Psi", userID);
  }
}

void onStartPose(String pose, int userID) 
{
  println("Started pose for user");
  kinect.stopPoseDetection(userID);
  kinect.requestCalibrationSkeleton(userID, true);
}

void drawSkeleton(int userID) 
{
  stroke(0); 
  strokeWeight(5);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
  kinect.drawLimb(userID, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);




  noStroke();
  fill(255,0,0);
  drawJoint(userID, SimpleOpenNI.SKEL_HEAD); 
  drawJoint(userID, SimpleOpenNI.SKEL_NECK);
  drawJoint(userID, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  drawJoint(userID, SimpleOpenNI.SKEL_LEFT_ELBOW);
  drawJoint(userID, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  drawJoint(userID, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  drawJoint(userID, SimpleOpenNI.SKEL_TORSO);
  drawJoint(userID, SimpleOpenNI.SKEL_LEFT_KNEE);
  drawJoint(userID, SimpleOpenNI.SKEL_RIGHT_HIP);
  drawJoint(userID, SimpleOpenNI.SKEL_LEFT_FOOT);
  drawJoint(userID, SimpleOpenNI.SKEL_RIGHT_KNEE);
  drawJoint(userID, SimpleOpenNI.SKEL_LEFT_HIP);
  drawJoint(userID, SimpleOpenNI.SKEL_RIGHT_FOOT);
  drawJoint(userID, SimpleOpenNI.SKEL_RIGHT_HAND);
  drawJoint(userID, SimpleOpenNI.SKEL_LEFT_HAND);

}
