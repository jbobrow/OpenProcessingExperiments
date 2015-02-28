
/* Douglas Tran Feb 17 Creative Computing Rory Solomon */
/* @pjs preload= "mj.jpg"; */
/* @pjs preload= "shoes.jpg"; */
/* @pjs preload= "logo.jpg"; */
PImage mjImage;
PImage shoesImage;
PImage logoImage;

void setup() {
  
  size(600, 322);

  mjImage = loadImage("mj.jpg");
  shoesImage = loadImage("shoes.jpg");
  logoImage = loadImage("logo.jpg");
  
}


void draw() {


  float mjX = map(mouseX, 0,width, 0,-20 );
  image(mjImage, mjX,0);

  float shoesX = map(mouseX, 0,width, -10,-540 );
  image(shoesImage, shoesX,264);

  float logoX = map(mouseX, 0,width, 0, 500 );
  image(logoImage, logoX, 100);
  
}


