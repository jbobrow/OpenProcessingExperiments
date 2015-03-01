
int numFrames = 8;  // The number of frames in the animation
int currentFrame = 0;

PImage[] myImageArray = new PImage[numFrames];



void setup() {
  size(800,600);


myImageArray[0] = loadImage("IMG_1853.jpg");
  myImageArray[1] = loadImage("IMG_1854.jpg");
  myImageArray[2] = loadImage("IMG_1855.jpg");
  myImageArray[3] = loadImage("IMG_1856.jpg");
  myImageArray[4] = loadImage("IMG_1857.jpg");
  myImageArray[5] = loadImage("IMG_1858.jpg");
  myImageArray[6] = loadImage("IMG_1859.jpg");
  myImageArray[7] = loadImage("IMG_1860.jpg");
 
frameRate(10);
}

void draw() {
  background(0);
  currentFrame = (currentFrame+1 % numFrames);  // Use % to cycle through frames
  int offset = 0;
  for (int x = 0; x < width; x += myImageArray[0].width) { 
    image(myImageArray[(currentFrame+offset) % numFrames],0,0,800,600);

  
 }
//println(currentFrame);
}


