
PImage slice;
PImage box;

float sliceWidth = 400;
float sliceHeight = 400;
float sliceOrig = 0;

float sliceX;
float sliceY;

float sliceR;
float sliceG;
float sliceB;

int sliceChange;


void setup() {
  size(800, 800);
  background(255);
  
  slice = loadImage("slice.png");
  sliceX = width/2;
  sliceY = width/2;
  
  box = loadImage("box.jpg");
  image (box, 0, 0, 800, 800);
}

void draw() {
  
  float speed = map(mouseX, 0, width, 1, 100);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount * speed));
    
    image(slice, sliceOrig, sliceOrig, sliceWidth, sliceHeight);
    
    if (sliceWidth == 400) {
      sliceChange = -1;
    } else if (sliceWidth == 1) {
      sliceChange = 1;
    }
    
    sliceWidth += (sliceChange);
    sliceHeight += (sliceChange);
    
    sliceOrig += sin(frameCount);
  
    
  
    
    
  
  



  /*
  pushMatrix();
  //float translateX = map(mouseX,0,width,0,width/2);
  //float translateY = map(mouseY,0,height,0,height/2);
  //translate(translateX,translateY);
  rotate(radians(frameCount * speed));
  image(slice, sliceX, sliceY, sliceWidth, sliceHeight);*/
  
  popMatrix();
  //popMatrix();

  
}



