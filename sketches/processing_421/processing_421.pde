
//
//
/* CLASSES FOR ALL THE CHARACTERS */
//
//

class Hero
{
  //position

  float mmX = 60;
  float mmY = 145; 

  float hMom = 0;
  float vMom = 5;

  String dirState = "right";
  String chillState = "right";
  String jumpState =  "none";
  String shootState = "shoot";

  float blinkMaker = random(10);
  int blinkRate = 1;

  // Declares all the images for the right and left sequences

  int maxImagesR = 9; // Total # of  images
  int imageIndexR = 0; // Initial image to be displayed first

  int maxImagesL = 9;
  int imageIndexL = 0;
  //



  PImage[] imagesR = new PImage[maxImagesR];
  PImage[] imagesL = new PImage[maxImagesL];

  // Loads all the images for the right and left sequences
  /*

   0 - blink
   1 - stanind
   2-4 - Running
   5 - jumping
   6 - shooting ground
   7 - shooting jump
   8 - hurt
   
   */
  void loadImages()
  {
    // Load all images running right
    for (int i = 0; i < imagesR.length; i++) {
      imagesR[i] = loadImage("mmR" + i + ".png");
    } 
    // Load all images running left
    for (int j = 0; j < imagesR.length; j++) {
      imagesL[j] = loadImage("mmL" + j + ".png");
    } 

  }

  void runRight()
  {
    dirState = "right";
    if (imageIndexR <= 4){
      imageIndexR += 1;
      mmX+=4;
    }

    if (Megaman.imageIndexR > 4) {
      imageIndexR = 2; 
    }
  }

  void runLeft()
  {
    dirState = "left";
    if (imageIndexL <= 4){
      imageIndexL += 1;
      mmX-=4;
    }

    if (imageIndexL > 4) {
      imageIndexL = 2; 
    }
  }

  void chill()
  {
    dirState = "chill";

    if (chillState == "right"){
      imageIndexR = 0;

    }

    if (chillState == "left"){
      imageIndexL = 0;
    }

    mmX -=0;

  }

  void update()
  {  
    //println(dirState);


  }

  void jumping(){

    if (jumpState == "jump")
    {
      mmY -= 6;
      if(mmY <= 100) {
        jumpState = "falling";
      }
    }   
  }
  
 // void shooting(){
  //  if (shootState == "shoot")
    
    
  //}

  void falling(){
    if(jumpState == "falling")
    {
      mmY +=5;
      if(mmY >= 145){
        jumpState = "none";
        mmY = 145;

      }
    } 
  }

  void blinkCheck()
  {
    blinkMaker = random(15);

    int W = int(blinkMaker);
    //println(W); 

    if (W == 10)
    {
      blinkRate = 0;
    } 
    else {
      blinkRate = 1;
    }
  }
  void checkState()
  {
    if (dirState == "right"){
      runRight();
      chillState = "right";
    } 
    else if (dirState == "left"){
      runLeft();
      chillState = "left";
    } 
    else if (dirState == "chill"){
      chill();
    } 

    if (jumpState == "jump"){
      jumping();
    } 
    else if (jumpState == "falling"){
      falling();
    }  

  }

}



