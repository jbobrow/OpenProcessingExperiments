
PImage img;
int pointillize = 200;

//Resolution
int rezX = 1544;
int rezY = 2074;

//Resolution Convertion
//Calculating percentage based on resolution of x-axis
float prX (float intX){
  float percent = intX / 100;
  float x = rezX * percent;
  return(x);
}
 
//Calculating percentage based on resolution of y-axis
float prY (float intY){
  float percent = intY / 100;
  float y = rezY * percent;
  return(y);
}

void pixelize(int x, int y){

  x = - 50;
  while (x <= 1544){
  x = x + 50;

 
 
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  rect(x,y,pointillize,pointillize);
  }
}

void setup() {
  size(1544,2074);
  img = loadImage("obama.jpg");
  smooth();
 
}

void draw(){
  image(img,0,0);
  int y = -50;
 while (y < 1544){
   y = y +50;
   pixelize(0,y);
 }
}
  
    




