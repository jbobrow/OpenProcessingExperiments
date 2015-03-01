
//for this sketch I manipulated a sketch found at http://www.zenbullets.com called shimmer

DrawImage backgroundImage;
Pattern myPattern;

void setup() {
  size(500,750, P3D);
  backgroundImage = new DrawImage();
  myPattern = new Pattern();
 
  backgroundImage.placeBackground();
}

void draw() {

  myPattern.movePoint();
}
class DrawImage {
  void placeBackground() {
    PImage img;
    img = loadImage("img7.jpg");
    background(img);
    img.loadPixels();
    loadPixels();

    
  }
  
 
}



class Pattern {
  float xstart, xnoise, ystart, ynoise;

  void movePoint() {
    float signal;
    PImage img;
    img = loadImage("img7.jpg");

    int mx = constrain(mouseX, 0, img.width-1);
    int my = constrain(mouseY, 0, img.height-1);
    signal = my*img.width + mx;


    int sx = int(signal) % img.width;
    int sy = int(signal) / img.width;
    color c = img.get(sx, sy);
    xstart += 0.01;     
    ystart += 0.01;  
    xnoise = xstart;
    ynoise = ystart;
    translate(width/2, height/2, 0);
    for (int y = -200; y <= 200; y+=10) {
      ynoise += 1;
      xnoise = xstart;
      for (int x = -100; x <= 100; x+=5) {
        xnoise += 1;
        drawPoint(x, y, noise(xnoise, ynoise), c);
      }
    

   
    }
  }

 void drawPoint(float x, float y, float noiseFactor, color c) {
      pushMatrix();
      translate(x * noiseFactor * 4, y * noiseFactor * 4, -y);
      //noStroke();
      float edgeSize = noiseFactor * 5;
      noStroke();
      fill(c, 200);
      ellipse(0, 0, edgeSize, edgeSize);
      popMatrix();
    }}


