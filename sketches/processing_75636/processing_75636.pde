
PImage img;
int mySize = 6;
 
void setup() {
  size(432, 768);
  noStroke();
  img = loadImage("P1110132.JPG");
  image(img, 0, 0);
  loadPixels();
  rectMode(CENTER);
  smooth();
}

void draw(){
  for(int a = 0; a < height; a+=mySize) {  
    for(int b = 0; b < width; b+=mySize) {  
      color c = pixels[a * width + b];
      fill(c, 1);
      pushMatrix();
      translate(b, a);
      rotate(brightness(c));
      rect(0, 0, brightness(c), 20);
      popMatrix();
      
    }
  }
}


