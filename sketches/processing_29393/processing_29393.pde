
PImage img;



void setup() {
  size(640, 480);
  smooth();

  img = loadImage("bild2.jpg");
}

int circleSize = 3;

void draw() {
  randomSeed(0);
  translate(circleSize/2,circleSize/2);
  background(255);

  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {

    
      float circleSize2 = 0-brightness(img.get(i*circleSize, j*circleSize));
      float r = brightness(img.get(i*circleSize, j*circleSize))/100;
      
      fill(img.get(i*circleSize, j*circleSize) );
     // fill(0);
      
      pushMatrix();
     translate(i*circleSize, j*circleSize);
     
      rect(0,5, circleSize2/15*2, circleSize2/15*1);
      popMatrix();  
  }
  }

 // image(myCapture,0,0);
}





