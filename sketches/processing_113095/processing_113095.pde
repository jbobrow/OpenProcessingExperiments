
int numFrames = 12;  // The number of frames in the animation
int frame = 0;
boolean upPressed = false, downPressed = false, leftPressed=false;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(400, 400);
  frameRate(5);
  
  images[0]  = loadImage("01.gif");
  images[1]  = loadImage("02.gif"); 
  images[2]  = loadImage("03.gif");
  images[3]  = loadImage("04.gif"); 
  images[4]  = loadImage("05.gif");
  images[5]  = loadImage("06.gif"); 
  images[6]  = loadImage("07.gif");
  images[7]  = loadImage("08.gif"); 
  images[8]  = loadImage("09.gif");
  images[9]  = loadImage("10.gif"); 
  images[10] = loadImage("11.gif");
  images[11] = loadImage("12.gif"); 
 
} 
 
void draw() { 
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 0,0);
  
    if (upPressed) {//quicken the speed after pressing UP
    frameRate(100);
    }
    upPressed = false;
  
  
   if (downPressed) {//slow down the speed after pressing DOWN
   frameRate(1);
    }
    downPressed = false;
    
    if (leftPressed) {//draw lines on lower part after pressing DOWN
   frameRate(5);
    }
    leftPressed = false;
  }


void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      upPressed = true;
    }else if (keyCode==DOWN) {
      downPressed = true;
    }else if (keyCode==LEFT ) {
      leftPressed = true;
    }
  }
}
  

