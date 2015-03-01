
/* @pjs preload="jungle.jpg, bat.png";  */

PImage bImg, img;

void setup() {
  // load the image file from the "data" folder
  bImg = loadImage("jungle.jpg");
  bImg.resize(1000,562);
  img = loadImage("bat.png");
  img.resize(100,0);
  // set the window to be the same dimensions as the image
  size(500, 281);
  imageMode(CENTER);
  noCursor();
}

void draw() {
  // display the image so that its upper-left corner
  // is on the upper-left corner of the screen
  //background(bImg);
  image(bImg,0,0);
  image(img, mouseX, mouseY);
}



