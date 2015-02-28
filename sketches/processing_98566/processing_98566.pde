
//--------------------------------------------------------------\\
//****Sequence Builder version 1.4.0****\\
//****Originally Written by Andrew Foresman ****\\
//****Last Revised: 05.07.2013****\\
//---------------------------------------------------------------\\
 
 

color backgroundColor = color(227,214,163);//declare color for background
//int backgroundColor;


PImage bearShadow; //image for character's shadows  

int player01Speed = 2; //walk speed
int player01Direction = 1; //facing direction 1=right, -1=left
int player01Walk = 0; //is the player walking? 0=no, 1=yes
int player01X = 40; //player 01 X position 
int player01Y = 250;//player 01 Y position

int player02Speed = 4; //walk speed
int player02Direction = 1; //facing direction 1=right, -1=left
int player02Walk = 0; //is the player walking? 0=no, 1=yes
int player02X = 130;//player 02 X position
int player02Y = 250;//player 02 Y position

int targetState = 0;

int selected01Player; //identifies which player/character is selected
int selected02Player;

int beacon01X; //x position of the beacon
boolean beacon01Check = false; //has the beacon been placed or not?

int beacon02X; //x position of the beacon
boolean beacon02Check = false; //has the beacon been placed or not?

int partyCheck = 0; //is there a party going on? 0-no, 1-yes
int partyOverCheck = 0; //is there a party going on? 0-no, 1-yes
int partyStartTime; 
int partyEndTime; 
int partyStopTime; 
int partyStop2Time;
int partyWaitTime;
PImage partyBallStatic;

PImage partySwitchOff, partySwitchOn;

//settings and preferences 

PImage toggleSelectionOn, toggleSelectionOff;//toggle ON/OFF graphic
int selectionMode = 0; // 0 = mult, 1 = toggle
 
 
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


//beacon animations-----------

Animation targetOnAnimation;
Animation targetOffAnimation;

Animation targetBlueOffAnimation;

//--------------------------------

//party animations---------------

Animation partyStartAnimation;
Animation partyEndAnimation;

Animation partyBallOnAnimation;

Animation partyLightsAnimation; 

//------------------------------



