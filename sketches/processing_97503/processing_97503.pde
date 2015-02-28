
//--------------------------------------------------------------\\
//****Sequence Builder version 1.1****\\
//****Written by Andrew Foresman ****\\
//****Last Revised: 25.04.2013****\\
//---------------------------------------------------------------\\
 
 
int timeMillis, timeSecond; //var to hold time in millis
float timeFrame;
color backgroundColor = color(119,159,164);//declare color for background
 
 
//================== STEP #1: declare animation object(s) as a global variable(s) ===========================\\
 
//Animation glowAnimation;
//Animation wallAnimation;
//Animation fireAnimation;
Animation seesawAnimation;
Animation seesawAnimation2;


 
//==========================================================================================================\\
 
 
void setup(){
   
  size(500,500);//WxH
  smooth();//AA
  frameRate(15);//FPS
   
 
  //================== STEP #2: initialize animation object(s) ===========================\\
   
  //glowAnimation = new Animation();
  //wallAnimation = new Animation();
  //fireAnimation = new Animation();
  seesawAnimation = new Animation();
  seesawAnimation2 = new Animation();


 
   
  //===================================================================================\\
   
 
 
  //================== STEP #3: set animation constructor values (int-maxImages, str-prefix, int-xPos, int-yPos)===========================\\
 
  //glowAnimation.calculateSequence(20, "glow", 220, 100);
  //wallAnimation.calculateSequence(69, "wall_animation", 350, 300);
  //fireAnimation.calculateSequence(12, "fire", 200, 100);
  seesawAnimation.calculateSequence(42, "seesaw", 250, 150);
  seesawAnimation2.calculateSequence(42, "seesaw", 250, 250);


 
   
  //=======================================================================================================================\\
   
   
}//setup
 
 
 
 
void draw(){
  
  background(backgroundColor); //set background color
  
  timeMillis = millis(); //sets time equal to current millis
  timeSecond = round(timeMillis * .001);
  //println(timeSecond);
  timeFrame  = (timeMillis * .1);
  //println(timeFrame);
 
  
  // int secCheck = timeMillis % 1000;
   //println(secCheck);
   
  // if(secCheck == 1){println("YAY");}
  
   
  //========================= STEP #4: display the image from the image arrray based on the current index number============\\
   
  //glowAnimation.displaySequence();
  //wallAnimation.displaySequence();
  //fireAnimation.displaySequence();
  seesawAnimation.displaySequence(timeFrame);
  seesawAnimation2.displaySequence(timeFrame);
  
  //========================================================================================================================\\
   
   

   

   
   
   
  //================== STEP #5: increment the index number by 1 so we can move on to the next "frame"=======================\\
   
  //glowAnimation.nextImage();
  //wallAnimation.nextImage();
  //fireAnimation.nextImage();
  seesawAnimation.nextImage(timeFrame);
  seesawAnimation2.nextImage(timeFrame);


 
   
  //========================================================================================================================\\
   
   
}//draw

class Animation{
   
 
   
  float xPos;  // X location for Animation
  float yPos;  // Y location for Animation
   
  String prefix; //prefix of file name for images
   
  int maxImages; //total number of images to be added to array
  int imageIndex; //the current array index number
   
 
  PImage [] images;
     
  Animation(){
     
     
  }
   
   
 
   
   
  void calculateSequence(int maxImagesTemp, String prefixTemp, int xPosTemp, int yPosTemp){
     
    maxImages = maxImagesTemp;
    prefix    = prefixTemp;
    xPos      = xPosTemp;
    yPos      = yPosTemp;
     
    images = new PImage[maxImages];
     
 
     
     
    for (int i = 0; i < images.length; i ++ ) { //loading the images into the array
     
      images[i] = loadImage( prefix + nf(i,2) + ".png" ); //prefix + double padding + file ext
      

     
    }
   
  }
   
   
   
  void displaySequence(float timeFrameTemp){
    
     
       
       //timeA = millis(); //sets time equal to current millis
        //println(timeA); //prints current time 
        
   
    
    imageMode(CENTER);
     
    image(images[imageIndex],xPos,yPos); //display the image from the array corrosponding to the index number
         
  }
   
   
  void nextImage(float timeFrameTemp){
    
   //println(timeFrameTemp);
   
   //float test = timeFrameTemp % 1;
    
   //println(test);
    
   if(timeFrameTemp % 1 > .5){ 
     
     imageIndex = (imageIndex + 1) % images.length; //increment to the next index number, if at the end of the array start over
   
     //println("_+1");   
     //println(imageIndex);
     
   }
     
  }
   
     
} //class



