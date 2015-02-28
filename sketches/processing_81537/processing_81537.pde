
PImage img0;
float r;
float g;
float b;
float a;
int numFrames = 10;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
void setup () {
    frameRate(5);
  img0 = loadImage("wash.png");
  images[0]  = loadImage("01.png");
  images[1]  = loadImage("02.png");
  images[2]  = loadImage("03.png");
  images[3]  = loadImage("04.png");
  images[4]  = loadImage("05.png");
  images[5]  = loadImage("06.png");
  images[6]  = loadImage("07.png");
  images[7]  = loadImage("08.png");
  images[8]  = loadImage("09.png");
  images[9]  = loadImage("wash.png");

  
  size (300,400);
  smooth ();
  background(img0);
  ellipseMode (CENTER);
  cursor(HAND);
}
 
 
 
void draw () {
  r = random(0);
  g = random(180);
  b = random(255);
  a = random(100);
  
  if (mousePressed == true){
  stroke(255);
  fill(r,g,b,a);
  ellipse (mouseX, mouseY, 35,35);
  }
 
 if (keyPressed == true){  
   frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  image(images[(frame+offset) % numFrames], 0,0);
 
}

if(keyPressed == false){
   redraw();
} 
}

