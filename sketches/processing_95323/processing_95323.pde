
// Aris Bezas, 23 moon fase C Igoumeninja, drawing lines through physics laws and produce sound -->
//Pempti 17 November 2008 Igoumeninja Aris Bezas play with the superformula -->


import SimpleOpenNI.*;

SimpleOpenNI  context;
boolean       autoCalib=true;

int num = 60;//Arithos Sformon se kathe Sforma
int colorL=255, k = 0, j=100, i=200;

float x, y, z;
float r, th=0, step=.1, epi=200;
float m = 1, n1=-1, n2=0, n3=0;
float b=1, a=1;
int counter1=0, counter2=0;


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
  context.setMirror(true);


  size(900, 450);
  background(0);
  frameRate(50);
  smooth();
}

void draw() 
{

  IntVector userList = new IntVector();
  context.getUsers(userList);

  context.update();
  if (userList.size()>0) {
    int userId=userList.get(0);
    if (context.isTrackingSkeleton(userId)) {
      //    drawSkeleton(1);


      PVector leftHand = new PVector();
      PVector leftElbow = new PVector();
      PVector leftShoulder = new PVector();
      context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND, leftHand);
      context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, leftElbow);
      context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, leftShoulder);
      // right elbow above right shoulder
      // AND
      // right elbow right of right shoulder
      //
      if (leftHand.y > leftElbow.y &&
        leftElbow.y > leftShoulder.y) { 
        background(0);
      } 
      else
      {
        image(context.depthImage(), 0, 0, 120, 70);
        PVector myHand=setActiveHand(userId);
        fill(0, 5);
        rect(-5, -5, 1250, 510);
        counter1++;
        if (counter1 == 50) {
          m=int(random(3, 40));
          n1=random(.5);
          n2=random(6.);
          //n3=random(6.);
          epi=random(100, 200);
          step=random(.05, 10);
          counter1 = 0;
        }
        translate(myHand.x, myHand.y);
        stroke(colorL, 35);
        noFill();
        beginShape();
        for (int i=1; i < num; i++) {
          r = epi*pow(((pow(abs(cos(m*th/4)/a), n2))+(pow(abs(sin(m*th/4)/b), n3))), (-1/n1)); 
          th = th + step;
          x = r*cos(th);
          y = r*sin(th);
          curveVertex(x, y);
        }
        endShape();
      }
    }
  }
}

PVector setActiveHand(int userId)
{
  PVector rightHand=new PVector();
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, rightHand);
  PVector convertedRightHand=new PVector();
  context.convertRealWorldToProjective(rightHand, convertedRightHand);
  return convertedRightHand;
}

void mousePressed() {
  background(0);
}


// -----------------------------------------------------------------
// SimpleOpenNI events

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


