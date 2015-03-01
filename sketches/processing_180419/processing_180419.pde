
PImage img;
float[] xCoord = new float[100];
float[] yCoord = new float[100];

void setup() {
  size(800, 530);
      img = loadImage("landscape.jpg");

  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height/2);
  }
}

void draw() {
  img.loadPixels();

  for (int i = 0; i < 100; i++) {
    
    int x = (int)xCoord[i];
    int y = (int)yCoord[i];
    int loc = x+y*width;
    color c = img.pixels[loc];
    stroke(c);
    strokeWeight(3);
    point(xCoord[i], yCoord[i]);
    yCoord[i] += 1;
    xCoord[i] += random(-1,1);
    if(yCoord[i] > height){
      yCoord[i] = 0;
      xCoord[i] = random(width);
    }
  }
}




