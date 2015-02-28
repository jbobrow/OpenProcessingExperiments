
PImage backgroundImage;
PImage middleImage;
PImage foregroundImage;

void setup() {
  
  size(800,500);

  backgroundImage = loadImage("background.jpg");
  middleImage = loadImage("middleground.jpg");
  foregroundImage = loadImage("foreground.jpg");
  
}


void draw() {

 
  float bgX = map(mouseX, 0,width, 0,800 );
  image(backgroundImage, bgX,0);

  float middleX = map(mouseX, 0,width, 0,-200 );
  image(middleImage, middleX,225);

  float fgX = map(mouseX, 0,width, 0,-2000 );
  image(foregroundImage, fgX, 400);
  
}





