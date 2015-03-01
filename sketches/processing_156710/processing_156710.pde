
PImage img;
int pixelX, pixelY;
float cube;



void setup(){
  size(600,600);
  img = loadImage("mountain.jpg");
  pixelX = 0;
  pixelY = 0;
  frameRate(30);
  cube=8;
}

void draw(){
  color pixelColor = img.get(pixelX,pixelY);
  float pixB = brightness(pixelColor);
  noStroke();
  fill(pixelColor);
  cube = map(sin(mouseX),-1,1,1,18);
  ellipse(pixelX,pixelY,cube, cube );
  
  if(pixelX < width){
    pixelX += 20;
  }
  else{
    pixelY += 20;
    pixelX = 0;
  }
  
  
 
//  imageMode(CENTER);
//  image(img, 300, 300, width, height);
  
  
}


