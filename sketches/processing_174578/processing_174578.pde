
 
/*
This code imports everything from SimpleOpenNI library and declares 
a variable of the type SimpleOpenNI named context.
*/
import SimpleOpenNI.*; 
 
SimpleOpenNI  context; 
PImage img;
 
 Joint[] joints = new Joint[5];

 Object object;
 float objectX=0.0;
 float objectY=0.0;
 color objectC=color(0,0,0);
 float scaler;
 
 int sketchState = 0;
 int jp;
 int sp;
 boolean overJoint;
 boolean overSquare;
 boolean overCircle;
 boolean overTri;
/* 
Sets the size of application window and creates a new SimpleOpenNI context, 
that can be used to communicate with the Kinect device.
*/
void setup(){
  //set size of the application window
  size(640, 480); 
 
  //initialize context variable
  context = new SimpleOpenNI(this);
 
  //asks OpenNI to initialize and start receiving depth sensor's data
  context.enableDepth(); 
 
  //asks OpenNI to initialize and start receiving User data
  context.enableUser(); 
 
  //enable mirroring - flips the sensor's data horizontally
  context.setMirror(true); 
  
 joints[0] = new Joint(SimpleOpenNI.SKEL_HEAD, color (0,0,255));
 joints[1] = new Joint(SimpleOpenNI.SKEL_LEFT_HAND, color (0,0,255));
 joints[2] = new Joint(SimpleOpenNI.SKEL_LEFT_FOOT, color (0,0,255));
 joints[3] = new Joint(SimpleOpenNI.SKEL_RIGHT_HAND, color (0,0,255));
 joints[4] = new Joint(SimpleOpenNI.SKEL_RIGHT_FOOT, color (0,0,255));
 //joints[5] = new Joint(SimpleOpenNI.SKEL_NECK, color (0,255,0));
 //joints[6] = new Joint(SimpleOpenNI.SKEL_TORSO, color (0,0,255));
  /*
  lShoulder = new Joint(SimpleOpenNI.SKEL_LEFT_SHOULDER, color (0,0,255));
  lElbow = new Joint(SimpleOpenNI.SKEL_LEFT_ELBOW, color (0,0,255)); 
  rShoulder = new Joint(SimpleOpenNI.SKEL_RIGHT_SHOULDER, color (0,0,255));
  rElbow = new Joint(SimpleOpenNI.SKEL_RIGHT_ELBOW, color (0,0,255));
  lHip = new Joint(SimpleOpenNI.SKEL_LEFT_HIP, color (0,0,255));
  lKnee = new Joint(SimpleOpenNI.SKEL_LEFT_KNEE, color (0,0,255));
  rHip = new Joint(SimpleOpenNI.SKEL_RIGHT_HIP, color (0,0,255));
  rKnee = new Joint(SimpleOpenNI.SKEL_RIGHT_KNEE, color (0,0,255));
   */
  
  object = new Object();
  img=createImage(640,480,RGB);
  img.loadPixels();
}
 
