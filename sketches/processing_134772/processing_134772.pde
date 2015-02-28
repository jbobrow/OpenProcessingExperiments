
/* @pjs preload= "Parallax_Landscape_Layer.png", "Parallax_Layer_G.png", "Parallax_Layer_W.png", "Hzontal_vol2.png"; */

PImage blackImage;
PImage greyImage;
PImage whiteImage;
PImage hzImage;
//PImage paintImage;

void setup() {

  size(800, 600);

  blackImage = loadImage("Parallax_Landscape_Layer.png");
  greyImage = loadImage("Parallax_Layer_G.png");
  whiteImage = loadImage("Parallax_Layer_W.png");
  hzImage = loadImage("Hzontal_vol2.png");
//  paintImage = loadImage("Parallax_Paint.png");
}


void draw() {

  float c = map(mouseX, 0, width, 175, 10);
  background(80, 80, 80);

  float blackX = map(mouseX, 0, width, 0, -20 );
  image(blackImage, blackX, 150);

  //  float hzX = map(mouseX, 0, width, 0, -30 );
  //  image(hzImage, hzX, 180);

  float greyX = map(mouseX, 0, width, -20, -200 );
  image(greyImage, greyX, 200);

  //  float hzX = map(mouseX, 0, width, -20, -200 );
  //  image(hzImage, hzX, 200);

  float hzX = map(mouseX, 0, width, 0, -2000 );
  image(hzImage, hzX, 225);

  float whiteX = map(mouseX, 0, width, 0, -2000 );
  image(whiteImage, whiteX, 225);

//  float paintX = map(mouseX, 0, width, 0, -2000 );
//  image(paintImage, paintX, 225);
}



