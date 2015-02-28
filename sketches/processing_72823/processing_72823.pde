
int numFrames = 19;
int frame = 0;
int mario = 3;
int play = 8;
int halo = 10;
int gow = 14;
PImage[] images = new PImage[numFrames];

void setup() {
  size(992, 480);
  frameRate(1);

  images[1] = loadImage("players1.png");
  images[2] = loadImage("players2.png");
  images[3] = loadImage("mario1.png");
  images[4] = loadImage("mario2.png");
  images[5] = loadImage("mario3.png");
  images[6] = loadImage("mario4.png");
  images[7] = loadImage("mario5.png");
  images[8] = loadImage("mario6.png");
  images[9] = loadImage("players3.png");
  images[10] = loadImage("players4.png");
  images[11] = loadImage("halo1.png");
  images[12] = loadImage("halo2.png");
  images[13] = loadImage("halo3.png");
  images[14] = loadImage("halo4.png");
  images[15] = loadImage("players5.png");
  images[16] = loadImage("players6.png");
  images[17] = loadImage("players7.png");
  images[18] = loadImage("players8.png");
}

void draw() {
  frame = frame + 1;
  mario = mario + 1;
  play = play + 1;
  halo = halo + 1;
  gow = gow + 1;
  image(images[frame], 0, 0);

  if (frame > 0) {
    frameRate(0.5);
  }

  if (frame > 1) {
    frameRate(1);

    if (frame > 2) {
      frameRate(2);
    }

    if (frame > 8) {
      frameRate(0.5);
    }

    if (frame > 9) {
      frameRate(1);
    }

    if (frame > 10) {
      frameRate(1.5);
    }

    if(frame > 13) {
      frameRate(1);
    }
    
    if (frame > 14) {
      frameRate(0.5);
    }

    if (frame > 15) {
      frameRate(1);
    }  

    if (frame > 18) {
      frameRate(0.01);
    }
  }
}


