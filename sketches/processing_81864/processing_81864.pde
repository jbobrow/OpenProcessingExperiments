
PImage img;
int pixelSize = 460;
int timeStep;

void setup() {
  size(450,350);
  img = loadImage("meital28-9-12.png");
  imageMode(CENTER);
  noStroke();
}


void draw() {
  image(img,width/2,height/2);
  loadPixels();
  for(int i=0; i<height; i+=pixelSize) {
    
    for(int j=0; j<width; j+=pixelSize) {
      
      color c = pixels[i*width + j];
      fill(c);
      rect(j,i,pixelSize,pixelSize);
    }
    
  }
  
  if(timeStep++ % 30 == 0) {
    if(pixelSize-- < 1) {
      pixelSize = 1;
    }
  }

//  for(int i=0; i<30; i++) {
//  
//    int randPix = floor( random(width * height));
//    
//    pixels[randPix] = color(0,0,0);
//  }
  
}


