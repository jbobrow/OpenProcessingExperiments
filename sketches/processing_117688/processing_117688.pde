
//Refferencing from the example of animation: Sequential
//Source of sound: http://www.youtube.com/watch?v=ifygyVFuGXA 
//Source of sound: http://www.youtube.com/watch?v=dp0KXSjXGw0
//Source of sound: http://www.youtube.com/watch?v=xn6hhrX34Pw

//number of frames in this animation
int numFrames = 26; 
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage img;


import ddf.minim.*;
Minim minim;
AudioSample gun;
AudioSample scream;
AudioPlayer file;
    
void setup() {
  size(700, 520); //size of the canvas
  frameRate(8);
  minim = new Minim(this);
  file = minim.loadFile("snake1.mp3");
  gun = minim.loadSample("gun1.mp3");
  scream = minim.loadSample("scream.mp3");
  file.loop();
  img = loadImage("P1040606.JPG");
  

  //load the images
  images[0]  = loadImage("P1040580.JPG");
  images[1]  = loadImage("P1040581.JPG"); 
  images[2]  = loadImage("P1040582.JPG");
  images[3]  = loadImage("P1040583.JPG"); 
  images[4]  = loadImage("P1040584.JPG");
  images[5]  = loadImage("P1040585.JPG"); 
  images[6]  = loadImage("P1040586.JPG");
  images[7]  = loadImage("P1040587.JPG"); 
  images[8]  = loadImage("P1040588.JPG");
  images[9]  = loadImage("P1040589.JPG"); 
  images[10] = loadImage("P1040590.JPG");
  images[11] = loadImage("P1040591.JPG"); 
  images[12] = loadImage("P1040592.JPG");
  images[13] = loadImage("P1040593.JPG"); 
  images[14] = loadImage("P1040594.JPG");
  images[15] = loadImage("P1040595.JPG"); 
  images[16] = loadImage("P1040596.JPG");
  images[17] = loadImage("P1040597.JPG"); 
  images[18] = loadImage("P1040598.JPG");
  images[19] = loadImage("P1040599.JPG"); 
  images[20] = loadImage("P1040600.JPG");
  images[21] = loadImage("P1040601.JPG"); 
  images[22] = loadImage("P1040602.JPG");
  images[23] = loadImage("P1040603.JPG"); 
  images[24] = loadImage("P1040604.JPG");
  images[25] = loadImage("P1040605.JPG"); 
  } 
 

void draw() {
  background(0);
   frame = (frame+1) % numFrames;  //keep looping the photos
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) {
    image(images[(frame+offset) % numFrames], 0, 0, width, height);
    offset+=2;
  }
  
  //Press any key to produce the scream sound effect
  if (keyPressed)
    scream.trigger();
    
  //Press mouse key to produce sound of shooting
  if (mousePressed) 
     gun.trigger();
     
  //To form the target sign, it will move by following the directions of cursor 
  noFill();
  ellipse(mouseX,mouseY,70,70);
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseX,mouseY,30,30);
  line(mouseX-60, mouseY, mouseX+60, mouseY);
  line(mouseX, mouseY-60, mouseX, mouseY+60);
  }
  
  //When pressing the mouse, the image of broken snake will be shown
  void mousePressed() {
  image(img, mouseX, mouseY);
  image(img, 0, 0);
  }




