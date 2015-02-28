
//--------------------------------------------------------------\\
//****Sequence Builder version 1.1****\\
//****Written by Andrew Foresman ****\\
//****Last Revised: 27.04.2013****\\
//---------------------------------------------------------------\\
 
 

color backgroundColor = color(119,159,164);//declare color for background

PImage env;
 
 
//================== STEP #1: declare animation object(s) as a global variable(s) ===========================\\
 


Animation waterfallv02Animation;


 
//==========================================================================================================\\
 
 
void setup(){
   
  size(800,800);//WxH
  smooth();//AA
  frameRate(30);//FPS
  imageMode(CENTER);
  
  env = loadImage("env.png");

   
   
 
  //================== STEP #2: initialize animation object(s) ===========================\\
   

  waterfallv02Animation = new Animation();
  
  //===================================================================================\\
   
   
   
   
   
 
 
  //================== STEP #3: set animation constructor values (int-maxImages, str-prefix, int-speed, int-xPos, int-yPos)===========================\\


  waterfallv02Animation.calculateSequence(60, "waterfall_v02_", 0, 100,400,400);

  //=======================================================================================================================\\
   
   
     
}//setup
 
 
 
 
void draw(){
  
  
  
  background(backgroundColor); //set background color
  

  
   
  //========================= STEP #4: display the image from arrray based on the current index number====================\\
   

  waterfallv02Animation.displaySequence();
  
  //========================================================================================================================\\
  

   
  image(env,400,330);
   
   
   
  //================== STEP #5: increment the index number by 1 so we can move on to the next image in array================\\
   

  waterfallv02Animation.nextImage(); 
   
   
  //========================================================================================================================\\
   
   
   
   
}//draw






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
   
    
   
  void displaySequence(){
       
    image(images[imageIndex],xPos,yPos); //display the image from the array corresponding to the index number
         
  }
  
  
  
   
  void nextImage(){
      
     if(millis() - lastTime >= speed){   //if the current millis time - the value in 'lastTime' is greater than or equal to the displayTime  
     
        imageIndex = (imageIndex + 1) % images.length; //increment to the next index number, if at the end of the array start over
        
        lastTime = millis();//'resets' lastTime to current millis
   
     }

  }
   
     
} //class



