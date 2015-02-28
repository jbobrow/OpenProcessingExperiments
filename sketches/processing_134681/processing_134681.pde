
/* @pjs preload= "sd.jpg"; */
/* @pjs preload= "gd1.jpg"; */
/* @pjs preload= "ap1.png"; */
PImage sdImage;
PImage gd1Image;
PImage ap1Image;

void setup() {

  size(800, 300);

  sdImage = loadImage("sd.jpg");
  gd1Image = loadImage("gd1.jpg");
  ap1Image = loadImage("ap1.png");
}


void draw() {


  float sdX = map(mouseX, 0, width, 0, -30 );
  image(sdImage, sdX, 0);

  float gd1X = map(mouseX, 0, width, -100, -500 );
  image(gd1Image, gd1X, 200);

  float ap1X = map(mouseX, 0, width, -300, 1200 );
  image(ap1Image, ap1X, -50);
  frameRate(7); 
}