/*
Clears the screen, gets new data from Kinect and draw a depthmap to the 
screen.
*/
void draw(){
  //clears the screen with the black color, this is usually a good idea 
  //to avoid color artefacts from previous draw iterations
  background(255);
  
  //asks kinect to send new data
  context.update();
 
  //retrieves depth image
  PImage depthImage=context.depthImage();
  depthImage.loadPixels();
 
  //get user pixels - array of the same size as depthImage.pixels, that gives information about the users in the depth image
  int[] upix=context.userMap();
 
  //colorize users
  for(int i=0; i < upix.length; i++){
    if(upix[i] > 0){
      //there is a user on that position
      //NOTE: if you need to distinguish between users, check the value of the upix[i]
      img.pixels[i]=depthImage.pixels[i];// color(0,0,255);
    }else{
      //add depth data to the image
     img.pixels[i]=depthImage.pixels[i];
    }
  }
  img.updatePixels();

 
  //draws the depth map data as an image to the screen 
  //at position 0(left),0(top) corner
  image(img,0,0);
  fill(180,0,220);
  rect(15,15,15,15);
  //ellipse(23,47,15,15);
  //triangle(15,75,22,60,30,75);
  fill(0,0,70);
  text("Select a blue dot, and then select the square to link it to that dot.", 120,440);
  text("Press any key to start again.", 220, 460);
  
  //draw significant points of users
  //background(0); //to show only joints
  //get array of IDs of all users present 
  int[] users=context.getUsers();
 
  ellipseMode(CENTER);
 
  //iterate through users
  for(int i=0; i < users.length; i++){
    int uid=users[i];
     
    //draw center of mass of the user (simple mean across position of all user pixels that corresponds to the given user)
    PVector realCoM=new PVector();
    
    //get the CoM in realworld (3D) coordinates
    context.getCoM(uid,realCoM);
    PVector projCoM=new PVector();
    
    //convert realworld coordinates to projective (those that we can use to draw to our canvas)
    context.convertRealWorldToProjective(realCoM, projCoM);
    fill(255,0,0);
    ellipse(projCoM.x,projCoM.y,10,10);
    scaler = (525/projCoM.z);
    //pinned object rect(projCoM.x,projCoM.y, scaler*objSize,scaler*objSize); 
    
    if(context.isTrackingSkeleton(uid)){
   
      //draw joints   
   for (int j=0; j<joints.length; j++){
     joints[j].display(uid);
     }
    }
  }
  
 if(sketchState==2){
     println("state = " + sketchState); 
     if(overSquare=true){
        object.square(joints[jp].useX,joints[jp].useY);
      }
      else if(overCircle=true){
        object.circle(joints[jp].useX,joints[jp].useY);
      }
      else if(overTri=true){
        object.tri(joints[jp].useX,joints[jp].useY);
      }
    }
  }
void mousePressed(){
  overJoint=false; 
  if (sketchState == 0){
  for(int k=0; k<joints.length; k++){
    if (mouseX > (int(joints[k].useX)-5) && mouseX <(int(joints[k].useX)+5) && mouseX !=0){
    if (mouseY > (int(joints[k].useY)-5) && mouseY <(int(joints[k].useY)+5)){
      overJoint=true;
      jp = k;
    }
  }
  }
  }
   if (sketchState ==0 && overJoint==true){
   sketchState = 1;
   println("select a shape");
  }
  
  if(sketchState==1){
    for(int k=0; k<joints.length; k++){
    if (mouseX > (15) && mouseX <(30) && mouseX !=0){
    if (mouseY > (15) && mouseY <(30)){
      //println("yay!");
      overSquare=true;
      sketchState=2;
  }}
  if((mouseX > (23-(15/2)) && mouseX <(23+(15/2)) && mouseX !=0)){
    if ((mouseY > (47-(15/2))) && mouseY <(47+(15/2))){
    overCircle = true;
    sketchState = 2;
  }} 
  if(mouseX > (15) && mouseX <(30) && mouseX !=0){
    if (mouseY > (60) && mouseY <(75)){
      overTri=true;
      sketchState=2;
    }}
  } 
}
}

void keyPressed(){
  sketchState=0;
}

//is called everytime a new user appears
void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  //asks OpenNI to start tracking a skeleton data for this user 
  //NOTE: you cannot request more than 2 skeletons at the same time due to the perfomance limitation
  //      so some user logic is necessary (e.g. only the closest user will have a skeleton)
  curContext.startTrackingSkeleton(userId);
}
 
//is called everytime a user disappears
void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
 
}
 
class Joint {
  //int userId;
  int soniJoint;
  PVector realName;
  PVector projName;
  color myFill;
  float useX;
  float useY;
Joint(int soniJoint_, color myFill_){
  soniJoint = soniJoint_;
  myFill = myFill_;
}

void display(int uid){
      PVector realName=new PVector();
      context.getJointPositionSkeleton(uid,soniJoint,realName);
      PVector projName=new PVector();
      context.convertRealWorldToProjective(realName, projName);
      useX = projName.x;
      useY = projName.y;
      fill(myFill);
      ellipse(useX,useY,10,10);
}
}
class Object{
  int x;
  int y;
  float w;
  int h;
  float diam;
  color fillC;
  
  Object(){
   w=0;
   h=0;
   diam=0;
   fillC = color(180,0,220);
  }
  
  void square(float x, float y){
    w=scaler*200;
    fill(fillC);
    rect(x,y,w,w);
  }
  void circle(float x, float y){
   diam=scaler*200;
   fill(fillC);
   ellipse(x,y,diam,diam);
  }
  void tri(float x, float y){
  fill(fillC);
  triangle(x,y,(x-150),(y-300),(x+150),(y-300));
  }
}