//==========================================================================================================\\
 
 
void setup(){
   
  size(500,500);//WxH
  smooth();//AA
  frameRate(30);//FPS
  imageMode(CENTER);
  
  bearShadow = loadImage("bearShadow.png");
  
  toggleSelectionOn = loadImage("toggleSelectionOn.png");
  toggleSelectionOff = loadImage("toggleSelectionOff.png");
  
  partySwitchOn = loadImage("partySwitchOn.png");
  partySwitchOff = loadImage("partySwitchOff.png");
  
  partyBallStatic = loadImage("partyStart16.png");



   
   
 
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
  
  //beacon animations-------------------------
  targetOnAnimation = new Animation();
  targetOffAnimation = new Animation();
  
  targetBlueOffAnimation = new Animation();
  //---------------------------------------------
  
  //party animations----------------------------
  
  partyStartAnimation = new Animation();
  partyBallOnAnimation = new Animation();
  partyEndAnimation = new Animation();
  
  partyLightsAnimation = new Animation();
  
  //---------------------------------------
  


  
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
  
  //beacons---------------------
  
  targetOnAnimation.calculateSequence(25, "target", 0, 100, 375, 250);
  targetOffAnimation.calculateSequence(25, "target", 0, 100, 375, 250);
  
  targetBlueOffAnimation.calculateSequence(1, "targetBlue", 0, 100, 375, 250);

  //party--------------------------------
  
  partyStartAnimation.calculateSequence(17, "partyStart", 0, 160, 300, 50);
  partyEndAnimation.calculateSequence(17, "partyEnd", 0, 160, 300, 50);

  partyBallOnAnimation.calculateSequence(2, "partyBallOn", 0, 160, 300, 50);
  partyLightsAnimation.calculateSequence(2, "partyLights", 0, 100, 250, 250);

  
  //---------------------------------------
  
  






  //=======================================================================================================================\\
   
   
   
     
}//setup
 
 
 
 
void draw(){
  
  
  
  background(backgroundColor); //set background color
  
  
  noStroke();//stroke off
  fill(128);//ground plane color
  rect(0,260,500,250);//ground plane shape
  
  
  fill(255);//white walkway color
  rect(0,261,500,22); //white walkway shape
  
  fill(88);//shadow color
  image(bearShadow, player01X, 270);//player 01 shadow shape 
  image(bearShadow, player02X, 270);//player 01 shadow shape 
  

  fill(200);//toggle state background color
  rect(22,465,130,30);//toggle state background shape
  
  fill(191,184,152);//ceiling color
  rect(0,0,500,50);//ceiling shape
  
  
  if(selectionMode == 1){ //if toggle selection is OFF
    
    image(toggleSelectionOn, 90, 480);//display toggle ON image
    
  }

  else if(selectionMode == 0){ //if toggle selection is OFF
  
    image(toggleSelectionOff, 90, 480); //display toggle OFF image
  
  }  


  
   
  //========================= STEP #4: display the image from arrray based on the current index number====================\\


  if(beacon01Check){//checks to see if the beacon has been placed
           
       targetBlueOffAnimation.displaySequence(beacon01X, 250); //if so, display beacon
       
   }
   
     if(beacon02Check){//checks to see if the beacon has been placed
           
       targetOnAnimation.displaySequence(beacon02X, 250); //if so, display beacon
       
   }
       


     

   
  //character display-------------------------------------------- 
  

  if(!beacon01Check){ //if beacon is not on screen
    

   //character 01 not moving -------
     if(player01Direction == 1 && selected01Player ==1){ //if the player is facing right (stationary) and selected..
           
           bearRightGlowAnimation.displaySequence(player01X, player01Y); //display 'player selected' animation
           
      }
       
      else if(player01Direction == 1){ //if the player is facing right and not selected
       
           bearStillRightAnimation.displaySequence(player01X, player01Y); //display the player in stationary state
              
       }
       
      if(player01Direction == -1 && selected01Player ==1){ //if the player is facing left and is selected
           
           bearLeftGlowAnimation.displaySequence(player01X, player01Y);//dispaly 'player selected' animation
           
         }
         
       else if(player01Direction == -1){ //if the player is facing left and not selected
       
          bearStillLeftAnimation.displaySequence(player01X, player01Y); //display player in station state
              
       }
       //----------------------------------
       
  }   
       
       
       
       
       
    //character 02 not moving---------------------  
    if(!beacon02Check){
          
      if(player02Direction == 1 && selected02Player == 1){ //if the player is facing right (stationary) and selected..
           
           bearRedRightGlowAnimation.displaySequence(player02X, player02Y); //display 'player selected' animation
           
      }
       
      else if(player02Direction == 1){ //if the player is facing right and not selected
       
           bearRedStillRightAnimation.displaySequence(player02X, player02Y); //display the player in stationary state
              
       }
       
      if(player02Direction == -1 && selected02Player == 1){ //if the player is facing left and is selected
           
           bearRedLeftGlowAnimation.displaySequence(player02X, player02Y);//dispaly 'player selected' animation
           
         }
         
       else if(player02Direction == -1){ //if the player is facing left and not selected
       
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y); //display player in station state
              
       }
       //--------------------------------------
     
  }

 
 
   if(beacon01Check){ //if beacon 01 is on screen...
    
    if(selected01Player == 1){
    
    //player 01 moving (blue bear)-------------------------------------
    if(player01X < beacon01X-12 && selected01Player == 1){ //if the player is located to the left of the beacon

       player01Walk = 1; //turn on player walk

       player01Direction = 1;//set player direction to right
       
       player01X = player01X + player01Speed; //move player pos in X 
    
       bearWalkRightAnimation.displaySequence(player01X, player01Y); //display the right walk cycle animation 
       
     }
     
    else if(player01X > beacon01X+12 && selected01Player ==1){ //if the player is located to the right of the beacon
    
       player01Walk = 1; //turn on player walk
    
       player01Direction = -1; //set player direction to left
       
       player01X = player01X - player01Speed; //move player neg in X
    
       bearWalkLeftAnimation.displaySequence(player01X, player01Y); //display the left walk cycle animation
    
     }
     
     else{// the player has reached the beacon..
     
        if(player02Direction == 1){
         
         bearRedStillRightAnimation.displaySequence(player02X, player02Y); //display the player in stationary state
         
           targetOnAnimation.calculateSequence(25, "target", 0, 100, 375, 250);
        
       }
       
       else if(player02Direction == -1){
         
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y); //display player in station state
          
       }
       
       beacon01Check = false; //turns off beacon
       
       selected01Player = 0; //deselects player
       
       if(player01Direction == -1){ //if player is facing left
         
       bearStillLeftAnimation.displaySequence(player01X, player01Y);//display the left facing stationary animation
              
       }
       
        if(player01Direction == 1){//if player is facing right
          
           bearStillRightAnimation.displaySequence(player01X, player01Y);//display the right facing stationary position
              
       }
       
       player01Walk = 0;

       }

     }
   
   }  
     //--------------------------------------------
     
    
    if(beacon02Check){ //if beacon 02 is on screen
    
    //player 02 moving (red bear)-------------------------------------
    if(selected02Player == 1 ){
    
       if(player02X < beacon02X-5 && selected02Player == 1){ //if the player is located to the left of the beacon
    
       player02Walk = 1; //turn on player walk

       player02Direction = 1;//set player direction to right
       
       player02X = player02X + player02Speed; //move player pos in X 
    
       bearRedWalkRightAnimation.displaySequence(player02X, player02Y); //display the right walk cycle animation 
       
     }
     
    else if(player02X > beacon02X && selected02Player == 1){ //if the player is located to the right of the beacon
    
       player02Walk = 1; //turn on player walk
    
       player02Direction = -1; //set player direction to left
       
       player02X = player02X - player02Speed; //move player neg in X
    
       bearRedWalkLeftAnimation.displaySequence(player02X, player02Y); //display the left walk cycle animation
    
     }
     
     else if(player02X > beacon02X - 10 && player02X < beacon02X + 10){// the player has reached the beacon..
     
       beacon02Check = false; //turns off beacon
       
       selected02Player = 0; //deselects player
       
       targetOnAnimation.calculateSequence(25, "target", 0, 100, 375, 250);

       
      if(player02Direction == -1){ //if player is facing left
         
          bearRedStillLeftAnimation.displaySequence(player02X, player02Y);//display the left facing stationary animation
              
       }
       
       if(player02Direction == 1){//if player is facing right
          
           bearRedStillRightAnimation.displaySequence(player02X, player02Y);//display the right facing stationary position
              
       }
       
        player02Walk = 0; //turns off walk cycle animation


       }  
     
     }
     
    }
     //--------------------------------------------


     
     

   //end character display------------------------------------------
   

  //party display-------------------------------------
  
     
  if(partyCheck == 1 && millis() < partyEndTime){
    
    partyStartAnimation.displaySequence(250,120);

  }
  
  else if(partyCheck == 1 && millis() < partyWaitTime){
   
    image(partyBallStatic,250,120); 
    
  }
  
  else if(partyCheck == 1 && millis() < partyStopTime){
    
    partyBallOnAnimation.displaySequence(250,120);
    
    backgroundColor = color(222,random(1, 255),163);

    partyLightsAnimation.displaySequence(250,250);
    
    println("here");
    
  }
  
  else if(partyCheck == 1 && millis() > partyStopTime && millis() < partyStop2Time){
    
    backgroundColor = color(227,214,163);
    
    partyEndAnimation.displaySequence(250,120);
    
    targetOnAnimation.calculateSequence(25, "target", 0, 100, 375, 250);

    
  }
  
  
  
  //-------------------------------------

  
  //========================================================================================================================\\
  

   

   
   
   
  //================== STEP #5: increment the index number by 1 so we can move on to the next image in array================\\
   
