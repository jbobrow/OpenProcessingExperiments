
int numFrames = 12;
int frame = 0;
PImage[] Doggie = new PImage[numFrames];
PImage[] Pizza = new PImage[numFrames];
PImage[] Pop = new PImage[numFrames];
PImage[] Love = new PImage[numFrames];

void setup() {
  size(800, 500);
  frameRate(24);
  imageMode(CENTER);
  for (int i = 0; i < numFrames; i++) {
     String imageName = "Doggie" + nf(i, 4) + ".png";
     Doggie[i] = loadImage(imageName);
  }
   imageMode(CENTER);
  for (int i = 0; i < numFrames; i++) {
     String imageName = "Love" + nf(i, 4) + ".png";
     Love[i] = loadImage(imageName);
  } 
  imageMode(CENTER);
  for (int i = 0; i < numFrames; i++) {
     String imageName = "Pizza" + nf(i, 4) + ".png";
     Pizza[i] = loadImage(imageName);
  }
  imageMode(CENTER);
  for (int i = 0; i < numFrames; i++) {
     String imageName = "Pop" + nf(i, 4) + ".png";
     Pop[i] = loadImage(imageName);
  } //2
} //1

void draw() {
  frame = (frame+1) % numFrames;
  int offset = 0;
  if (mousePressed == false) {
          background(255);

      imageMode(CENTER);
      image(Doggie[(frame+offset) % numFrames], 400, 250, 500, 500);
    } //3
if (mousePressed) { //2
      if(mouseButton == LEFT ) {
      background(255);
      image(Love[(frame+offset) % numFrames], 400, 250, 500, 500);
      image(Pizza[(frame+offset) % numFrames], mouseX, mouseY, 100, 300);
      }
      if(mouseButton == RIGHT) {
      background(255);
      image(Love[(frame+offset) % numFrames], 400, 250, 500, 500);
      image(Pop[(frame+offset) % numFrames], mouseX, mouseY, 100, 150);
      }
     }
}


