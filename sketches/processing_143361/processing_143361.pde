

  //Camera Variables
    float x,y,z;
    float tx,ty,tz;
    float rotX,rotY;
    float mX, mY;
    float frameCounter;
    float xComp, zComp;
    float angle;

  //Movement Variables
    int moveX;
    int moveZ;
    float vY;
    boolean canJump;
    boolean moveUP,moveDOWN,moveLEFT,moveRIGHT;
    
    
    //check input
    int m =0;

//Constants
  int ground = 0;
  int totalBoxes = 100;
  int standHeight = 100;
  int dragMotionConstant = 10;
  int pushMotionConstant = 100;
  int movementSpeed = 50;    //Bigger number = slower
  float sensitivity = 15;      //Bigger number = slower
  int stillBox = 100;        //Center of POV, mouse must be stillBox away from center to move
  float camBuffer = 10;
  int cameraDistance = 1000;  //distance from camera to camera target in lookmode... 8?
  
//Options
  int lookMode = 8;
  int spotLightMode = 4;
  int cameraMode = 1;
  int moveMode = 2;

void setup(){
  size(800,600,P3D);
  noStroke(); 
  //dwa(#EDEDE8);
  
  //Camera Initialization
  
  //default
  x = -28;
  y = height/2;
    y-= standHeight;
  z = -4830;
  tx = width/2;
  ty = height/2;
  tz = 0;
  rotX = 0;
  rotY = 0;
  xComp = tx - x;
  zComp = tz - z;
  angle = 0;
  
  //Movement Initialization
  moveX = 0;
  moveX = 0;
  moveUP = false;
  moveDOWN = false;
  moveLEFT = false;
  moveRIGHT = false;  
  canJump = true;
  vY = 0;
  

  
}


