

Hero Megaman;
PImage wasser1;
PImage wasser;
PImage mmBackground;
 PImage dusche;
 
void setup() {
  size(580,400);
  frameRate(12);
 
    mmBackground = loadImage("sand.png");
     
 
  image(mmBackground, -20,0);
  // Gatta remember to initialize him
  Megaman = new Hero();
  Megaman.loadImages();
    dusche =loadImage("dusche.png");
   image(dusche,400,200);
  wasser1 =loadImage("wasser1.png");  
}
 
void draw(){
  // whatever
  image(mmBackground, -20,0);
  image(dusche,400,200);
  checkKeys();
  Megaman.update();
  Megaman.checkState();
  Megaman.blinkCheck();
 
  if (Megaman.dirState == "right"){
 
    image(Megaman.imagesR[Megaman.imageIndexR], Megaman.mmX,Megaman.mmY);
 
  } 
 
  else if (Megaman.dirState == "left")
  {
    image(Megaman.imagesL[Megaman.imageIndexL], Megaman.mmX,Megaman.mmY);
 
  }  
  // all the code for standing still PLUS blinking!!!!
  else if  (Megaman.dirState == "chill")
  {
    // faces right if hes chillin' right
    if (Megaman.chillState == "right"){
      image(Megaman.imagesR[Megaman.blinkRate], Megaman.mmX,Megaman.mmY);
 image(dusche,400,200);
    }
     
    // faces left if hes chillin' left
    if (Megaman.chillState == "left"){
      image(Megaman.imagesL[Megaman.blinkRate], Megaman.mmX,Megaman.mmY);
   image(dusche,400,200);  
  }
  }
  if (Megaman.jumpState == "jump" || Megaman.jumpState == "falling")
  {
    if (Megaman.chillState == "right"){
   image(mmBackground, -20,0);
    image(dusche,400,200);
      image(Megaman.imagesR[5], Megaman.mmX,Megaman.mmY);
    }
     
    // faces left if hes chillin' left
    if (Megaman.chillState == "left"){
    image(mmBackground, -20,0);
      image(dusche,400,200);
      image(Megaman.imagesL[5], Megaman.mmX,Megaman.mmY);
    }
     
  }
 
 if (Megaman.chillState == "right" && keyPressed &&Megaman.mmX>300 &&Megaman.mmX<330){
   if (keyCode == DOWN){
     tint(200,120);
     image(wasser1,250,220);
 noTint();  
 }
 }
  
}
 
void checkKeys(){
  if (keyPressed) {
    if (keyCode == RIGHT) {
      Megaman.dirState = "right";
    }  
 
    if (keyCode == LEFT) {
      Megaman.dirState ="left";
    }
     
    if (keyCode == UP && Megaman.jumpState == "none"){
       
      Megaman.jumpState = "jump";
    }  
     
  }
  else {
    Megaman.dirState = "chill";
  }
 
}

class Hero
{
  //position
 
  float mmX = 60;
  float mmY = 220;
 
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
 
 
 PImage wasser;
  PImage[] imagesR = new PImage[maxImagesR];
  PImage[] imagesL = new PImage[maxImagesL];


  void loadImages()
  {
    // Load all images running right
    for (int i = 0; i < imagesR.length; i++) {
      imagesR[i] = loadImage("Erdmaennchen.png");
    }
    // Load all images running left
    for (int j = 0; j < imagesR.length; j++) {
      imagesL[j] = loadImage("ErdmaennchenL.png");
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
      if(mmY <= 200) {
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
      if(mmY >= 220){
        jumpState = "none";
        mmY = 220;
 
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



