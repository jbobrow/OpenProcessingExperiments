
//--------------------------------------------------------------\\
//****Sequence Builder version 1.3****\\
//****Originally Written by Andrew Foresman ****\\
//****Last Revised: 05.05.2013****\\
//---------------------------------------------------------------\\
 
 

color backgroundColor = color(227,214,163);//declare color for background

int player01Speed = 2; //walk speed
int player01Direction = 1; //facing direction 1=right, -1=left
int player01Walk = 0; //is the player walking? 0=no, 1=yes
int player01X = 40; //player X position 
int player01Y = 250;//player Y position

int player02Speed = 4; //walk speed
int player02Direction = 1; //facing direction 1=right, -1=left
int player02Walk = 0; //is the player walking? 0=no, 1=yes
int player02X = 130;
int player02Y = 250;

int targetState = 0;

int selectedPlayer; //identifies which player/character is selected

int beaconX; //x position of the beacon
boolean beaconCheck = false; //has the beacon been placed or not?
 
 
//================== STEP #1: declare animation object(s) as a global variable(s) ===========================\\
 
//character01(blue bear)-----------
Animation bearStillLeftAnimation;
Animation bearStillRightAnimation;

Animation bearRightGlowAnimation;
Animation bearLeftGlowAnimation;

Animation bearWalkLeftAnimation;
Animation bearWalkRightAnimation;
//-----------------------------

//character02(red bear)----------

Animation bearRedStillLeftAnimation;
Animation bearRedStillRightAnimation;

Animation bearRedRightGlowAnimation;
Animation bearRedLeftGlowAnimation;

Animation bearRedWalkLeftAnimation;
Animation bearRedWalkRightAnimation;

//-----------------------------