void draw(){
  if(z<-5000)
  z=-5000;
  
  if(z>9700)
  z=9700;
  
    
  
  //println(x,y,z ,mouseX , mouseY ,tx ,ty,tz);
  //update frame
  background(0);
  lights();
  
  
  if(m==1)
  {
    //rotateY(0.5);
 fill(#EAFF0F);
  textSize(50);
  text("menu", x-100, y, z+300); 
  
 // rotateY(0.5);
 
         //the point
    pushMatrix();     
     fill(#FC1919);
     translate(-28,300,4000);
    box(10, 20000, -10);
    popMatrix();   
    //the point
  
  }


 
  if(spotLightMode == 0)
    lights();
  else if(spotLightMode == 1)
    spotLight(255,255,255,x,y-standHeight,z,tx,ty,tz,PI,1);
  else if(spotLightMode == 2)
    spotLight(255,255,255,x,y-standHeight-200,z,x+100,y+100,z,frameCounter/10,1);
  else if(spotLightMode == 3)
    spotLight(255,255,255,width/2,height/2-1000,0,width/2,height/2,0,PI,1);
  else if(spotLightMode == 4)
  {
    pointLight(255,255,255,x,y,z);
  
  }
    
    /*
    for(int i=1;i<=7;i++)
    {
    spotLight(255, 255, 255, -28, 2000, -5500+i*1875, 1, 1, 1, 360, 1);
    }*/
    //-5500 9500s
    

    
  //back wall
 pushMatrix();     
 fill(255);
  translate(-28,300,-5500);
    box(15000, 5000, -100);
    popMatrix();
    //back wall
    
      //fount wall
 pushMatrix();     
 fill(255);
  translate(-28,300,10500);
    box(15000, 5000, -100);
    popMatrix();
    //fount wall
    
    
    //L1
  bookshielf(800,-4000,7,1);
  bookshielf(1000,-4000,7,1);
  bookshielf(1200,-4000,7,1);
  bookshielf(1400,-4000,7,1);
  
  
  bookshielf(800,-3885,7,2);
  bookshielf(1000,-3885,7,2);
  bookshielf(1200,-3885,7,2);
  bookshielf(1400,-3885,7,2);
  //L1
  
  //L2
  bookshielf(800,-3500,7,1);
  bookshielf(1000,-3500,7,1);
  bookshielf(1200,-3500,7,1);
  bookshielf(1400,-3500,7,1);

 
  bookshielf(800,-3385,7,2);
  bookshielf(1000,-3385,7,2);
  bookshielf(1200,-3385,7,2);
  bookshielf(1400,-3385,7,2);
 //L2
 
 //L3
   bookshielf(800,-3000,7,1);
  bookshielf(1000,-3000,7,1);
  bookshielf(1200,-3000,7,1);
  bookshielf(1400,-3000,7,1);
  bookshielf(1600,-3000,7,1);

 
  bookshielf(800,-2885,7,2);
  bookshielf(1000,-2885,7,2);
  bookshielf(1200,-2885,7,2);
  bookshielf(1400,-2885,7,2);
  bookshielf(1600,-2885,7,2);
 //L3
 
  //L4
  bookshielf(600,-2500,7,1);
   bookshielf(800,-2500,7,1);
  bookshielf(1000,-2500,7,1);
  bookshielf(1200,-2500,7,1);
  bookshielf(1400,-2500,7,1);
  bookshielf(1600,-2500,7,1);

 
 bookshielf(600,-2385,7,2);
  bookshielf(800,-2385,7,2);
  bookshielf(1000,-2385,7,2);
  bookshielf(1200,-2385,7,2);
  bookshielf(1400,-2385,7,2);
  bookshielf(1600,-2385,7,2);
    //L4
    
   //L5
  bookshielf(600,-2000,7,1);
   bookshielf(800,-2000,7,1);
  bookshielf(1000,-2000,7,1);
  bookshielf(1200,-2000,7,1);
  bookshielf(1400,-2000,7,1);
  bookshielf(1600,-2000,7,1);

 
 bookshielf(600,-1885,7,2);
  bookshielf(800,-1885,7,2);
  bookshielf(1000,-1885,7,2);
  bookshielf(1200,-1885,7,2);
  bookshielf(1400,-1885,7,2);
  bookshielf(1600,-1885,7,2);
  //L5
  
     //L6
  bookshielf(600,-1500,7,1);
   bookshielf(800,-1500,7,1);
  bookshielf(1000,-1500,7,1);
  bookshielf(1200,-1500,7,1);
  bookshielf(1400,-1500,7,1);
  bookshielf(1600,-1500,7,1);

 
 bookshielf(600,-1385,7,2);
  bookshielf(800,-1385,7,2);
  bookshielf(1000,-1385,7,2);
  bookshielf(1200,-1385,7,2);
  bookshielf(1400,-1385,7,2);
  bookshielf(1600,-1385,7,2);
  //L6
  
       //L7
  bookshielf(600,-1000,7,1);
   bookshielf(800,-1000,7,1);
  bookshielf(1000,-1000,7,1);
  bookshielf(1200,-1000,7,1);
  bookshielf(1400,-1000,7,1);
  bookshielf(1600,-1000,7,1);

 bookshielf(600,-885,7,2);
  bookshielf(800,-885,7,2);
  bookshielf(1000,-885,7,2);
  bookshielf(1200,-885,7,2);
  bookshielf(1400,-885,7,2);
  bookshielf(1600,-885,7,2);
  bookshielf(1600,-885,7,2);
  //L7
  
    //L8 
   bookshielf(800,-500,7,1);
  bookshielf(1000,-500,7,1);
  bookshielf(1200,-500,7,1);
  bookshielf(1400,-500,7,1);
  bookshielf(1600,-500,7,1);

 
  bookshielf(800,-385,7,2);
  bookshielf(1000,-385,7,2);
  bookshielf(1200,-385,7,2);
  bookshielf(1400,-385,7,2);
  bookshielf(1600,-385,7,2);
  bookshielf(1600,-385,7,2);
  //L8
  
   //L9 
   bookshielf(800,0,7,1);
  bookshielf(1000,0,7,1);
  bookshielf(1200,0,7,1);
  bookshielf(1400,0,7,1);
  bookshielf(1600,0,7,1);

 
  bookshielf(800,115,7,2);
  bookshielf(1000,115,7,2);
  bookshielf(1200,115,7,2);
  bookshielf(1400,115,7,2);
  bookshielf(1600,115,7,2);
  bookshielf(1600,115,7,2);
  //L9
  
     //L10 
  bookshielf(600,500,7,1);
  bookshielf(800,500,7,1);
  bookshielf(1000,500,7,1);
  bookshielf(1200,500,7,1);
  bookshielf(1400,500,7,1);
  bookshielf(1600,500,7,1);

  bookshielf(600,615,7,2);
  bookshielf(800,615,7,2);
  bookshielf(1000,615,7,2);
  bookshielf(1200,615,7,2);
  bookshielf(1400,615,7,2);
  bookshielf(1600,615,7,2);
  bookshielf(1600,615,7,2);
  //L10
  /*
     //L11 
  bookshielf(600,1000,7,1);
  bookshielf(800,1000,7,1);
  bookshielf(1000,1000,7,1);
  bookshielf(1200,1000,7,1);
  bookshielf(1400,1000,7,1);
  bookshielf(1600,1000,7,1);

  bookshielf(600,1115,7,2);
  bookshielf(800,1115,7,2);
  bookshielf(1000,1115,7,2);
  bookshielf(1200,1115,7,2);
  bookshielf(1400,1115,7,2);
  bookshielf(1600,1115,7,2);
  bookshielf(1600,1115,7,2);
  //L11

     //L12
  bookshielf(600,1500,7,1);
  bookshielf(800,1500,7,1);
  bookshielf(1000,1500,7,1);
  bookshielf(1200,1500,7,1);
  bookshielf(1400,1500,7,1);
  bookshielf(1600,1500,7,1);

  bookshielf(600,1615,7,2);
  bookshielf(800,1615,7,2);
  bookshielf(1000,1615,7,2);
  bookshielf(1200,1615,7,2);
  bookshielf(1400,1615,7,2);
  bookshielf(1600,1615,7,2);
  bookshielf(1600,1615,7,2);
  //L12
  
     //L13
  bookshielf(600,2000,7,1);
  bookshielf(800,2000,7,1);
  bookshielf(1000,2000,7,1);
  bookshielf(1200,2000,7,1);
  bookshielf(1400,2000,7,1);
  bookshielf(1600,2000,7,1);

  bookshielf(600,2115,7,2);
  bookshielf(800,2115,7,2);
  bookshielf(1000,2115,7,2);
  bookshielf(1200,2115,7,2);
  bookshielf(1400,2115,7,2);
  bookshielf(1600,2115,7,2);
  bookshielf(1600,2115,7,2);
  //L13
  
     //L14
  bookshielf(800,2500,7,1);
  bookshielf(1000,2500,7,1);
  bookshielf(1200,2500,7,1);
  bookshielf(1400,2500,7,1);
  bookshielf(1600,2500,7,1);

  bookshielf(800,2615,7,2);
  bookshielf(1000,2615,7,2);
  bookshielf(1200,2615,7,2);
  bookshielf(1400,2615,7,2);
  bookshielf(1600,2615,7,2);
  bookshielf(1600,2615,7,2);
  //L14
  
     //L15
  bookshielf(600,3000,7,1);
  bookshielf(800,3000,7,1);
  bookshielf(1000,3000,7,1);
  bookshielf(1200,3000,7,1);
  bookshielf(1400,3000,7,1);
  bookshielf(1600,3000,7,1);

  bookshielf(600,3115,7,2);
  bookshielf(800,3115,7,2);
  bookshielf(1000,3115,7,2);
  bookshielf(1200,3115,7,2);
  bookshielf(1400,3115,7,2);
  bookshielf(1600,3115,7,2);
  bookshielf(1600,3115,7,2);
  //L15
  
   //L16
  bookshielf(600,3500,7,1);
  bookshielf(800,3500,7,1);
  bookshielf(1000,3500,7,1);
  bookshielf(1200,3500,7,1);
  bookshielf(1400,3500,7,1);
  bookshielf(1600,3500,7,1);

  bookshielf(600,3615,7,2);
  bookshielf(800,3615,7,2);
  bookshielf(1000,3615,7,2);
  bookshielf(1200,3615,7,2);
  bookshielf(1400,3615,7,2);
  bookshielf(1600,3615,7,2);
  bookshielf(1600,3615,7,2);
  //L16
  
     //L17
  bookshielf(600,4000,7,1);
  bookshielf(800,4000,7,1);
  bookshielf(1000,4000,7,1);
  bookshielf(1200,4000,7,1);
  bookshielf(1400,4000,7,1);
  bookshielf(1600,4000,7,1);

  bookshielf(600,4115,7,2);
  bookshielf(800,4115,7,2);
  bookshielf(1000,4115,7,2);
  bookshielf(1200,4115,7,2);
  bookshielf(1400,4115,7,2);
  bookshielf(1600,4115,7,2);
  bookshielf(1600,4115,7,2);
  //L17
  
   //L18
  bookshielf(600,4500,7,1);
  bookshielf(800,4500,7,1);
  bookshielf(1000,4500,7,1);
  bookshielf(1200,4500,7,1);
  bookshielf(1400,4500,7,1);
  bookshielf(1600,4500,7,1);

  bookshielf(600,4615,7,2);
  bookshielf(800,4615,7,2);
  bookshielf(1000,4615,7,2);
  bookshielf(1200,4615,7,2);
  bookshielf(1400,4615,7,2);
  bookshielf(1600,4615,7,2);
  bookshielf(1600,4615,7,2);
  //L18
  
    //L19
  bookshielf(600,5000,7,1);
  bookshielf(800,5000,7,1);
  bookshielf(1000,5000,7,1);
  bookshielf(1200,5000,7,1);
  bookshielf(1400,5000,7,1);
  bookshielf(1600,5000,7,1);

  bookshielf(600,5115,7,2);
  bookshielf(800,5115,7,2);
  bookshielf(1000,5115,7,2);
  bookshielf(1200,5115,7,2);
  bookshielf(1400,5115,7,2);
  bookshielf(1600,5115,7,2);
  bookshielf(1600,5115,7,2);
  //L19
  
  //journal left
  
  for(int i=1;i<=20;i++)
  {
   pushMatrix();  
fill(#D1D38D);   
  translate(950,100,6000+i*150);
    box(1000, 800, -140);
    popMatrix();
  }
  
  fill(#FA1E1E);
  stroke(#FA1E1E);
  strokeWeight(10);
  line(1450,300,6090,1450,300,5600);
  line(450,300,6090,450,300,5600);
  line(1450,300,5600,450,300,5600);
  
  //journal left
  
  noStroke();
  
      //L20


  bookshielf(600,9800,7,1);
  bookshielf(800,9800,7,1);
  bookshielf(1000,9800,7,1);
  bookshielf(1200,9800,7,1);
  bookshielf(1400,9800,7,1);
  bookshielf(1600,9800,7,1);
  bookshielf(1600,9800,7,1);
  //L20
  
  //R1
  bookshielf(-400,-4000,7,1);
  bookshielf(-600,-4000,7,1);
  bookshielf(-800,-4000,7,1);
  bookshielf(-1000,-4000,7,1);
  bookshielf(-1200,-4000,7,1);
  bookshielf(-1400,-4000,7,1);
  bookshielf(-1600,-4000,7,1);
  bookshielf(-1800,-4000,7,1);
  
  bookshielf(-400,-3885,7,2);
  bookshielf(-600,-3885,7,2);
  bookshielf(-800,-3885,7,2);
  bookshielf(-1000,-3885,7,2);
  bookshielf(-1200,-3885,7,2);
  bookshielf(-1400,-3885,7,2);
  bookshielf(-1600,-3885,7,2);
  bookshielf(-1800,-3885,7,2);
  //R1
  
    //R2 
  bookshielf(-600,-3500,7,1);
  bookshielf(-800,-3500,7,1);
  bookshielf(-1000,-3500,7,1);
  bookshielf(-1200,-3500,7,1);
  bookshielf(-1400,-3500,7,1);
  bookshielf(-1600,-3500,7,1);
 
  bookshielf(-600,-3385,7,2);
  bookshielf(-800,-3385,7,2);
  bookshielf(-1000,-3385,7,2);
  bookshielf(-1200,-3385,7,2);
  bookshielf(-1400,-3385,7,2);
  bookshielf(-1600,-3385,7,2);
  //R2
  
    //R3
  bookshielf(-200,-3000,7,1);
  bookshielf(-400,-3000,7,1);
  bookshielf(-600,-3000,7,1);
  bookshielf(-800,-3000,7,1);
  bookshielf(-1000,-3000,7,1);
  bookshielf(-1200,-3000,7,1);
  bookshielf(-1400,-3000,7,1);
  bookshielf(-1600,-3000,7,1);
  bookshielf(-1800,-3000,7,1);
  
  bookshielf(-200,-2885,7,2);
  bookshielf(-400,-2885,7,2);
  bookshielf(-600,-2885,7,2);
  bookshielf(-800,-2885,7,2);
  bookshielf(-1000,-2885,7,2);
  bookshielf(-1200,-2885,7,2);
  bookshielf(-1400,-2885,7,2);
  bookshielf(-1600,-2885,7,2);
  bookshielf(-1800,-2885,7,2);
  //R3
  
   //R4
  bookshielf(-200,-2500,7,1);
  bookshielf(-400,-2500,7,1);
  bookshielf(-600,-2500,7,1);
  bookshielf(-800,-2500,7,1);
  bookshielf(-1000,-2500,7,1);
  bookshielf(-1200,-2500,7,1);
  bookshielf(-1400,-2500,7,1);
  bookshielf(-1600,-2500,7,1);
  bookshielf(-1800,-2500,7,1);
  
  bookshielf(-200,-2385,7,2);
  bookshielf(-400,-2385,7,2);
  bookshielf(-600,-2385,7,2);
  bookshielf(-800,-2385,7,2);
  bookshielf(-1000,-2385,7,2);
  bookshielf(-1200,-2385,7,2);
  bookshielf(-1400,-2385,7,2);
  bookshielf(-1600,-2385,7,2);
  bookshielf(-1800,-2385,7,2);
  //R4
  
     //R5
  bookshielf(-200,-2000,7,1);
  bookshielf(-400,-2000,7,1);
  bookshielf(-600,-2000,7,1);
  bookshielf(-800,-2000,7,1);
  bookshielf(-1000,-2000,7,1);
  bookshielf(-1200,-2000,7,1);
  bookshielf(-1400,-2000,7,1);
  bookshielf(-1600,-2000,7,1);
  bookshielf(-1800,-2000,7,1);
  
  bookshielf(-200,-1885,7,2);
  bookshielf(-400,-1885,7,2);
  bookshielf(-600,-1885,7,2);
  bookshielf(-800,-1885,7,2);
  bookshielf(-1000,-1885,7,2);
  bookshielf(-1200,-1885,7,2);
  bookshielf(-1400,-1885,7,2);
  bookshielf(-1600,-1885,7,2);
  bookshielf(-1800,-1885,7,2);
  //R5
  
       //R6
  bookshielf(-200,-1500,7,1);
  bookshielf(-400,-1500,7,1);
  bookshielf(-600,-1500,7,1);
  bookshielf(-800,-1500,7,1);
  bookshielf(-1000,-1500,7,1);
  bookshielf(-1200,-1500,7,1);
  bookshielf(-1400,-1500,7,1);
  bookshielf(-1600,-1500,7,1);
  bookshielf(-1800,-1500,7,1);
  
  bookshielf(-200,-1385,7,2);
  bookshielf(-400,-1385,7,2);
  bookshielf(-600,-1385,7,2);
  bookshielf(-800,-1385,7,2);
  bookshielf(-1000,-1385,7,2);
  bookshielf(-1200,-1385,7,2);
  bookshielf(-1400,-1385,7,2);
  bookshielf(-1600,-1385,7,2);
  bookshielf(-1800,-1385,7,2);
  //R6
  
         //R7
  bookshielf(-200,-1000,7,1);
  bookshielf(-400,-1000,7,1);
  bookshielf(-600,-1000,7,1);
  bookshielf(-800,-1000,7,1);
  bookshielf(-1000,-1000,7,1);
  bookshielf(-1200,-1000,7,1);
  bookshielf(-1400,-1000,7,1);
  bookshielf(-1600,-1000,7,1);
  bookshielf(-1800,-1000,7,1);
  
  bookshielf(-200,-885,7,2);
  bookshielf(-400,-885,7,2);
  bookshielf(-600,-885,7,2);
  bookshielf(-800,-885,7,2);
  bookshielf(-1000,-885,7,2);
  bookshielf(-1200,-885,7,2);
  bookshielf(-1400,-885,7,2);
  bookshielf(-1600,-885,7,2);
  bookshielf(-1800,-885,7,2);
  //R7
  
           //R8
  
  bookshielf(-600,-500,7,1);
  bookshielf(-800,-500,7,1);
  bookshielf(-1000,-500,7,1);
  bookshielf(-1200,-500,7,1);
  bookshielf(-1400,-500,7,1);
  bookshielf(-1600,-500,7,1);
  
  bookshielf(-600,-385,7,2);
  bookshielf(-800,-385,7,2);
  bookshielf(-1000,-385,7,2);
  bookshielf(-1200,-385,7,2);
  bookshielf(-1400,-385,7,2);
  bookshielf(-1600,-385,7,2);
  //R8
  
           //R9
  bookshielf(-200,0,7,1);
  bookshielf(-400,0,7,1);
  bookshielf(-600,0,7,1);
  bookshielf(-800,0,7,1);
  bookshielf(-1000,0,7,1);
  bookshielf(-1200,0,7,1);
  bookshielf(-1400,0,7,1);
  bookshielf(-1600,0,7,1);
  bookshielf(-1800,0,7,1);
  
  bookshielf(-200,115,7,2);
  bookshielf(-400,115,7,2);
  bookshielf(-600,115,7,2);
  bookshielf(-800,115,7,2);
  bookshielf(-1000,115,7,2);
  bookshielf(-1200,115,7,2);
  bookshielf(-1400,115,7,2);
  bookshielf(-1600,115,7,2);
  bookshielf(-1800,115,7,2);
  //R9
  
             //R10
  bookshielf(-200,500,7,1);
  bookshielf(-400,500,7,1);
  bookshielf(-600,500,7,1);
  bookshielf(-800,500,7,1);
  bookshielf(-1000,500,7,1);
  bookshielf(-1200,500,7,1);
  bookshielf(-1400,500,7,1);
  bookshielf(-1600,500,7,1);
  bookshielf(-1800,500,7,1);
  
  bookshielf(-200,615,7,2);
  bookshielf(-400,615,7,2);
  bookshielf(-600,615,7,2);
  bookshielf(-800,615,7,2);
  bookshielf(-1000,615,7,2);
  bookshielf(-1200,615,7,2);
  bookshielf(-1400,615,7,2);
  bookshielf(-1600,615,7,2);
  bookshielf(-1800,615,7,2);
  //R10
  
             //R11
  bookshielf(-200,1000,7,1);
  bookshielf(-400,1000,7,1);
  bookshielf(-600,1000,7,1);
  bookshielf(-800,1000,7,1);
  bookshielf(-1000,1000,7,1);
  bookshielf(-1200,1000,7,1);
  bookshielf(-1400,1000,7,1);
  bookshielf(-1600,1000,7,1);
  bookshielf(-1800,1000,7,1);
  
  bookshielf(-200,1115,7,2);
  bookshielf(-400,1115,7,2);
  bookshielf(-600,1115,7,2);
  bookshielf(-800,1115,7,2);
  bookshielf(-1000,1115,7,2);
  bookshielf(-1200,1115,7,2);
  bookshielf(-1400,1115,7,2);
  bookshielf(-1600,1115,7,2);
  bookshielf(-1800,1115,7,2);
  //R11
  
       //R12
  bookshielf(-200,1500,7,1);
  bookshielf(-400,1500,7,1);
  bookshielf(-600,1500,7,1);
  bookshielf(-800,1500,7,1);
  bookshielf(-1000,1500,7,1);
  bookshielf(-1200,1500,7,1);
  bookshielf(-1400,1500,7,1);
  bookshielf(-1600,1500,7,1);
  bookshielf(-1800,1500,7,1);
  
  bookshielf(-200,1615,7,2);
  bookshielf(-400,1615,7,2);
  bookshielf(-600,1615,7,2);
  bookshielf(-800,1615,7,2);
  bookshielf(-1000,1615,7,2);
  bookshielf(-1200,1615,7,2);
  bookshielf(-1400,1615,7,2);
  bookshielf(-1600,1615,7,2);
  bookshielf(-1800,1615,7,2);
  //R12
  
         //R13
  bookshielf(-200,2000,7,1);
  bookshielf(-400,2000,7,1);
  bookshielf(-600,2000,7,1);
  bookshielf(-800,2000,7,1);
  bookshielf(-1000,2000,7,1);
  bookshielf(-1200,2000,7,1);
  bookshielf(-1400,2000,7,1);
  bookshielf(-1600,2000,7,1);
  bookshielf(-1800,2000,7,1);
  
  bookshielf(-200,2115,7,2);
  bookshielf(-400,2115,7,2);
  bookshielf(-600,2115,7,2);
  bookshielf(-800,2115,7,2);
  bookshielf(-1000,2115,7,2);
  bookshielf(-1200,2115,7,2);
  bookshielf(-1400,2115,7,2);
  bookshielf(-1600,2115,7,2);
  bookshielf(-1800,2115,7,2);
  //R13
  
 //R14
  
  bookshielf(-600,2500,7,1);
  bookshielf(-800,2500,7,1);
  bookshielf(-1000,2500,7,1);
  bookshielf(-1200,2500,7,1);
  bookshielf(-1400,2500,7,1);
  bookshielf(-1600,2500,7,1);

  bookshielf(-600,2615,7,2);
  bookshielf(-800,2615,7,2);
  bookshielf(-1000,2615,7,2);
  bookshielf(-1200,2615,7,2);
  bookshielf(-1400,2615,7,2);
  bookshielf(-1600,2615,7,2);
  //R14
  
         //R15
  bookshielf(-200,3000,7,1);
  bookshielf(-400,3000,7,1);
  bookshielf(-600,3000,7,1);
  bookshielf(-800,3000,7,1);
  bookshielf(-1000,3000,7,1);
  bookshielf(-1200,3000,7,1);
  bookshielf(-1400,3000,7,1);
  bookshielf(-1600,3000,7,1);
  bookshielf(-1800,3000,7,1);
  
  bookshielf(-200,3115,7,2);
  bookshielf(-400,3115,7,2);
  bookshielf(-600,3115,7,2);
  bookshielf(-800,3115,7,2);
  bookshielf(-1000,3115,7,2);
  bookshielf(-1200,3115,7,2);
  bookshielf(-1400,3115,7,2);
  bookshielf(-1600,3115,7,2);
  bookshielf(-1800,3115,7,2);
  //R15
  
         //R16
  bookshielf(-200,3500,7,1);
  bookshielf(-400,3500,7,1);
  bookshielf(-600,3500,7,1);
  bookshielf(-800,3500,7,1);
  bookshielf(-1000,3500,7,1);
  bookshielf(-1200,3500,7,1);
  bookshielf(-1400,3500,7,1);
  bookshielf(-1600,3500,7,1);
  bookshielf(-1800,3500,7,1);
  
  bookshielf(-200,3615,7,2);
  bookshielf(-400,3615,7,2);
  bookshielf(-600,3615,7,2);
  bookshielf(-800,3615,7,2);
  bookshielf(-1000,3615,7,2);
  bookshielf(-1200,3615,7,2);
  bookshielf(-1400,3615,7,2);
  bookshielf(-1600,3615,7,2);
  bookshielf(-1800,3615,7,2);
  //R16
  
      //R17
  bookshielf(-200,4000,7,1);
  bookshielf(-400,4000,7,1);
  bookshielf(-600,4000,7,1);
  bookshielf(-800,4000,7,1);
  bookshielf(-1000,4000,7,1);
  bookshielf(-1200,4000,7,1);
  bookshielf(-1400,4000,7,1);
  bookshielf(-1600,4000,7,1);
  bookshielf(-1800,4000,7,1);
  
  bookshielf(-200,4115,7,2);
  bookshielf(-400,4115,7,2);
  bookshielf(-600,4115,7,2);
  bookshielf(-800,4115,7,2);
  bookshielf(-1000,4115,7,2);
  bookshielf(-1200,4115,7,2);
  bookshielf(-1400,4115,7,2);
  bookshielf(-1600,4115,7,2);
  bookshielf(-1800,4115,7,2);
  //R17
  
        //R18
  bookshielf(-200,4500,7,1);
  bookshielf(-400,4500,7,1);
  bookshielf(-600,4500,7,1);
  bookshielf(-800,4500,7,1);
  bookshielf(-1000,4500,7,1);
  bookshielf(-1200,4500,7,1);
  bookshielf(-1400,4500,7,1);
  bookshielf(-1600,4500,7,1);
  bookshielf(-1800,4500,7,1);
  
  bookshielf(-200,4615,7,2);
  bookshielf(-400,4615,7,2);
  bookshielf(-600,4615,7,2);
  bookshielf(-800,4615,7,2);
  bookshielf(-1000,4615,7,2);
  bookshielf(-1200,4615,7,2);
  bookshielf(-1400,4615,7,2);
  bookshielf(-1600,4615,7,2);
  bookshielf(-1800,4615,7,2);
  //R18
  
   //R19
  
  bookshielf(-600,5000,7,1);
  bookshielf(-800,5000,7,1);
  bookshielf(-1000,5000,7,1);
  bookshielf(-1200,5000,7,1);
  bookshielf(-1400,5000,7,1);
  bookshielf(-1600,5000,7,1);

  bookshielf(-600,5115,7,2);
  bookshielf(-800,5115,7,2);
  bookshielf(-1000,5115,7,2);
  bookshielf(-1200,5115,7,2);
  bookshielf(-1400,5115,7,2);
  bookshielf(-1600,5115,7,2);
  //R19
  
     //R20
   bookshielf(-400,5500,7,1);
  bookshielf(-600,5500,7,1);
  bookshielf(-800,5500,7,1);
  bookshielf(-1000,5500,7,1);
  bookshielf(-1200,5500,7,1);
  bookshielf(-1400,5500,7,1);
  bookshielf(-1600,5500,7,1);

 bookshielf(-400,5615,7,2);
  bookshielf(-600,5615,7,2);
  bookshielf(-800,5615,7,2);
  bookshielf(-1000,5615,7,2);
  bookshielf(-1200,5615,7,2);
  bookshielf(-1400,5615,7,2);
  bookshielf(-1600,5615,7,2);
  //R20
  
        //R21
  bookshielf(-200,6000,7,1);
  bookshielf(-400,6000,7,1);
  bookshielf(-600,6000,7,1);
  bookshielf(-800,6000,7,1);
  bookshielf(-1000,6000,7,1);
  bookshielf(-1200,6000,7,1);
  bookshielf(-1400,6000,7,1);
  bookshielf(-1600,6000,7,1);
  bookshielf(-1800,6000,7,1);
  
  bookshielf(-200,6115,7,2);
  bookshielf(-400,6115,7,2);
  bookshielf(-600,6115,7,2);
  bookshielf(-800,6115,7,2);
  bookshielf(-1000,6115,7,2);
  bookshielf(-1200,6115,7,2);
  bookshielf(-1400,6115,7,2);
  bookshielf(-1600,6115,7,2);
  bookshielf(-1800,6115,7,2);
  //R21
  
      //R22
  bookshielf(-200,6500,7,1);
  bookshielf(-400,6500,7,1);
  bookshielf(-600,6500,7,1);
  bookshielf(-800,6500,7,1);
  bookshielf(-1000,6500,7,1);
  bookshielf(-1200,6500,7,1);
  bookshielf(-1400,6500,7,1);
  bookshielf(-1600,6500,7,1);
  bookshielf(-1800,6500,7,1);
  
  bookshielf(-200,6615,7,2);
  bookshielf(-400,6615,7,2);
  bookshielf(-600,6615,7,2);
  bookshielf(-800,6615,7,2);
  bookshielf(-1000,6615,7,2);
  bookshielf(-1200,6615,7,2);
  bookshielf(-1400,6615,7,2);
  bookshielf(-1600,6615,7,2);
  bookshielf(-1800,6615,7,2);
  //R22
  
      //R23
  bookshielf(-200,7000,7,1);
  bookshielf(-400,7000,7,1);
  bookshielf(-600,7000,7,1);
  bookshielf(-800,7000,7,1);
  bookshielf(-1000,7000,7,1);
  bookshielf(-1200,7000,7,1);
  bookshielf(-1400,7000,7,1);
  bookshielf(-1600,7000,7,1);
  bookshielf(-1800,7000,7,1);
  
  bookshielf(-200,7115,7,2);
  bookshielf(-400,7115,7,2);
  bookshielf(-600,7115,7,2);
  bookshielf(-800,7115,7,2);
  bookshielf(-1000,7115,7,2);
  bookshielf(-1200,7115,7,2);
  bookshielf(-1400,7115,7,2);
  bookshielf(-1600,7115,7,2);
  bookshielf(-1800,7115,7,2);
  //R23
  
      //R24
  bookshielf(-200,7500,7,1);
  bookshielf(-400,7500,7,1);
  bookshielf(-600,7500,7,1);
  bookshielf(-800,7500,7,1);
  bookshielf(-1000,7500,7,1);
  bookshielf(-1200,7500,7,1);
  bookshielf(-1400,7500,7,1);
  bookshielf(-1600,7500,7,1);
  bookshielf(-1800,7500,7,1);
  
  bookshielf(-200,7615,7,2);
  bookshielf(-400,7615,7,2);
  bookshielf(-600,7615,7,2);
  bookshielf(-800,7615,7,2);
  bookshielf(-1000,7615,7,2);
  bookshielf(-1200,7615,7,2);
  bookshielf(-1400,7615,7,2);
  bookshielf(-1600,7615,7,2);
  bookshielf(-1800,7615,7,2);
  //R24
  
        //R25
  bookshielf(-200,8000,7,1);
  bookshielf(-400,8000,7,1);
  bookshielf(-600,8000,7,1);
  bookshielf(-800,8000,7,1);
  bookshielf(-1000,8000,7,1);
  bookshielf(-1200,8000,7,1);
  bookshielf(-1400,8000,7,1);
  bookshielf(-1600,8000,7,1);
  
  
  bookshielf(-200,8115,7,2);
  bookshielf(-400,8115,7,2);
  bookshielf(-600,8115,7,2);
  bookshielf(-800,8115,7,2);
  bookshielf(-1000,8115,7,2);
  bookshielf(-1200,8115,7,2);
  bookshielf(-1400,8115,7,2);
  bookshielf(-1600,8115,7,2);

  //R25
  
        //R26
  bookshielf(-200,8500,7,1);
  bookshielf(-400,8500,7,1);
  bookshielf(-600,8500,7,1);
  bookshielf(-800,8500,7,1);
  bookshielf(-1000,8500,7,1);
  bookshielf(-1200,8500,7,1);
  bookshielf(-1400,8500,7,1);
  bookshielf(-1600,8500,7,1);
  bookshielf(-1800,8500,7,1);
  
  bookshielf(-200,8615,7,2);
  bookshielf(-400,8615,7,2);
  bookshielf(-600,8615,7,2);
  bookshielf(-800,8615,7,2);
  bookshielf(-1000,8615,7,2);
  bookshielf(-1200,8615,7,2);
  bookshielf(-1400,8615,7,2);
  bookshielf(-1600,8615,7,2);
  bookshielf(-1800,8615,7,2);
  //R26
  
        //R27
  bookshielf(-200,9000,7,1);
  bookshielf(-400,9000,7,1);
  bookshielf(-600,9000,7,1);
  bookshielf(-800,9000,7,1);
  bookshielf(-1000,9000,7,1);
  bookshielf(-1200,9000,7,1);
  bookshielf(-1400,9000,7,1);
  bookshielf(-1600,9000,7,1);
  bookshielf(-1800,9000,7,1);
  
  bookshielf(-200,9115,7,2);
  bookshielf(-400,9115,7,2);
  bookshielf(-600,9115,7,2);
  bookshielf(-800,9115,7,2);
  bookshielf(-1000,9115,7,2);
  bookshielf(-1200,9115,7,2);
  bookshielf(-1400,9115,7,2);
  bookshielf(-1600,9115,7,2);
  bookshielf(-1800,9115,7,2);
  //R27
  
        //R28
  bookshielf(-600,9800,7,1);
  bookshielf(-800,9800,7,1);
  bookshielf(-1000,9800,7,1);
  bookshielf(-1200,9800,7,1);
  bookshielf(-1400,9800,7,1);
  bookshielf(-1600,9800,7,1);
 
  //R28
  
     //Draw Boxes
     pushMatrix();
     translate(0,height/2,0);
     fill(#C7FAD0);
     box(9000,2,20000);  
     noLights();
     popMatrix();
        
    //middle cyliner1
     pushMatrix();
     fill(255);
     translate(-400,height/4,-2900);
     cylinder(150,1500,360);
     popMatrix();
     
     //middle cyliner2
     pushMatrix();
     fill(255);
     translate(-400,height/4,100);
     cylinder(150,1500,360);
     popMatrix();
     
    //middle cyliner3
     pushMatrix();
     fill(255);
     translate(-400,height/4,3100);
     cylinder(150,1500,360);
     popMatrix();
     
   //middle cyliner4
     pushMatrix();
     fill(255);
     translate(-400,height/4,5550);
     cylinder(150,1500,360);
     popMatrix();
     */
     
 cameraUpdate();
  locationUpdate();
  jumpManager(10);


  
  //Camera Mode 1 - Original
  if(cameraMode == 1)
    camera(x,y,z,tx,ty,tz,0,1,0);
  
  //Camera Mode 2 - Matrix'd
  if(cameraMode == 2){
    beginCamera();
      camera();
      translate(x,y,z);
      translate(0,2*-standHeight,0);

      rotateX(rotY/100.0); //This seems to work o.o
      rotateY(-rotX/100.0);
      //rotateX(rotX/100.0);
    endCamera();
  }
  
  frameCounter++;
  
  
  
}


void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
 translate(0,100,-500);
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }
 
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);
 
  vertex(0,   -h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }
 
  endShape();
 
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }
 
  endShape();
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], h/2, z[i]);
  }
 
  endShape();
}