//increment the characters--------------   
   
  if(player01Walk == 0 && player01Direction == 1 && selected01Player == 1){ //if the player is not walking, facing right, and is selected
    
    bearRightGlowAnimation.nextImage(); //increment the player selected animation 
    
  }
  else if(player01Walk == 0 && player01Direction == -1 && selected01Player == 1){ //if the player is not walking, facing right, and is selected
    
    bearLeftGlowAnimation.nextImage(); //increment the player selected animation
    
  }
   
  if(player01Walk == 1){ //if the player is walking

    bearWalkLeftAnimation.nextImage();//increment the left walk cycle animation
    bearWalkRightAnimation.nextImage();//increment the right walk cycle animation

  }
  
    if(player02Walk == 0 && player02Direction == 1 && selected02Player == 1){ //if the player is not walking, facing right, and is selected
    
    bearRedRightGlowAnimation.nextImage(); //increment the player selected animation 
    
  }
  
  else if(player02Walk == 0 && player02Direction == -1 && selected02Player == 1){ //if the player is not walking, facing right, and is selected
    
    bearRedLeftGlowAnimation.nextImage(); //increment the player selected animation
    
  }
   
  if(player02Walk == 1){ //if the player is walking

    bearRedWalkLeftAnimation.nextImage();//increment the left walk cycle animation
    bearRedWalkRightAnimation.nextImage();//increment the right walk cycle animation


  }//end increment the characters--------------------------

  
