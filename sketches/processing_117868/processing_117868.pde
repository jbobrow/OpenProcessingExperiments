
// Mid-term Project
// By Wong Hiu Tung, Christine
// Student ID: 534015140
/////////////////////////////////////////////////////////////////
 
import ddf.minim.*;
 
Minim minim;
AudioPlayer file;
AudioPlayer bgmusic;

PImage imgBG, badmood1, badmood2, RainDrop1, RainDrop2, RainColor1, RainColor2;
PImage[] imgGood = new PImage[6];

int STARTframe = 0;
int RainframeA = 0;

//Set the boolean to run the animation of the little boy opening the umbrella.
boolean RunAnimation;
  
void setup() {
  size(756, 756);

//Set the two music file name.  
  minim = new Minim(this);
  file = minim.loadFile("raindrop.mp3");
  bgmusic = minim.loadFile("forestRain.mp3");  
  bgmusic.loop();
  
//Set the picture name.  
  imgBG = loadImage("bg.jpg");
  badmood1 = loadImage("badmood1.png");
  badmood2 = loadImage("badmood2.png");
  RainDrop1 = loadImage("rain1.png");
  RainDrop2 = loadImage("rain2.png");
  RainColor1 = loadImage("raincolor1.png");
  RainColor2 = loadImage("raincolor2.png");

//Set the array of the animation of the little boy opening the umbrella.   
  imgGood[0] = loadImage("good1.png");
  imgGood[1] = loadImage("good2.png");
  imgGood[2] = loadImage("good3.png");
  imgGood[3] = loadImage("good4.png");
  imgGood[4] = loadImage("good5.png");
  imgGood[5] = loadImage("good6.png");

}
 
void draw() {
  
  background(255);
  image(imgBG, 0, 0);
  
//If the key"P" is not pressed, the little boy looks sad.  
  if (RunAnimation == false){
    STARTframe = 0;
    frameRate(3);
   
    RainframeA =  RainframeA + 1;

//The movement of the rain.   
   if (RainframeA > 1){
   RainframeA = 0;
   image(RainDrop1, 0, 0);
   }
   
   else{
   image(RainDrop2, 0, 0);
   }

//Pressing the mouse, the little boy will be sad.    
  if (mousePressed == true) {
  image(badmood2, 0, 0);  
  }
  
  else{
  image(badmood1, 0, 0);
  }
   }

//If the key"P" is pressed, the little boy will open the umbrella.
   if (RunAnimation == true){
      
     STARTframe = STARTframe + 1;
     frameRate(2.6);
       
   if (STARTframe > 1){
    image(imgGood[0], 0, 0);
    image(RainDrop1, 0, 0);
  }
   if (STARTframe > 3){
      image(imgBG, 0, 0);
      image(imgGood[1], 0, 0);
      image(RainDrop2, 0, 0);
    }
       if (STARTframe > 5){
         image(imgBG, 0, 0);
         image(imgGood[2], 0, 0);
         image(RainDrop1, 0, 0);
    }
           if (STARTframe > 7){
             image(imgBG, 0, 0);
             image(imgGood[3], 0, 0);
             image(RainDrop2, 0, 0);
    }
               if (STARTframe > 9){
                 image(imgBG, 0, 0);
                 image(imgGood[4], 0, 0);
                 image(RainColor1, 0, 0);
                 
                 bgmusic.setGain(-5); //While the piano is playing, the volume of background music turns low.
    }
               if (STARTframe > 11){
                 image(imgBG, 0, 0);
                 image(imgGood[5], 0, 0);
                 image(RainColor2, 0, 0);
                 
                 bgmusic.setGain(-5);//While the piano is playing, the volume of background music turns low.
                 
                 STARTframe = STARTframe - 2;
                 frameRate(1);
    }
   }     
}

//If the key"P" is pressed, music will be played and the function of the animation will be run.
void keyPressed() {
       
  if ( key == 'p' ) { 
    file.rewind();
    file.play();
    file.loop();
    
    
    RunAnimation = true;         
  }
  
  else{
    file.pause();
    RunAnimation = false;
  }   
  }


/////////////////////////////////////////////////////////////////

/*

background picture reference:
1. http://cdn-ak.f.st-hatena.com/images/fotolife/n/nvs/20071128/20071128012449.jpg

music reference:
1. http://www.youtube.com/watch?v=8Sf3ppbgwac
2. http://www.youtube.com/watch?v=NfKsb4ZCJIs
*/

