
//--------------------------------------------------------------\\
//****Sequence Builder version 1.0****\\
//****Written by Andrew Foresman ****\\
//****Last Revised: 25.04.2013****\\
//---------------------------------------------------------------\\



color backgroundColor = color(119,159,164);//declare color for background


//================== STEP #1: declare animation object(s) as a global variable(s) ===========================\\

Animation glowAnimation; 
Animation wallAnimation;
Animation fireAnimation;

//==========================================================================================================\\


void setup(){
  
  size(500,500);//WxH
  smooth();//AA
  frameRate(30);//FPS
  

  //================== STEP #2: initialize animation object(s) ===========================\\
  
  glowAnimation = new Animation(); 
  wallAnimation = new Animation();
  fireAnimation = new Animation();

  
  //===================================================================================\\
  


  //================== STEP #3: set animation constructor values (maxImages, prefix, xPos, yPos)===========================\\

  glowAnimation.calculateSequence(20, "glow", 220, 100);
  wallAnimation.calculateSequence(69, "wall_animation", 350, 300);
  fireAnimation.calculateSequence(12, "fire", 200, 100);

  
  //=======================================================================================================================\\
  
  
}//setup




void draw(){
  
  background(backgroundColor); //set background color
  
  //========================= STEP #4: display the image from the image arrray based on the current index number============\\
  
  glowAnimation.displaySequence(); 
  wallAnimation.displaySequence();
  
  //===fire translations
  pushMatrix();
  rotate(.5);
  translate(155,31);
  rectMode(CORNERS);
  fill(0);
  rect(50,200,30,100);
  popMatrix();
  rotate(.5);
  fireAnimation.displaySequence();
  //===end fire translations 

  
  //========================================================================================================================\\
  
  
  
  //================== STEP #5: increment the index number by 1 so we can move on to the next "frame"=======================\\
  
  glowAnimation.nextImage();
  wallAnimation.nextImage();
  fireAnimation.nextImage();

  
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
  
  
  
  void displaySequence(){
    
    imageMode(CENTER);
    
    image(images[imageIndex],xPos,yPos); //display the image from the array corrosponding to the index number
        
  }
  
  
  void nextImage(){
   
   imageIndex = (imageIndex + 1) % images.length; //increment to the next index number, if at the end of the array start over 
    
  }
  
    
} //class


