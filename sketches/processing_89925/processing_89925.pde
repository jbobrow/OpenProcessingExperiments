
//Tried out some pointillism after seeing this bit of excellent code: http://www.openprocessing.org/sketch/82033

PImage seurat;
PImage cameron;
int pointillize=5; //points have height and width of 5

void setup() {
  size(300,300);
  seurat=loadImage("Seurat-Sunday-in-the-Park-with-George.jpg");
  cameron=loadImage("cameronfrye.jpg");
  background(255);
  smooth();
}

//Drawing the pixelization

void draw() {
  int x=int(random(seurat.width)); 
  int y=int(random(seurat.height));
  int loc=x+y*seurat.width;
  
  loadPixels();
  float r=red(seurat.pixels[loc]);
  float g=green(seurat.pixels[loc]);
  float b=blue(seurat.pixels[loc]);
  noStroke();
  
  fill(r,g,b,100);
  rect(x,y,pointillize,pointillize);
  
  //when someone clicks anywhere, Cameron replaces the image
  
  if (mousePressed) { 
  image(cameron, 0, 0);
  noLoop();
     }
  
  
}


