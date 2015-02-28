
PImage img;
int numFrames = 7;  
int frame = 0;
PImage[] images = new PImage[numFrames];
int seconds = 1;
float pointillize = 13;

void setup() {
  size(1280, 720);
  frameRate(10);
  imageMode(CENTER);
  noStroke();
  background(255);
  images[0] = loadImage ("matreyek.jpg");
  images[1] = loadImage ("mcleod2.jpg");
  images[2] = loadImage ("murry2.jpg");
  images[3] = loadImage ("cuppetelli2.jpg");
  images[4] = loadImage ("monaghan2.jpg");
  images[5] = loadImage ("prudence2.jpg");
  images[6] = loadImage ("edplogo2.jpg");
}

void draw() { 
  
  if (frameCount%200 == 0) {
    frame = frame + 1;
  }
  if (frame>=numFrames) {
    frame=0;
  }
  
  for (int i = 0; i < 400; i++) {
    //image(images[frame], 50, 50);
    int x = int(random(width));
    int y = int(random(height));
    color pix = images[frame].get(x, y);
    fill(pix, 250);
    ellipse(x, y, pointillize, pointillize);
  }
}



