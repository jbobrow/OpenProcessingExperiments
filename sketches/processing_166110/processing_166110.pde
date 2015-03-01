
int numFrames = 23; // The number of animation frames
PImage[] images = new PImage[numFrames]; // Image array

void setup() {
size(500, 500);
frameRate(20); 
for (int i = 0; i < images.length; i++) {

String imageName = "ani-" + nf(i, 3) + ".png";
images[i] = loadImage(imageName);
}
}
void draw() {
  background (255);

int frame = frameCount % numFrames;
image(images[frame], mouseX-50, mouseY-50);
}


