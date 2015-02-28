
PImage furryBall;
PImage EyeBall;
PImage EyeLid;
PImage LeftEar;
PImage RightEar;
PImage LeftFoot;
PImage RightFoot;
PImage LeftLegBottom; 
PImage LeftLegTop;
PImage RightLegBottom;
PImage RightLegTop;

// Declaring screen width and height
int screenW = 1000;
int screenH = 700;
int xCreatureCenter = screenW/2;
int yCreatureCenter = screenH/2-100;

//Shapes sizes and positions:
//furryBall
int FurryBallWidth = 426;
int FurryBallHeight = 418;
int xToCenterFurryBall = xCreatureCenter-(FurryBallWidth/2);
int yToCenterFurryBall = yCreatureCenter-FurryBallHeight/2;

//eyeBall
int EyeBallWidth = 166;
int EyeBallHeight = 190;
int xToCenterEyeBall = xCreatureCenter-EyeBallWidth/2;
int yToCenterEyeBall = yCreatureCenter-EyeBallHeight/2-FurryBallHeight/6;

//eyeLid
int EyeLidWidth = 104;
int EyeLidHeight = 106;
int xToCenterEyeLid = xCreatureCenter-EyeLidWidth/2;
int yToCenterEyeLid = yCreatureCenter-EyeLidHeight/2-FurryBallHeight/8;

//LeftEar
int LeftEarWidth = 63;
int LeftEarHeight = 99;
int xToPlaceLeftEar = xCreatureCenter-FurryBallWidth/2;
int yToPlaceLeftEar = yToCenterEyeBall-LeftEarHeight/2;

//RightEar
int RightEarWidth = 63;
int RightEarHeight = 99;
int xToPlaceRightEar = (int)(xCreatureCenter+FurryBallWidth/2.8);
int yToPlaceRightEar = (int)(yToCenterEyeBall-LeftEarHeight/1.8);

//LeftLegTop 
int LeftLegTopWidth = 118;
int LeftLegTopHeight = 111;
int xToPlaceLeftLegTop = (int)(xCreatureCenter-FurryBallWidth/2-LeftLegTopWidth/1.5);
int yToPlaceLeftLegTop = yToCenterEyeBall+FurryBallHeight/2;

//LeftLegBottom
int LeftLegBottomWidth = 103;
int LeftLegBottomHeight = 238;
int xToPlaceLeftLegBottom = (int)(xToPlaceLeftLegTop*0.95);
int yToPlaceLeftLegBottom = (int)(yToPlaceLeftLegTop+LeftLegTopHeight/1.5);

//LeftFoot 
int LeftFootWidth = 159;
int LeftFootHeight = 58;
int xToPlaceLeftFoot = xToPlaceLeftLegBottom;
int yToPlaceLeftFoot = yToPlaceLeftLegBottom+LeftLegBottomHeight-LeftFootHeight/3;

//RightLegTop 
int RightLegTopWidth = 118;
int RightLegTopHeight = 111;
int xToPlaceRightLegTop = (int)((xCreatureCenter+FurryBallWidth/2)*0.94);
int yToPlaceRightLegTop = yToCenterEyeBall+FurryBallHeight/2;

//RightLegBottom
int RightLegBottomWidth = 103;
int RightLegBottomHeight = 238;
int xToPlaceRightLegBottom = (int)(xToPlaceRightLegTop*1.05);
int yToPlaceRightLegBottom = (int)(yToPlaceRightLegTop+LeftLegTopHeight/1.2);

//RightFoot 
int RightFootWidth = 159;
int RightFootHeight = 58;
int xToPlaceRightFoot = (int)(xToPlaceRightLegBottom-RightFootWidth/3);
int yToPlaceRightFoot = yToPlaceRightLegBottom+RightLegBottomHeight-RightFootHeight/2;

//Mouth 
int MouthWidth = 84;
int MouthHeight = 82;
int xToPlaceMouth = xCreatureCenter;
int yToPlaceMouth = yCreatureCenter;

void setup() {
  print(xToPlaceLeftLegTop);
  size(screenW,screenH);
  // Loading Images for Joe
  furryBall = loadImage("FurryBall(426-418).png");
  EyeBall = loadImage("EyeBall(166-190).png");
  EyeLid = loadImage("EyeLid(104-106).png");
  LeftEar = loadImage("LeftEar(63-99).png");
  RightEar = loadImage("RightEar(50-111).png");
  LeftFoot = loadImage("LeftFoot(159-58).png");
  RightFoot = loadImage("RightFoot(159-58).png");
  LeftLegBottom = loadImage("LeftLegBottom(103-238).png");
  LeftLegTop = loadImage("LeftLegTop(118-111).png");
  RightLegBottom = loadImage("RightLegBottom(93-231).png");
  RightLegTop = loadImage("RightLegTop(109-118).png");
}