Animation targetOnAnimation;
Animation targetOffAnimation;








 
//==========================================================================================================\\
 
 
void setup(){
   
  size(500,500);//WxH
  smooth();//AA
  frameRate(30);//FPS
  imageMode(CENTER);

   
   
 
  //================== STEP #2: initialize animation object(s) ===========================\\
   
  //character01(blue bear)-----
  bearStillLeftAnimation= new Animation();
  bearStillRightAnimation= new Animation();

  bearRightGlowAnimation= new Animation();
  bearLeftGlowAnimation= new Animation();

  bearWalkLeftAnimation = new Animation();
  bearWalkRightAnimation = new Animation();
  //--------------------------------
  
  //character02(red bear)------
  
  bearRedStillLeftAnimation= new Animation();
  bearRedStillRightAnimation= new Animation();

  bearRedRightGlowAnimation= new Animation();
  bearRedLeftGlowAnimation= new Animation();

  bearRedWalkLeftAnimation = new Animation();
  bearRedWalkRightAnimation = new Animation();
  //-----------------------------------
  
  
  
  targetOnAnimation = new Animation();
  targetOffAnimation = new Animation();
  


  
  //===================================================================================\\
   
   
   
   
   
 
 
  //================== STEP #3: set animation constructor values (int-maxImages, str-prefix, int-ImgIndex, int-speed, int-xPos, int-yPos)===========================\\

  //character01(blue bear)------
  bearStillLeftAnimation.calculateSequence(12, "bearWalk", 0, 100, 250, 250);
  bearStillRightAnimation.calculateSequence(12, "bearWalkRight", 0, 100, 250, 250);
  
  bearRightGlowAnimation.calculateSequence(3, "bearRightGlow", 0, 100, 250, 250);
  bearLeftGlowAnimation.calculateSequence(3, "bearLeftGlow", 0, 100, 250, 250);

 
  bearWalkLeftAnimation.calculateSequence(12, "bearWalk",0, 100, 250, 250);
  bearWalkRightAnimation.calculateSequence(12, "bearWalkRight",0, 100, 250, 250);
  //------------------------------------
  
  //character02(red bear)-------
  bearRedStillLeftAnimation.calculateSequence(12, "bearRedWalk", 0, 100, 250, 250);
  bearRedStillRightAnimation.calculateSequence(12, "bearRedWalkRight", 0, 100, 250, 250);
  
  bearRedRightGlowAnimation.calculateSequence(3, "bearRedRightGlow", 0, 100, 250, 250);
  bearRedLeftGlowAnimation.calculateSequence(3, "bearRedLeftGlow", 0, 100, 250, 250);

 
  bearRedWalkLeftAnimation.calculateSequence(12, "bearRedWalk",0, 100, 250, 250);
  bearRedWalkRightAnimation.calculateSequence(12, "bearRedWalkRight",0, 100, 250, 250);
  //-------------------
  
  
  targetOnAnimation.calculateSequence(25, "target", 0, 100, 375, 250);
  targetOffAnimation.calculateSequence(25, "target", 0, 100, 375, 250);

  






  //=======================================================================================================================\\
   
   
   
     
}//setup
 
 
 
 
void draw(){
  
  
  
  background(backgroundColor); //set background color
  noStroke();//stroke off
  fill(128);
  rect(0,260,500,250);//ground plane 
  

  
   
  //========================= STEP #4: display the image from arrray based on the current index number====================\\
   




  if(beaconCheck){//checks to see if the beacon has been placed
           
       targetOffAnimation.displaySequence(beaconX, 250); //if so, display beacon
       
   }
       


     

   
  //character display-------------------------------------------- 
  

  if(!beaconCheck){ //if beacon is not on screen
    

   //character 01 not moving -------
     if(player01Direction == 1 && selectedPlayer ==1){ //if the player is facing right (stationary) and selected..
           
           bearRightGlowAnimation.displaySequence(player01X, player01Y); //display 'player selected' animation
           
      }
       
      else if(player01Direction == 1){ //if the player is facing right and not selected
       
           bearStillRightAnimation.displaySequence(player01X, player01Y); //display the player in stationary state
              
       }
       
      if(player01Direction == -1 && selectedPlayer ==1){ //if the player is facing left and is selected
           
           bearLeftGlowAnimation.displaySequence(player01X, player01Y);//dispaly 'player selected' animation
           
         }
         
       else if(player01Direction == -1){ //if the player is facing left and not selected
       
          bearStillLeftAnimation.displaySequence(player01X, player01Y); //display player in station state
              
       }
       //----------------------------------
       
       
       
       
       
       
       
     //character 02 not moving---------------------  
      if(player02Direction == 1 && selectedPlayer == 2){ //if the player is facing right (stationary) and selected..
           
           bearRedRightGlowAnimation.displaySequence(player02X, player02Y); //display 'player selected' animation
           
      }
       
      else if(player02Direction == 1){ //if the player is facing right and not selected
       
           bearRedStillRightAnimation.displaySequence(player02X, player02Y); //display the player in stationary state
              
       }
       
      if(player02Direction == -1 && selectedPlayer == 2){ //if the player is facing left and is selected
           
           bearRedLeftGlowAnimation.displaySequence(player02X, player02Y);//dispaly 'player selected' animation
           
         }
         
       else if(player02Direction == -1){ //if the player is facing left and not selected
       
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y); //display player in station state
              
       }
       //--------------------------------------
       
       
       
       

    
  }

 
 
   if(beaconCheck){ //if the beacon is on screen...
    
    if(selectedPlayer == 1){
    
    //player 01 moving (blue bear)-------------------------------------
    if(player01X < beaconX-5 && selectedPlayer == 1){ //if the player is located to the left of the beacon
    
       if(player02Direction == 1){
         
         bearRedStillRightAnimation.displaySequence(player02X, player02Y); //display the player in stationary state
         
       }
       
       else if(player02Direction == -1){
         
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y); //display player in station state

       }

     
       player01Walk = 1; //turn on player walk

       player01Direction = 1;//set player direction to right
       
       player01X = player01X + player01Speed; //move player pos in X 
    
       bearWalkRightAnimation.displaySequence(player01X, player01Y); //display the right walk cycle animation 
       
     }
     
    else if(player01X > beaconX && selectedPlayer ==1){ //if the player is located to the right of the beacon
    
       if(player02Direction == 1){
         
         bearRedStillRightAnimation.displaySequence(player02X, player02Y); //display the player in stationary state
         
       }
       
       else if(player02Direction == -1){
         
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y); //display player in station state

       }
    
       player01Walk = 1; //turn on player walk
    
       player01Direction = -1; //set player direction to left
       
       player01X = player01X - player01Speed; //move player neg in X
    
       bearWalkLeftAnimation.displaySequence(player01X, player01Y); //display the left walk cycle animation
    
     }
     
     else{// the player has reached the beacon..
     
        if(player02Direction == 1){
         
         bearRedStillRightAnimation.displaySequence(player02X, player02Y); //display the player in stationary state
         
       }
       
       else if(player02Direction == -1){
         
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y); //display player in station state

       }
       
       beaconCheck = false; //turns off beacon
       
       selectedPlayer = 0; //deselects player
       
       if(player01Direction == -1){ //if player is facing left
         
          bearStillLeftAnimation.displaySequence(player01X, player01Y);//display the left facing stationary animation
              
       }
       
        if(player01Direction == 1){//if player is facing right
          
           bearStillRightAnimation.displaySequence(player01X, player01Y);//display the right facing stationary position
              
       }
       
       player01Walk = 0;


     }

     }  
     //--------------------------------------------
     
     
    //player 02 moving (red bear)-------------------------------------
    
    if(selectedPlayer == 2 ){
    
       if(player02X < beaconX-5 && selectedPlayer == 2){ //if the player is located to the left of the beacon
    
           if(player01Direction == 1){
         
             bearStillRightAnimation.displaySequence(player01X, player01Y); //display the player in stationary state
             

         
           }
       
           else if(player01Direction == -1){
         
             bearStillLeftAnimation.displaySequence(player01X, player01Y); //display player in station state
             


           }
     
       player02Walk = 1; //turn on player walk

       player02Direction = 1;//set player direction to right
       
       player02X = player02X + player02Speed; //move player pos in X 
    
       bearRedWalkRightAnimation.displaySequence(player02X, player02Y); //display the right walk cycle animation 
       
     }
     
    else if(player02X > beaconX && selectedPlayer == 2){ //if the player is located to the right of the beacon
    
        if(player01Direction == 1){ //display blue bear while red bear is moving
         
            bearStillRightAnimation.displaySequence(player01X, player01Y); //display the player in stationary state
            

         
         }
       
         else if(player01Direction == -1){
         
            bearStillLeftAnimation.displaySequence(player01X, player01Y); //display player in station state
            


          }
    
       player02Walk = 1; //turn on player walk
    
       player02Direction = -1; //set player direction to left
       
       player02X = player02X - player02Speed; //move player neg in X
    
       bearRedWalkLeftAnimation.displaySequence(player02X, player02Y); //display the left walk cycle animation
    
     }
     
     else if(player02X > beaconX - 10 && player02X < beaconX + 10){// the player has reached the beacon..
     
        if(player01Direction == 1){
         
           bearStillRightAnimation.displaySequence(player01X, player01Y); //display the player in stationary state
           
        }
       
         else if(player01Direction == -1){
         
            bearStillLeftAnimation.displaySequence(player01X, player01Y); //display player in station state
            


          }
       
       beaconCheck = false; //turns off beacon
       
       selectedPlayer = 0; //deselects player
       
       if(player02Direction == -1){ //if player is facing left
         
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y);//display the left facing stationary animation
              
       }
       
        if(player02Direction == 1){//if player is facing right
          
           bearRedStillRightAnimation.displaySequence(player02X, player02Y);//display the right facing stationary position
              
       }
       
        player02Walk = 0;


     }  
     
     }
     //--------------------------------------------
     
     
     
     
     
   }
     
     

     
     
 

 


   
   //end character display------------------------------------------
   


   


  
  //========================================================================================================================\\
  

   

   
   
   
  //================== STEP #5: increment the index number by 1 so we can move on to the next image in array================\\
   
  if(player01Walk == 0 && player01Direction == 1 && selectedPlayer == 1){ //if the player is not walking, facing right, and is selected
    
    bearRightGlowAnimation.nextImage(); //increment the player selected animation 
    
  }
  else if(player01Walk == 0 && player01Direction == -1 && selectedPlayer == 1){ //if the player is not walking, facing right, and is selected
    
    bearLeftGlowAnimation.nextImage(); //increment the player selected animation
    
  }
   
  if(player01Walk == 1){ //if the player is walking

    bearWalkLeftAnimation.nextImage();//increment the left walk cycle animation
    bearWalkRightAnimation.nextImage();//increment the right walk cycle animation


  }
  
  
  
  
  
    if(player02Walk == 0 && player02Direction == 1 && selectedPlayer == 2){ //if the player is not walking, facing right, and is selected
    
    bearRedRightGlowAnimation.nextImage(); //increment the player selected animation 
    
  }
  else if(player02Walk == 0 && player02Direction == -1 && selectedPlayer == 2){ //if the player is not walking, facing right, and is selected
    
    bearRedLeftGlowAnimation.nextImage(); //increment the player selected animation
    
  }
   
  if(player02Walk == 1){ //if the player is walking

    bearRedWalkLeftAnimation.nextImage();//increment the left walk cycle animation
    bearRedWalkRightAnimation.nextImage();//increment the right walk cycle animation


  }

  

    

   
  //========================================================================================================================\\
   
   

   
}//draw




