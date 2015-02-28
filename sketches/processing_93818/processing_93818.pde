
//import ddf.minim.analysis.*;
//import ddf.minim.*;

//Minim       minim;
//AudioPlayer song;
//FFT         fft;

float smoothedValue = 0;
int samples = 4;

float animationSize = 0;

Squares[] square;
int squareSize;
int numSquares;

Animation[] animations;
int numAnimations;

void setup() {
  size(800, 600);
  background(255);

//  minim = new Minim(this);
//  //song = minim.loadFile("die.mp3", 1024);
//  song = minim.loadFile("suburbs.mp3",1024);
//  //song = minim.loadFile("lazuli.mp3", 1024);
//  fft = new FFT( song.bufferSize(), song.sampleRate() );

  frameRate(7);
  rectMode(CENTER);
  imageMode(CENTER);

  noStroke();
  colorMode(HSB, 100);

  squareSize = 50;
  numSquares = (width/squareSize)*(height/squareSize);
  square = new Squares[numSquares];

  numAnimations = (width/50)*(height/50);

  animations = new Animation[numAnimations];

  int a = 0;

  for (int i = 25; i<width; i+=50) {
    for (int j = 25; j<height; j+=50) {
      int randomAnimation = int(random(0, 4));

      switch(randomAnimation) {
      case 0:
        animations[a] = new Animation("avion", 8, i, j, 50.0);
        break;

      case 1:
        animations[a] = new Animation("luz", 8, i, j, 50.0);
        break;

      case 2:
        animations[a] = new Animation("mierda", 7, i, j, 50.0);
        break;

      case 3: 
        animations[a] = new Animation("mosca", 10, i, j, 50.0);
        break;
      }
      a++;
    }
  }

  int b = 0;

  for (int i = squareSize/2; i<width; i+=squareSize) {
    for (int j = squareSize/2; j<height; j+=squareSize) {
      square[b] = new Squares(i, j, squareSize); 
      b++;
    }
  }

  //song.loop();
}

void draw() {

  background(0);

  //fft.forward( song.mix );
  
//    for (int i = 0; i<numSquares; i++) {
//    square[i].colorCycle();
//    square[i].display(squareSize);
//  }

//  for (int i = 0; i < fft.specSize(); i++) {
//    smoothedValue = smoothedValue + ((fft.getBand(i)*3 - smoothedValue)/samples);
//  }

  //animationSize = map(smoothedValue, 0, 5, 0.75, 1.5);
  animationSize = .85;

  for (int i = 0; i<numAnimations; i++) {
    animations[i].size = animationSize;
    // println(animations[i].size);
    //animations[i].resizeAnim();
    animations[i].display();
  }
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int x;
  int y;
  float size;

  Animation(String imagePrefix, int _ImageCount, int _x, int _y, float _size) {
    imageCount = _ImageCount;
    images = new PImage[imageCount];

    x = _x;
    y = _y;
    size = _size;
    frame = int(random(_ImageCount-1));

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + str(i) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void resizeAnim() {
    for (int i = 1; i < imageCount; i++) {
      // images[i].resize(size,size);
    }
  }

  void display() {
    pushMatrix();
    translate(x,y);
    scale(size);
    frame = (frame+1) % imageCount;
    image(images[frame], 0, 0);
    if (frame == imageCount-1) {frame = 0;}
    popMatrix();
  }

  int getWidth() {
    return images[0].width;
  }
}


class Squares {
  
  int x;
  int y;
  int size;
  float hue;
  float brightness;
  float initBrightness;
  int cycleTime;
  
  Squares(int _x, int _y, int _size) {
    
    x = _x;
    y = _y;
    
    size = _size;
    
    hue = random(100);
    brightness = random(20,70);
    initBrightness = brightness;
    
    cycleTime = int(random(400,700));
  }
  
  void display(int size) {
    
    fill(hue, 80, brightness);
    rect(x,y,size,size);
  }
  
  void colorCycle() {
    
    float t = millis()/cycleTime;
    
    brightness += (sin(t)*1.3);
  }
    
}


