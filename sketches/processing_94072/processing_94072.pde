

PImage monImage;

void setup() {
  size(400,400);
  smooth();
  
  monImage = loadImage("frame_"+"0000.png");
  
}


void draw() {
  background(100);
  
  imageMode(CENTER);
  image( monImage , mouseX , mouseY, monImage.width *2 , monImage.height*2);
  
}