void mousePressed(){
  
    if(mouseButton == LEFT && player01Walk == 0 && player02Walk == 0 && mouseX > player01X - 10 && mouseX < player01X + 10  && mouseY > player01Y - 15 && mouseY < player01Y + 15){ //checks to see if LBM is selecting player 01(blue bear)        
      
      if(selectedPlayer == 1){
        
        selectedPlayer = 0;
        
        println("You have deselected player 1 ( blue bear).");

      }
      
      else{        
      
        selectedPlayer = 1;
        
        println("You have selected player 1 ( blue bear).");

      }
   
    }
  
    if(mouseButton == LEFT && player02Walk == 0 && player01Walk == 0 && mouseX > player02X - 10 && mouseX < player02X + 10  && mouseY > player02Y - 15 && mouseY < player02Y + 15){ //checks to see if LBM is selecting player 02(red bear)       
      
      if(selectedPlayer == 2){
        
        selectedPlayer = 0;
        
        println("You have deselected player 2 (red bear).");

      }
      
      else{
      
        selectedPlayer = 2;
        
        println("You have selected player 2 (red bear).");

      }
      
    }
    
  
  

  
  
    if (mouseButton == RIGHT && mouseY < 250 + 50 && mouseY > 250 - 40) { //detects mouse for beacon placement
      
     beaconX = mouseX;//sets the beacon position to the mouseX value
     
     beaconCheck = true;//turns on beacon
     
  }
  

  
  
  
  
  
  
  if(mouseButton == RIGHT && selectedPlayer == 0){//if a beacon is placed when no character is selected 
  
    println("Please select a character before placing a beacon.");
    
    beaconCheck = false;
  
  }
  

}




void keyPressed(){ //detect key press
  
  if(keyCode == CONTROL){ //if CONTROL is pressed 
    
    beaconCheck = false; //removes any beacon on screen
      
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





