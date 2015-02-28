
PImage face, blink, eyeLeft, eyeRight, eyebrows, reflections;
PImage[] newEyebrows;
import processing.video.*; 
Capture video;
color trackColor;

float eyeLeftX, eyeLeftY, eyeRightX, eyeRightY;
float eyebrowYDown, eyebrowY = 0;
float eyebrowScew = 15, eyebrowScewDown;

int blinkLength = 5, blinkNum = 0;


void setup() {
  face = loadImage("face.png");
  blink = loadImage("blink.png");
  eyeLeft = loadImage("eye-left.png");
  eyeRight = loadImage("eye-left.png");
  eyebrows = loadImage("eyebrows.png");
  reflections = loadImage("reflections.png");



  size (600, 240);
  video = new Capture (this, width, height, 30); 
  trackColor = color(random(255));
  smooth();

  newEyebrows = new PImage[30];

  for (int s = 0; s < 30; s++) {
    newEyebrows[s] = warpEyebrows(eyebrows, s);
  }

  size(face.width, face.height);
  frameRate(60);
  noCursor();
}

void draw() {
  background(255);

  if (video.available()) {
    video.read();
  }
  video.loadPixels(); 
  image(video, 0, 0); 
  float best = 500; 
  int cX = 0;
  int cY = 0;
  for (int x=0; x < video.width; x++) {
    for (int y=0; y < video.height; y++) { 
      int loc = x + y*video.width;
      color nowColor = video.pixels[loc]; 
      float r1 = red(nowColor);
      float g1 = green(nowColor);
      float b1 = blue(nowColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);
      float d = dist(r1, g1, b1, r2, g2, b2); 
      if (d < best) {
        best = d; 
        cX = x; 
        cY = y;
      }
    }
  }


  if (frameCount0 == 0 && random(10) > 5) {

    blinkNum = blinkLength;
  }


  image(reflections, 0, 0);
  if (blinkNum > 0) {

    blinkNum -= 1;
    image(blink, 0, 0);
  } 
  else {
    image(face, 0, 0);
  }
  image(newEyebrows[29-(int)eyebrowScew], 0, eyebrowY);
}


PImage warpEyebrows(PImage source, int scewNum) {

  int w = source.width, h = source.height;
  PImage destination = new PImage(w, h, ARGB);
  source.loadPixels();
  destination.loadPixels();

  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {

      int newX, newY;
      newX = x;
      newY = (int)(y+abs(x - w/2) * (0.15-(float)scewNum/100));

      color c;

      if (newX >= w || newX < 0 ||
        newY >= h || newY < 0) {
        c = color(0, 0);
      } 
      else {
        c = source.pixels[newY*w + newX];
      }
      destination.pixels[y*w+x] = c;
    }
  }
  return destination;
}
