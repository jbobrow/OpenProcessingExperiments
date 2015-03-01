
/* @pjs preload="ani_0.png,ani_1.png,ani_2.png,ani_3.png,ani_4.png,
ani_5.png,ani_6.png,ani_7.png,ani_8.png"; */

int numFrames = 9; // The number of animation frames
PImage[] images = new PImage[numFrames]; // Image array

void setup() {
  size(535,475);
  for (int i = 0; i < images.length; i++) {
    String imageName = "ani_" + (i) + ".png";
    images[i] = loadImage(imageName);
  }
}

void draw() {
  int frame = int(random(0, numFrames));
  image(images[frame], -2, -2,540,480);
  frameRate(random(1,60.0));
}


