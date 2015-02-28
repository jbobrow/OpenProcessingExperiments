
// Assignment 3
// By Wong Hiu Tung, Christine
// Student ID: 53405140

//Numbers of frames when keyPressed function run.
int SecondFrame = 5;
int Aframe = 0;

//Numbers of frames when there is no keyPressed function.
int FirstFrame = 3;
int Bframe = 0;

//The name of the two animation.
PImage[] imageA = new PImage[FirstFrame];
PImage[] imageB = new PImage[SecondFrame];

void setup(){
  
  size(500, 500);
  frameRate(3);//Set the speed of the animation.  
  
  imageA[0]  = loadImage("draw-01.png");
  imageA[1]  = loadImage("draw-02.png");
  imageA[2]  = loadImage("draw-03.png");  
  
  imageB[0]  = loadImage("draw-04.png");
  imageB[1]  = loadImage("draw-05.png");
  imageB[2]  = loadImage("draw-06.png");
  imageB[3]  = loadImage("draw-07.png");
  imageB[4]  = loadImage("draw-08.png");  

}

void draw(){
  
  background(255);
  
   
//Pressing the keyboard, the boy will awake and punish you.
    if (keyPressed == true) {
  
      Aframe = Aframe + 1;
      
     while (Aframe >= SecondFrame){
       Aframe = 2; //When the last frame ran, it will back to the specific frame automatically.   
     }
     
     image(imageB[Aframe],0,0);
  
//The boy is sleeping.  
  } else {
    
     Bframe = Bframe + 1;
    
    while ( Bframe >= FirstFrame){
      Bframe = 0;//When the last frame ran, it will back to the first frame automatically.
    }
    
    image(imageA[Bframe], 0, 0);
   
  }
}




