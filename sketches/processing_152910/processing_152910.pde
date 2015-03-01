
/* @ pjs preload="sample_01.png,sample_02.png,img.png"; */
PImage[] myImage;    // PImage is used to store an image in memory
float scaleOfImage;  // current scale of the image
PImage bgImage;      // display window image
int selectedImageNum;
 
void setup() {
  size(800, 800);  
  frameRate(200);
  // allocate a new array with space for two images
  myImage = new PImage[2];
  myImage[0] = loadImage("sample_01.png");
  myImage[1] = loadImage("sample_02.png");
  bgImage = loadImage("img.png");
  //loadImage("img.png");
  // set initial scale to be 0.5 and use the first image (index 0)
  scaleOfImage = 0.5;
  selectedImageNum = 0;
}
 
void draw() {
  // note this new kind of arguement to background - an image!
  imageMode(CORNER);
   background(bgImage);
  // left and right arrow keys to scale the image
  if ( keyPressed ) {
    if (keyCode == LEFT) {
      scaleOfImage -= 0.01;
    } 
    else if (keyCode == RIGHT) {
      scaleOfImage += 0.01;
    }
  }
 
  // draw image accorinding to current scale and mouse position
  pushMatrix();
  translate(mouseX, mouseY);
  float scaleValue = constrain(scaleOfImage, 0.05, 6);
  scale(scaleValue); 
  rotate(radians(frameCount));
  imageMode(CENTER);
  image(myImage[selectedImageNum], 0, 0);
  popMatrix();
 
  // if the mouse is pressed load the image into the main background image
  if (mousePressed) {  
    bgImage=get();    
  }
 bgImage.copy(1,1,width-1,height-1,0,0,width,height);
}
 
void keyReleased() {
  if (key == 'd') {
    bgImage = loadImage("img.png");
  }
  else if (key == '1') {
    selectedImageNum = 0;
  }
  else if (key == '2') {
    selectedImageNum = 1;
  }
}

