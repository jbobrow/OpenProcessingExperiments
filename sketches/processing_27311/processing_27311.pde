
PImage img;
int hpc = 0;
int vpc = 0;


void setup() {
  size(500,500);
  smooth();
  

  
  img = loadImage("crystal2.png");
}


void draw() {
  
  
   
  if(isOverImage(0,0,img,mouseX,mouseY, 120))
   {
    background(0);
  }
  else { 
    background(255);
  }

  image(img, hpc,vpc);
}







boolean isOverImage(int imgX, int imgY, PImage img, int x, int y, int tolerance) {
  
  

  img.loadPixels();

  int posX = x - imgX;
  int posY = y - imgY;

  if(posX < 0 || posX > img.width || posY < 0 || posY > img.height)
    return false;
  else {
    int i = posY*img.width+posX;
    // println(alpha(img.pixels[i]));


    if(alpha(img.pixels[i]) > tolerance) {
      return true;
    }
    else {
      return false;
    }
  }
}