public void bookshielf(int thex ,int thez ,int theheight ,int therotate)
{
  fill(#938056);
  
  if(theheight==7)
  {
    if(therotate==1)
    {
    //left
  pushMatrix();
   translate(thex,0,thez);
    box(20, 500, -100);
    popMatrix();
    
    //right
     pushMatrix();
  translate(thex-200,0,thez);
    box(20, 500, -100);
    popMatrix();
    
    //back
     pushMatrix();     
  translate(thex-100,0,thez+40);
    box(220, 500, -30);
    popMatrix();
    
    //middle side
    for(int i=1;i<7;i++)
    {
     pushMatrix();     
  translate(thex-100,-250+71.5*i,thez-10);
    box(220, 5, -100);
    popMatrix();
    }
    
    //top
      pushMatrix();     
  translate(thex-100,250,thez);
    box(220, 10, -100);
    popMatrix();
    
    //block
      pushMatrix();     
  translate(thex-100,-250,thez);
    box(220, 10, -100);
    popMatrix();
 
  }
  
  if(therotate==2)
  {
     //left
  pushMatrix();
   translate(thex,0,thez);
    box(20, 500, -100);
    popMatrix();
    
    //right
     pushMatrix();
  translate(thex-200,0,thez);
    box(20, 500, -100);
    popMatrix();
    
    //back
     pushMatrix();     
  translate(thex-100,0,thez-40);
    box(220, 500, -30);
    popMatrix();
    
    //middle side
    for(int i=1;i<7;i++)
    {
     pushMatrix();     
  translate(thex-100,-250+71.5*i,thez+10);
    box(220, 5, -100);
    popMatrix();
    }
    
    //top
      pushMatrix();     
  translate(thex-100,250,thez);
    box(220, 10, -100);
    popMatrix();
    
    //block
      pushMatrix();     
  translate(thex-100,-250,thez);
    box(220, 10, -100);
    popMatrix();
    
  }
}
}



public void cameraUpdate(){
  ty=constrain(dragMotionConstant, -100000, 500000);
  //Drag-motion
  if (lookMode == 1){
    if(pmouseX > mouseX)
      tx += dragMotionConstant;
    else if (pmouseX < mouseX)
      tx -= dragMotionConstant; 
    if(pmouseY > mouseY)
      ty -= dragMotionConstant/1.5;
    else if (pmouseY < mouseY)
      ty += dragMotionConstant/1.5;
  }
  
  
  //Push-motion
  else if (lookMode == 2){
    if (mouseX > (width/2+pushMotionConstant))
      tx += dragMotionConstant;
    else if (mouseX < (width/2-pushMotionConstant))
      tx -= dragMotionConstant;
    if (mouseY > (height/2+pushMotionConstant))
      ty += dragMotionConstant;
    else if (mouseY < (height/2-pushMotionConstant))
      ty -= dragMotionConstant;
  }
  
  //Push-motion V2 (Hopefully improved!)
  else if (lookMode == 3){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if (abs(diffX) > pushMotionConstant)
      tx += diffX/25;
    if (abs(diffY) > pushMotionConstant)
      ty += diffY/25;
  }
  
  //Push Motion V3 (For Camera-Mode 2)
  else if (lookMode == 4){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
  //println(diffX);
  if (abs(diffX) > pushMotionConstant)
      rotX += diffX/100;
    if (abs(diffY) > pushMotionConstant)
      rotY += diffY/100;//diffY/100;
  }
  
  //Push Motion V4.1 (Because it crashed and I lost V4.0 T.T
  //Designed to work in cohesion with movement mode 2
  else if (lookMode == 5){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = degrees(atan(xComp/zComp));
      
      //---------DEBUG STUFF GOES HERE----------
      //println("tx:    " + tx);
      //println("tz:    " + tz);
     // println("xC:    " + xComp);
     // println("zC:    " + zComp);
     // println("Angle: " +angle);
      //--------------------------------------*/
      
      if (angle < 45 && angle > -45 && zComp < 0)
        tx += diffX/sensitivity;
      else if (angle < 45 && angle > -45 && zComp > 0)
        tx -= diffX/sensitivity;
        
      //Left Sector
      else if (angle > 45 && angle < 90 && xComp < 0 && zComp < 0)
        tz -= diffX/sensitivity;
      else if (angle >-90 && angle <-45 && xComp < 0 && zComp > 0)
        tz -= diffX/sensitivity;
        
      //Right Sector
      else if (angle <-45 && angle >-90)
        tz += diffX/sensitivity;
      else if (angle < 90 && angle > 45 && xComp > 0 && zComp > 0)
        tz += diffX/sensitivity;
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  //Lookmode 4.2
  //Using a more proper unit circle.
  else if (lookMode == 6){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp,zComp);
        
      //---------DEBUG STUFF GOES HERE----------
     // println("tx:    " + tx);
     // println("tz:    " + tz);
     // println("xC:    " + xComp);
     /// println("zC:    " + zComp);
     /// println("Angle: " +angle);
      //--------------------------------------*/
      
      //Looking 'forwards'
      if ((angle >= 0 && angle < 45) || (angle > 315 && angle < 360))
        tx += diffX/sensitivity;
        
      //Looking 'left'
      else if (angle > 45 && angle < 135)
        tz += diffX/sensitivity;
        
      //Looking 'back'
      else if (angle > 135 && angle < 225)
        tx -= diffX/sensitivity;
        
      //Looking 'right'
      else if (angle > 225 && angle < 315)
        tz -= diffX/sensitivity;
       
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  //Lookmode 7, trying to get rid of the slowdown in the corners with a sorta-buffer thing
  else if (lookMode == 7){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp,zComp);
        
      //---------DEBUG STUFF GOES HERE----------
     // println("tx:    " + tx);
     // println("tz:    " + tz);
     // println("xC:    " + xComp);
     // println("zC:    " + zComp);
     // println("Angle: " +angle);
      //--------------------------------------*/

      //Looking 'forwards'
      if ((angle >= 0-camBuffer && angle < 45+camBuffer) || (angle > 315-camBuffer && angle < 360+camBuffer))
        tx += diffX/sensitivity;
        
      //Looking 'left'
      else if (angle > 45-camBuffer && angle < 135+camBuffer)
        tz += diffX/sensitivity;
        
      //Looking 'back'
      else if (angle > 135-camBuffer && angle < 225+camBuffer)
        tx -= diffX/sensitivity;
        
      //Looking 'right'
      else if (angle > 225-camBuffer && angle < 315+camBuffer)
        tz -= diffX/sensitivity;
       
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  else if (lookMode == 8){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp,zComp);
       
      angle+= diffX/(sensitivity*10);
      
      if(angle < 0)
        angle += 360;
      else if (angle >= 360)
        angle -= 360;
      
      float newXComp = cameraDistance * sin(radians(angle));
      float newZComp = cameraDistance * cos(radians(angle));
      
      tx = newXComp + x;
      tz = -newZComp + z;
    
      //---------DEBUG STUFF GOES HERE----------
      /*println("tx:    " + tx);
      println("tz:    " + tz);
      println("xC:    " + xComp);
      println("NewXC: " + newXComp);
      println("zC:    " + zComp);
      println("NewZC: " + newZComp);
      println("Angle: " +angle);*/
      //--------------------------------------*/
       
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  
}

public void locationUpdate(){
  
  /*Old method==================================
  if(keyPressed){
    if (keyCode == UP || key == 'w'){
      z-=10;
      tz-=10;
    }
    else if (keyCode == DOWN || key == 's'){
      tz+=10;
      z+=10;
    }
    else if (keyCode == LEFT || key == 'a' ){
      tx-=10;
      x-=10;
    }
    else if (keyCode == RIGHT || key == 'd'){
      tx+=10;
      x+=10;
    }
  }
  ============================================*/
  
  //Apply Movement
  if(moveMode == 1){
    z += moveZ;
    tz += moveZ;
    x += moveX;
    tx += moveX;
  }
  else if(moveMode == 2){
    if(moveUP){
      z += zComp/movementSpeed;
      tz+= zComp/movementSpeed;
      x += xComp/movementSpeed;
      tx+= xComp/movementSpeed;
    }
    else if(moveDOWN){
      z -= zComp/movementSpeed;
      tz-= zComp/movementSpeed;
      x -= xComp/movementSpeed;
      tx-= xComp/movementSpeed;
    }
    if (moveRIGHT){
      z += xComp/movementSpeed; 
      tz+= xComp/movementSpeed;
      x -= zComp/movementSpeed;
      tx-= zComp/movementSpeed;
    }
    if (moveLEFT){
      z -= xComp/movementSpeed; 
      tz-= xComp/movementSpeed;
      x += zComp/movementSpeed;
      tx+= zComp/movementSpeed;
    }
       
  }
  //New method also uses keyPressed() and keyReleased()
  // Scroll Down! 
}

public void jumpManager(int magnitude){
  /*
  if(keyPressed && key == ' ' && canJump){
    vY -= magnitude;
    if(vY < -20)
      canJump = false;
  }
  else*/ if (y < ground+standHeight)
    vY ++;
  else if (y >= ground+standHeight){
    vY = 0;
    y = ground + standHeight;
  }
  
  if((!canJump) && (!keyPressed)){
    //println("Jump Reset!");
    canJump = true;
  }
    
  y += vY;
}





public void keyPressed(){
  if(keyCode == UP || key == 'w'){
    moveZ = -10;
    moveUP = true;
  }
  
  else if(keyCode == DOWN || key == 's'){
    moveZ = 10;
    moveDOWN = true;
  }
  
  else if(keyCode == LEFT || key == 'a'){
    moveX = -10;
    moveLEFT = true;
  }
  
  else if(keyCode == RIGHT || key == 'd'){
    moveX = 10;
    moveRIGHT = true;
  }
  
    if(key == 'm' && m==1){
 
    m=0;
  }
  else if(key == 'm' && m==0){
    
    if(key == '1')
    
    {
      
      
    }
    rotateY(180);
     fill(#EAFF0F);
  textSize(50);
  text("menu", x-100, y, z+300); 
    m=1;
    

  }
  

}

public void keyReleased(){
  if(keyCode == UP || key == 'w'){
    moveUP = false;
    moveZ = 0;
  }
  else if(keyCode == DOWN || key == 's'){
    moveDOWN = false;
    moveZ = 0;
  }
    
  else if(keyCode == LEFT || key == 'a'){
    moveLEFT = false;
    moveX = 0;
  }
  
  else if(keyCode == RIGHT || key == 'd'){
    moveRIGHT = false;
    moveX = 0;
  }
  

}

void mousePressed()
{

  
}




public float correctAngle(float xc, float zc){
  float newAngle = -degrees(atan(xc/zc));
  if (xComp > 0 && zComp > 0)
    newAngle = (90 + newAngle)+90;
  else if (xComp < 0 && zComp > 0)
    newAngle = newAngle + 180;
  else if (xComp < 0 && zComp < 0)
    newAngle = (90+ newAngle) + 270;
  return newAngle;
}





