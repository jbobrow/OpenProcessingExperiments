
/* @pjs preload="bg.jpg"; */ 

PImage[] images;
PImage bg;
PImage randomImage;
float imageRotation;
float imageX;
float imageY;
float imageScaleWidth;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  frameRate(60);
  
  bg = loadImage("bg.jpg");
  image(bg, 0, 0, 800, 800);
  
  images = new PImage[62];
  
  for ( int i = 0; i < images.length; i++) {
    images[i] = loadImage(i + ".jpg");
  }
}

void draw() {
  imageRotation = random(-55, 55);
  imageX = random(50, 750);
  imageY = random(50, 750);
  imageScaleWidth = random(150, 250);
}

void mousePressed() {
  imageMode(CENTER);
  pushMatrix();
  translate(imageX, imageY);
  rotate(radians(imageRotation));
  filter(BLUR,.6);
  randomImage = images[int(random(62))];
  randomImage.resize((int)imageScaleWidth, 0);
  rectMode(CENTER);
  rect(0, 0, randomImage.width+6, randomImage.height+6);
  image(randomImage, 0, 0);
  popMatrix();
}



