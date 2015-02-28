
/*
 * --=[VANISH]=--
 * by Jonsku, sometime in 2009
 * image from flickr :  http://www.flickr.com/photos/eyesore9/2895947823/
 * --
 * Move the mouse to make pixels vanish.
 * If you are REALLY bored, try to clear the entire image 
 */
class PixelSquare {
  
  int sqrLife;
  color couleur;
  int sqrX = 0;
  int sqrY = 0;
  int sqrW = 5;
  int maxW;
  int decay;
  int ySpeed;
  int xSpeed;
  int startDelay = 0;
  
  PixelSquare(color couleur, int startX, int startY){
      this.couleur = couleur;
      sqrX = startX;
      sqrY = startY;
      maxW = 50;
      decay = round(random(1,5));
      int d = random(1)>0.5?-1:1;
      ySpeed = round(d*random(1,5));
      d = random(1)>0.5?-1:1;
      xSpeed = round(d*random(1,5));
      sqrLife = round(random(decay*5,255));
      frameRate(30);
  }
  
  void update(){
    sqrLife -= decay;
    sqrW = constrain(sqrW+decay,1,maxW);
    sqrX += xSpeed;
    sqrY += ySpeed;
    if(sqrX > width || sqrY < 0 || sqrX < 0 || sqrY > height){
      sqrLife = 0;
    } 
  }
  
  void display(){
      fill(couleur,sqrLife);
      noStroke();
      ellipse(sqrX, sqrY, sqrW, sqrW);
      update();
  }
  
  boolean isAlive(){
    return sqrLife > 0;
  }
}

int l = 0;
PixelSquare[] grid;
PImage img = null;
String imageName = "bubble.jpg";

void setup()
{
  img = loadImage(imageName);
  //size(img.width,img.height);
  size(500,500);
  grid = new PixelSquare[img.pixels.length];
  smooth();
}

void reset(){
  l = 0;
  img = loadImage(imageName);
  grid = new PixelSquare[img.pixels.length];
}

void mouseMoved() {
  img.loadPixels();
  if(img.pixels[mouseX+mouseY*width]!=color(0) && l<height*width){
    grid[l++] = new PixelSquare(img.pixels[mouseX+mouseY*width], mouseX, mouseY);
    img.pixels[mouseX+mouseY*width] = color(0);
    img.updatePixels();
  }
}



void draw(){
  background(0);
  if(keyPressed) {
    if(key == 'r'){
      reset();
    }
  }
  image(img,0,0);
  img.loadPixels();
  for(int i=0;i<grid.length;i++){
    if(grid[i]!=null && grid[i].isAlive()){
      grid[i].display();
    }
  }
}

