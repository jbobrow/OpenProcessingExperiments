
/* @pjs preload= "eye-000.jpg,eye-001.jpg,eye-002.jpg,eye-003.jpg,eye-004.jpg,eye-005.jpg,eye-006.jpg,eye-007.jpg,eye-008.jpg,eye-009.jpg"; */

int numFrames = 9;
PImage[] images = new PImage[numFrames];

void setup() {
  size(300,500);
  frameRate(30); 
  for (int i = 0; i < images.length; i++) {
    String imageName = "eye-" + nf(i, 3) + ".jpg";
    images[i] = loadImage(imageName);
  }
}

void draw() {
  int frame = frameCount % numFrames;
  image(images[frame], 0, 0, 300, 500);
  fill(0);
  rect(0, 0, 300, 260);
  rect(0, 400, 300, 500);
  rect(0, 260, 100, 400);
  rect(240, 260, 300, 500);
}