//start increment the target animation-----------------

  if(beacon02Check){
    
    targetOnAnimation.nextImage();
    
  }
  
//end increment target animation------------------------

//start increment party animations-----------------------

  if(partyCheck == 1){
    
    if(millis() < partyEndTime){
    
        partyStartAnimation.nextImage();
       
    }
    
    else if(millis() < partyStopTime){
      
         partyBallOnAnimation.nextImage();
         
         partyLightsAnimation.nextImage();

    }
    
    else if(millis() > partyStopTime && millis() < partyStop2Time){
      
      partyEndAnimation.nextImage();
      
    }
    
    else if(millis() > partyStop2Time){
      
      partyCheck = 0;
      
      partyStartAnimation.calculateSequence(17, "partyStart", 0, 160, 300, 50);
      partyEndAnimation.calculateSequence(17, "partyEnd", 0, 160, 300, 50);

      partyBallOnAnimation.calculateSequence(2, "partyBallOn", 0, 160, 300, 50);
      partyLightsAnimation.calculateSequence(2, "partyLights", 0, 100, 250, 250);
      
    }

    image(partySwitchOn,450,100);

  }
  
  if(partyCheck == 0){
    
          image(partySwitchOff,450,100);

  }
    

   
  //========================================================================================================================\\
   


   
}//draw




