
PImage[] myImage;//PImage is used to store an image in memory
float scaleOfImage;//current scale of the image
PImage bgImage; //display window image
int selectedImageNum;



void setup () {
  size (800, 800);
  
  //allocate a new array with space for two images
  myImage = new PImage[2];//this array contains two images read from disk
  myImage[0] = loadImage ("Katie.jpg");
  myImage[1] = loadImage ("Penny.JPG");
  bgImage = createImage (width, height, RGB);//contains an empty RGB image same size as window
  
  //set initial scale to be 0.1 and use first image
  scaleOfImage = 0.4;
  selectedImageNum = 0;
}
  
void draw () {
  background (bgImage);//new kind of argument for background - image
  
  //left and right arrow keys to scale the image
  
  if (keyPressed) {
    if (keyCode == LEFT) {
      scaleOfImage -= 0.01;//pressing left key makes image get smaller
    }
    else if (keyCode == RIGHT) {
      scaleOfImage += 0.01;//pressing right key makes image get bigger
  
  }
}

//draw image according to current scale and mouse position
pushMatrix();
translate(mouseX, mouseY);
float scaleValue = constrain(scaleOfImage, 0.05, 6);
scale (scaleValue);
imageMode (CENTER);
image (myImage[selectedImageNum], 0, 0); 
popMatrix();

//if the mouse is pressed, load the image into the main background image
if (mousePressed) {
  loadPixels();
  bgImage.pixels = pixels;
  bgImage.updatePixels();
}
}

void keyReleased () {
  if (key == 'd') {
    bgImage = createImage(width, height, HSB);
    
  }
  else if (key == 'k') {
    selectedImageNum = 0;
  }
  else if (key == 'p') {
    selectedImageNum = 1;
  
}
}



