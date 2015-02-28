
/*
Anscheinend gibt es noch Probleme mit der Umrechung der Punkte von Kinect to Processing.
Ein paar mal habe ich diese Funktion gesehen.

// get the realworld points
        realWorldPoint = context.depthMapRealWorld()[index];
       
Das wurde meist bei den Pointclouds eingesetzt. Um das DepthImage zu übersetzen.

Bei diesem Beispiel haben auch wahnsinnsumrechnungen stattgefunden:
http://graphics.stanford.edu/~mdfisher/Kinect.html

*/


import SimpleOpenNI.*;

SimpleOpenNI  context;


void setup()
{
  context = new SimpleOpenNI(this);

  // enable depthMap generation 
  context.enableDepth();
       
  // disable mirror
  context.setMirror(false);

  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);

  background(200,0,0);

  stroke(0,0,255);
  strokeWeight(3);
  smooth();

  size(context.depthWidth(), context.depthHeight());
}

void draw()
{
  // update the cam
  context.update();

  // draw depthImageMap
  image(context.depthImage(),0,0);

  // draw the skeleton if it's available
  if(context.isTrackingSkeleton(1))
    drawSkeleton(1);
  mapTexture(1);
}


void mapTexture(int userID) {

  //imagefile, scale, joint
  
  // woher nimmst du den SCALE Factor (geschaetzt nehme ich an)? Joint habe ich nicht nach vollziehen können
  
  
  mapImg2Joint(userID, "kopf.png", .6, SimpleOpenNI.SKEL_HEAD, 0,0);
  mapImg2Joint(userID, "koerper.png", .4, SimpleOpenNI.SKEL_NECK, 0, 140);
  mapImg2Joint(userID, "oberarm_rechts.png", .4, SimpleOpenNI.SKEL_RIGHT_ELBOW, 0, 140);

//das hat anscheinend noch nicht funktioniert
  mapImgBetweenJoints(userID, "oberarm_rechts.png", SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_LEFT_ELBOW);
}

void mapImg2Joint(int userID, String fileName, float imgScale, int joint, float offsetX, float offsetY) {

  PImage img;
  img = loadImage(fileName);


  PVector jointPos2d =  get2dCoordsOfJoint(userID, joint);

  imageMode(CENTER);

  pushMatrix();
  translate(jointPos2d.x+offsetX,jointPos2d.y+offsetY);

  pushMatrix();
  scale(imgScale);
  image(img, 0,0);
  popMatrix();

  popMatrix();

//das war glaube ich doppelt
  //imageMode(CENTER);
}

void mapImgBetweenJoints(int userID, String fileName, int joint1, int joint2) {
  PImage img;
  img = loadImage(fileName);

  PVector joint1Pos2d =  get2dCoordsOfJoint(userID, joint1);
  PVector joint2Pos2d =  get2dCoordsOfJoint(userID, joint2);
  
  println(joint1Pos2d);
  println(joint2Pos2d);
  

  float angle = PVector.angleBetween(joint1Pos2d, joint2Pos2d);
  float distance = PVector.dist(joint1Pos2d, joint2Pos2d);
  
   println("angle "+angle+" dis "+distance);
   println(joint1Pos2d.dist(joint1Pos2d, joint2Pos2d));


  imageMode(CENTER);

  pushMatrix();
  translate(joint1Pos2d.x,joint1Pos2d.y);
  rotate(angle);

  //pushMatrix();
  //scale(imgScale);
  //image(img, joint2Pos2d.x,joint2Pos2d.y);
  //popMatrix();

  rect(0, 0, distance+20, 50);

  println("angle "+angle+" dis "+distance);

  popMatrix();

//das war glaube ich doppelt
  //imageMode(CORNER);
}

PVector get2dCoordsOfJoint(int userID, int joint) {
  PVector jointPos = new PVector();
  PVector jointPos2d = new PVector();

  context.getJointPositionSkeleton(userID,joint,jointPos);
  context.convertRealWorldToProjective(jointPos, jointPos2d);

  return jointPos2d;
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
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

  context.startPoseDetection("Psi",userId);
}

void onLostUser(int userId)
{
  println("onLostUser - userId: " + userId);
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
                                