void mousePressed(){
  
  //party switch detection
  
  if(mouseButton == LEFT && mouseX > 435 && mouseX < 465 && mouseY > 75 && mouseY < 125){
    
    if(partyCheck == 0){
      
      partyCheck = 1;
      
      partyStartTime = millis();
      
      partyEndTime = partyStartTime + 2500;
      
      partyWaitTime = partyEndTime + 2000;
      
      partyStopTime = partyWaitTime + 4000;
      
      partyStop2Time = partyStopTime + 2600;
      
    }
    
  }
  
  if(selectionMode == 0){//start of mult selection mode----------------------------------------------------------
  
    if(mouseButton == LEFT && player01Walk == 0 && mouseX > player01X - 10 && mouseX < player01X + 10  && mouseY > player01Y - 15 && mouseY < player01Y + 15){ //checks to see if LBM is selecting player 01(blue bear)        
      
      if(selected01Player == 1){
        
        selected01Player = 0;
        
        println("You have deselected player 1 ( blue bear).");

      }
      
      else{        
      
        selected01Player = 1;
        
        
        println("You have selected player 1 ( blue bear).");

      }
   
    }
  
    if(mouseButton == LEFT && player02Walk == 0 && mouseX > player02X - 10 && mouseX < player02X + 10  && mouseY > player02Y - 15 && mouseY < player02Y + 15){ //checks to see if LBM is selecting player 02(red bear)       
      
      if(selected02Player == 1){
        
        selected02Player = 0;
        
        println("You have deselected player 2 (red bear).");

      }
      
      else{
      
        selected02Player = 1;
        
        println("You have selected player 2 (red bear).");

      }
      
    }
    
  }//end of mult selection mode------------------------
  
  if(selectionMode == 1){//start of toggle selection mode----------------------------------------------------------
  
    if(mouseButton == LEFT && player01Walk == 0 && mouseX > player01X - 10 && mouseX < player01X + 10  && mouseY > player01Y - 15 && mouseY < player01Y + 15){ //checks to see if LBM is selecting player 01(blue bear)        
      
      if(selected01Player == 1){
        
        selected01Player = 0;
        
        println("You have deselected player 1 ( blue bear).");

      }
      
      else{

        if(player02Walk == 0 && player01Walk == 0){        
      
          selected01Player = 1;
          
          selected02Player = 0;
          
          
        }
        
        else{
          
          selected01Player = 1;
          
             println("You have selected player 1 ( blue bear).");

      }
   
    }
    
    }
  
    if(mouseButton == LEFT && player02Walk == 0 && mouseX > player02X - 10 && mouseX < player02X + 10  && mouseY > player02Y - 15 && mouseY < player02Y + 15){ //checks to see if LBM is selecting player 02(red bear)       
      
      if(selected02Player == 1){
        
        selected02Player = 0;
        
        println("You have deselected player 2 (red bear).");

      }
      
      else{

        if(player02Walk == 0 && player01Walk == 0){        
      
          selected01Player = 0;
          
          selected02Player = 1;
          
          
        }
        
        else{
          
          selected02Player = 1;
          
             println("You have selected player 2 ( red bear).");

      }
   
    
    
    }
  }
      

  
  }//end of toggle selection mode------------------------
  
  
  
    if (player01Walk == 0 && mouseButton == RIGHT && selected01Player == 1 && mouseY < 250 + 50 && mouseY > 250 - 40) { //detects mouse for beacon placement
      
       beacon01X = mouseX;//sets the beacon position to the mouseX value
     
       beacon01Check = true;//turns on beacon
     
    }
    
   if (player02Walk == 0 && mouseButton == RIGHT && selected02Player == 1 && mouseY < 250 + 50 && mouseY > 250 - 40) { //detects mouse for beacon placement
      
       beacon02X = mouseX;//sets the beacon position to the mouseX value
     
       beacon02Check = true;//turns on beacon
     
    }
  
   if(mouseButton == RIGHT && selected01Player == 0 && selected02Player == 0){//if a beacon is placed when no character is selected 
  
     println("Please select a character before placing a beacon.");
    
     beacon01Check = false;
    
     beacon02Check = false;
  
  }
  

}





void keyPressed(){ //detect key press
  
  if(keyCode == CONTROL){ //if CONTROL is pressed 
    
    beacon01Check = false; //removes any beacon on screen
    
    beacon02Check = false;
    
    selected01Player = 0;
    
    selected02Player = 0;
    
    player01Walk = 0;
    
    player02Walk = 0;
      
  }
  
  if(key == 't' || key == 'T'){
    
    if(selectionMode == 0){
      
      selectionMode = 1;
      
      println("toggle selection ON");
      
    }
    
    else{
      
      selectionMode = 0;
      
      println("toggle selection OFF");

    }
   
  }
  
  if(key == 'p' || key == 'P'){
    
    if(partyCheck == 0){
      
      partyCheck = 1;
      
      partyStartTime = millis();
      
      partyEndTime = partyStartTime + 2500;
      
      partyWaitTime = partyEndTime + 2000;
      
      partyStopTime = partyWaitTime + 4000;
      
      partyStop2Time = partyStopTime + 2600;
      
    }
    
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



class Party{



}//end party class


