
////IMAGES
PImage Farmer; 
PFont title;

////Background Images
PImage gamestart; //start menu
PImage FarmBackgroundStart; //instruction menu
PImage FarmBackground; //main game background

////Horse Images
PImage BackgroundHorseCount;
PImage BackgroundHorseFact;

////Sheep Images
PImage BackgroundSheepCount;
PImage BackgroundSheepFact;

////Cow Images
PImage BackgroundCowCount;
PImage BackgroundCowFact;

////Goat Images
PImage BackgroundGoatCount;
PImage BackgroundGoatFact;

////Rabbit Images
PImage BackgroundRabbitCount;
PImage BackgroundRabbitFact;

////Pig Images
PImage BackgroundPigCount;
PImage BackgroundPigFact;



//VARIABLES

    String stage;
    float YPos = 0; //farmers first position
    float XPos = 390; //farmers second position

   
void setup() {
  
  //START MENU
  stage = "menu";
  size(800,550);
  gamestart = loadImage("gamestart.png");
  image(gamestart, 0, 0, 800,550); 
  
  if(stage== "menu"){
  textAlign(CENTER);
  textSize(75);
  text("Farm Game", 560, 120);
  textSize(50);
  text("Press ENTER key to start game", 400, 300);}
}




void draw(){
  
  if (key == ENTER){ // Start game upon hitting ENTER key
   
   FarmBackgroundStart = loadImage("FarmBackgroundStart.png");
      image(FarmBackgroundStart, 0, 0, 800, 550);} // INSTRUCTION MENU
      
      
     
     { 
       
       //FARMERS FIRST POSTION AND MOVEMENT
       if(key == ENTER){
      Farmer = loadImage("Farmer.png");
  image(Farmer, YPos, 350);
  if(YPos < 400){
    YPos = YPos + 6;
  }
     }
     }
      
       if(key == 'f'){
      BackgroundHorseCount = loadImage("BackgroundHorseCount.png");
      image(BackgroundHorseCount, 0, 0, 800, 550);} // Ask user to move to next question by pressing the f (for Farmer) key; this loads the next question
     
  
  
  Questions(); // Call question function

}



//////////////////////////////////


// This function displays each question in turn

void Questions(){

//////////////////////////////////


  if(key == '3'){ // By pressing correct answer, this gives user fact about animal
    BackgroundHorseFact= loadImage("BackgroundHorseFact.png");
    image(BackgroundHorseFact, 0, 0, 800, 550);}
   
  if(key == 'h'){ // Ask user to move to next question by pressing the h (for Horse) key; this loads the next question
      BackgroundCowCount = loadImage("BackgroundCowCount.png");
      image(BackgroundCowCount, 0, 0, 800, 550);} 

//////////////////////////////////
    
  if(key == '4'){ 
    BackgroundCowFact = loadImage("BackgroundCowFact.png");
      image(BackgroundCowFact, 0, 0, 800, 550);}
     
      if(key == 'c'){
  BackgroundGoatCount = loadImage("BackgroundGoatCount.png");
      image(BackgroundGoatCount, 0, 0, 800, 550);} // Ask user to move to next question by pressing the c key; this loads the next question    

//////////////////////////////////
  
  if(key == '5'){ 
    BackgroundGoatFact = loadImage("BackgroundGoatFact.png");
      image(BackgroundGoatFact, 0, 0, 800, 550);}
    
  if(key == 'g'){
    BackgroundSheepCount = loadImage("BackgroundSheepCount.png");
      image(BackgroundSheepCount, 0, 0, 800, 550);}  // Ask user to move to next question by pressing the g key; this loads the next question

//////////////////////////////////

  if(key == '6'){ 

    BackgroundSheepFact = loadImage("BackgroundSheepFact.png");
      image(BackgroundSheepFact, 0, 0, 800, 550);}
    
    if(key == 's'){
    BackgroundPigCount = loadImage("BackgroundPigCount.png");
      image(BackgroundPigCount, 0, 0, 800, 550);} // Ask user to move to next question by pressing the s key; this loads the next question

//////////////////////////////////
  if(key == '8'){ 
   BackgroundPigFact = loadImage("BackgroundPigFact.png");
      image(BackgroundPigFact, 0, 0, 800, 550);}
    
  if(key == 'p'){
  BackgroundRabbitCount = loadImage("BackgroundRabbitCount.png");
      image(BackgroundRabbitCount, 0, 0, 800, 550);}  // Ask user to move to next question by pressing the p key; this loads the next question  

//////////////////////////////////

  if(key == '9'){ 
    key = '9';
    BackgroundRabbitFact = loadImage("BackgroundRabbitFact.png");
      image(BackgroundRabbitFact, 0, 0, 800, 550);}

  if(key == 'r'){
    FarmBackground = loadImage("FarmBackground.png");
      image(FarmBackground, 0, 0, 800, 550);} // Ask user to move to next question by pressing the r key; this loads the next question
 
 
 ///FARMER POSITION 2
 if(key == 'r'){
  Farmer = loadImage("Farmer.png");
  image(Farmer, XPos, 350);
  if(XPos < 1000){
    XPos = XPos + 4;
  }
  
  //ENDING
  textAlign(CENTER); 
  textSize(70);
  text("THANK YOU!", 400, 280);
  textSize(25);
  text("You have helped me count every animal correctly!", 400, 320);
  textSize(25);
  text("They are now safe inside the red barn.", 400, 350);
  

//////////////////////////////////

}

}



