
//Zhaochang He
//zhaochah@andrew.cmu.edu
//copyright(c) Zhaochang He Pittsburgh,PA

//Project 1
//Guess what's in the photo?
//Use rect to replace pixels of the image, and fill the image with small rect. 
//let user guess what is this image.
//let user use mouse and keyboard to move to next image


PImage imgg;
PImage img;
PImage imag;

int gamePhase;

int pointi=16;
  
int startTime, gameTime;

  
void setup() {
  size(400,400);
  background(255);

  smooth();
  frameRate(1000);
  imgg= loadImage("animal1.png");
  img = loadImage("animal2.png");
  imag = loadImage("animal3.png");
  
   startTime = 0;
   gamePhase = 0; 
   gameTime = 35000;   // milliseconds 
  
}

void draw() {
   fill(0);
   textSize(15);
   text("Guess what's this?", width/7, 370);
   
   if ( gamePhase == 0)
  {
    picture1();
  }
  else if ( gamePhase == 1 )
  {
    picture2();
  }  else if ( gamePhase == 2 )
  {
    picture3();
  }
  
}

  
void picture1(){  
//get pixels of the images  
 int x = int(random(imgg.width));
  int y = int(random(img.height));
  int loc = x +y*img.width;
  
loadPixels();
//replace pixels with small rects
   float r = red (imgg.pixels[loc]);
   float g = green(imgg.pixels[loc]);
   float b = blue(imgg.pixels[loc]);
   noStroke();
   
   fill(r,g,b,100);
   rect(x, y, pointi, pointi);
   
//tell user the answer at time of 25 seconds   
     if ( (millis( )-startTime) > gameTime)
  {
     fill(255,50,50);
     textSize(20);
     text("This is a cat, did you guess it right?", width/7, 20);
     text("Click Mouse to see next photo", width/7, 40);
  } 

//click mouse to move to next photo   
     if ( mousePressed == true )
   {
     background(255);
     gamePhase=1;
   }
}  

//do it again
void picture2(){  
 int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x +y*img.width;
  
loadPixels();

   float r = red (img.pixels[loc]);
   float g = green(img.pixels[loc]);
   float b = blue(img.pixels[loc]);
   noStroke();
   
   fill(r,g,b,100);
   rect(x, y, pointi, pointi);
   
  
  if ( (millis( )-startTime) > gameTime*2.5 )
  {
     fill(255,50,50);
     textSize(20);
     text("This is a chicken", width/7, 20);
     text("Press any key to check next photo", width/7, 40);
  } 
   
     if ( keyPressed == true )
   {
     background(255);
     gamePhase=2;
   }
}  

//do it again
void picture3(){  
 int x = int(random(imag.width));
  int y = int(random(imag.height));
  int loc = x +y*imag.width;
  
loadPixels();

   float r = red (imag.pixels[loc]);
   float g = green(imag.pixels[loc]);
   float b = blue(imag.pixels[loc]);
   noStroke();
   
   fill(r,g,b,100);
   rect(x, y, pointi, pointi);
   
    if ( (millis( )-startTime) > gameTime*3.8 )
  {
     fill(255,50,50);
     textSize(20);
     text("This is a cow", width/7, 20);
     text("Press [esc] to exit", width/7 , 40);
  } 
  
} 