void draw() {
  background(255);
  //Left leg
  float mouseXRotation = map(mouseX, 0 ,screenW, -30,10);
  float mouseYTranslation = map(mouseY, 0 ,screenH, -10,10);
  float mouseYRotation = map(mouseY, 0 ,screenH, -60,60);
  pushMatrix();
    translate (xToPlaceLeftLegTop, yToPlaceLeftLegTop+mouseYTranslation); 
    rotate(radians(mouseXRotation));
      image(LeftLegTop, 0, 0);
      //pushMatrix(); No need for more matrices because of accumulation
        translate (xToPlaceLeftLegTop*0.95-xToPlaceLeftLegTop+25, LeftLegTopHeight/1.5+10); 
        rotate(radians(mouseYRotation));
        image(LeftLegBottom, -17, -10);
        /* The purpose of these ellipse and the one for the right leg, was to help me
           adjust for the specifics of each image of a leg. In a way, the ellipses worked
           as a callibration device to find the right pivots to use and to know by how much
           to move the canvas and the image
        */
        //ellipse(0,0,10,10);
        //pushMatrix();
          translate(0, LeftLegBottomHeight-LeftFootHeight/3);
          float leftFootRotation = map(mouseX, 0, screenW, -8,8);
          rotate(radians(leftFootRotation));
          image(LeftFoot, -17, -mouseY/50-10);
        //popMatrix();
      //popMatrix();
  popMatrix();
  
  //Right leg
  pushMatrix();
    mouseXRotation = map(mouseX, 0 ,screenW, -10,30);
    mouseYTranslation = map(mouseY, 0 ,screenH, -10,10);
    //Dance direction switcher.
    if(mousePressed) mouseYRotation = map(mouseY, 0 ,screenH, 60,-60);
    translate (xToPlaceRightLegTop, yToPlaceRightLegTop+mouseYTranslation-20); 
    rotate(radians(mouseXRotation));
    image(RightLegTop, 0, 0);
    translate (xToPlaceRightLegTop*1.05-xToPlaceRightLegTop+50, LeftLegTopHeight/1.2); 
    //ellipse(0,0,10,10);
    rotate(radians(mouseYRotation));
      image(RightLegBottom, -55,0);
      //translate (-RightFootWidth/3, yToPlaceRightFoot);
      image(RightFoot, -100, RightLegBottomHeight-RightFootHeight/2);
    popMatrix();
  
  float upAndDown = map(mouseY,0,screenH,0,20);
  float leftAndRight = map(mouseY,0,screenW,0,20);
  translate(leftAndRight,upAndDown);
  //Ears
  float EarMovement = map(mouseX, 0, screenW, -3,3);
  image(LeftEar, xToPlaceLeftEar+EarMovement, yToPlaceLeftEar);
  image(RightEar, xToPlaceRightEar-EarMovement, yToPlaceRightEar);
  //Furry Ball
  image(furryBall, xToCenterFurryBall, yToCenterFurryBall);
  //Eye
  image(EyeBall, xToCenterEyeBall, yToCenterEyeBall);
  float eyeLidX = map(mouseX, 0, screenW, 20,-20);
  float eyeLidY = map(mouseY, 0, screenW, -20,30);
  image(EyeLid, xToCenterEyeLid+eyeLidX, yToCenterEyeLid+eyeLidY);
  //Mouth
  stroke(84,39,46);
  fill(189,95,217);
  //fill(177,41,41);
  float mouthH = map(mouseX, 0, screenW, -10,10);
  ellipse(xToPlaceMouth, yToPlaceMouth+FurryBallHeight/5, 80,20+mouthH);
  fill(177,41,41);
  float mouthW = map(mouseX, 0, screenW, -10,10);
  ellipse(xToPlaceMouth, yToPlaceMouth+FurryBallHeight/5, 50+mouthW,5+mouthH);
  
  fill(255,255);
  arc(xToPlaceMouth, yToPlaceMouth+FurryBallHeight/5-((5+mouthH)/2),15,5+mouthH,0,PI);
}

