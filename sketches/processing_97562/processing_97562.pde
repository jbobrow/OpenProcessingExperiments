
//--------------------------------------------------------------\\
//****Sequence Builder version 1.1****\\
//****Written by Andrew Foresman ****\\
//****Last Revised: 27.04.2013****\\
//---------------------------------------------------------------\\
 
 

color backgroundColor = color(119,159,164);//declare color for background

int playerSpeed = 2;
int playerDirection = -1;
int playerWalk = 0;
int playerRun = 0;
int playerX = 250;
int playerY = 250;

int targetState = 0;
 
 
//================== STEP #1: declare animation object(s) as a global variable(s) ===========================\\
 

Animation bearStillLeftAnimation;
Animation bearStillRightAnimation;


Animation bearWalkLeftAnimation;
Animation bearWalkRightAnimation;

Animation targetOnAnimation;
Animation targetOffAnimation;








 
//==========================================================================================================\\
 
 
void setup(){
   
  size(500,500);//WxH
  smooth();//AA
  frameRate(30);//FPS
  imageMode(CENTER);

   
   
 
  //================== STEP #2: initialize animation object(s) ===========================\\
   

  bearStillLeftAnimation= new Animation();
  bearStillRightAnimation= new Animation();


  bearWalkLeftAnimation = new Animation();
  bearWalkRightAnimation = new Animation();
  
  targetOnAnimation = new Animation();
  targetOffAnimation = new Animation();
  





  
  //===================================================================================\\
   
   
   
   
   
 
 
  //================== STEP #3: set animation constructor values (int-maxImages, str-prefix, int-ImgIndex, int-speed, int-xPos, int-yPos)===========================\\


  bearStillLeftAnimation.calculateSequence(12, "bearWalk", 0, 100, 250, 250);
  bearStillRightAnimation.calculateSequence(12, "bearWalkRight", 0, 100, 250, 250);

  
  bearWalkLeftAnimation.calculateSequence(12, "bearWalk",0, 100, 250, 250);
  bearWalkRightAnimation.calculateSequence(12, "bearWalkRight",0, 100, 250, 250);
  
  targetOnAnimation.calculateSequence(25, "target", 0, 100, 375, 250);
  targetOffAnimation.calculateSequence(25, "target", 0, 100, 375, 250);

  






  //=======================================================================================================================\\
   
   
   
     
}//setup
 
 
 
 
void draw(){
  
  
  
  background(backgroundColor); //set background color
  noStroke();
  fill(128);
  rect(0,260,500,250);
  

  
   
  //========================= STEP #4: display the image from arrray based on the current index number====================\\
   

   if(playerX > 311 && playerX < 440){
   
     targetState = 1;
     
   }
   

   
   else{
     
       targetState = 0;
     
       targetOffAnimation.displaySequence(375, 250);
       
   }
   
      if(targetState == 1){
     
       targetOnAnimation.displaySequence(375, 250);
       
   }


     

   
  //character display-------------------------------------------- 
  
  if(playerWalk == 1 && playerDirection == -1){
    
      playerX = playerX - playerSpeed;
      
      bearWalkLeftAnimation.displaySequence(playerX, playerY);
    }
    
  else if(playerWalk == 1 && playerDirection == 1){
    
    playerX = playerX + playerSpeed;
    
    bearWalkRightAnimation.displaySequence(playerX, playerY);

  }

    
   else if(playerWalk == 0 && playerDirection == -1){
 
     bearStillLeftAnimation.displaySequence(playerX, playerY);
  
 }


   else if(playerWalk == 0 && playerDirection == 1){
 
     bearStillRightAnimation.displaySequence(playerX, playerY);
  
 }
 
   if(playerX > 490 || playerX < 10){
     
     playerWalk = 0;
     
   }

   
   //end character display------------------------------------------
   


   


  
  //========================================================================================================================\\
  

   

   
   
   
  //================== STEP #5: increment the index number by 1 so we can move on to the next image in array================\\
   
   
   
  if(playerWalk == 1){

    bearWalkLeftAnimation.nextImage();
    bearWalkRightAnimation.nextImage();


  }

  
   targetOnAnimation.nextImage();

    

   
  //========================================================================================================================\\
   
   

   
}//draw





void keyPressed(){
  
  if(keyCode == LEFT){
    
    playerDirection = -1;
    
    playerWalk = 1; 
    

    
  }
  
    if(keyCode == RIGHT){
      
      playerDirection = 1;
    
      playerWalk = 1; 
    
  }
  
      if(keyCode == DOWN){
      
      playerWalk = 0; 
    
  }
  

}






class Animation{

  PImage [] images; //array for images

  String prefix; //prefix of file name for images
  
  float xPos, yPos;  // X, Y location for Animation

  int maxImages; //total number of images to be added to array
  int imageIndex; //the current array index number
  int startTime, lastTime, speed;

  
   
     
  void calculateSequence(int maxImagesTemp, String prefixTemp, int imageIndexTemp, int speedTemp, int xPosTemp, int yPosTemp){
     
    maxImages  = maxImagesTemp;
    prefix     = prefixTemp;
    imageIndex = imageIndexTemp; 
    speed      = speedTemp;
    xPos       = xPosTemp;
    yPos       = yPosTemp;
    

     
    images = new PImage[maxImages];
    
    final int displayTime = speed;// how long (millis) should each image be displayed for
         
    for (int i = 0; i < images.length; i ++ ) { //loading the images into the array
     
      images[i] = loadImage( prefix + nf(i,2) + ".png" ); //prefix + double padding + file ext
      
    }
    
    lastTime = millis();
   
  }
   
    
   
  void displaySequence(int displayX, int displayY){
    
    image(images[imageIndex], displayX, displayY); //display the image from the array corresponding to the index number
    
         
  }
  
  
  
   
  void nextImage(){
      
     if(millis() - lastTime >= speed){   //if the current millis time - the value in 'lastTime' is greater than or equal to the displayTime  
     
        imageIndex = (imageIndex + 1) % images.length; //increment to the next index number, if at the end of the array start over
        
        lastTime = millis();//'resets' lastTime to current millis
   
     }

  }
   
     
} //class





