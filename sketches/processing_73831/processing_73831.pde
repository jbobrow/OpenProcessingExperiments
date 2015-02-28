
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

  images[1] = loadImage("player1.png");
  images[2] = loadImage("player2.png");
  images[3] = loadImage("mario1.png");
  images[4] = loadImage("mario2.png");
  images[5] = loadImage("mario3.png");
  images[6] = loadImage("mario4.png");
  images[7] = loadImage("mario5.png");
  images[8] = loadImage("mario6.png");
  images[9] = loadImage("player3.png");
  images[10] = loadImage("player4.png");
  images[11] = loadImage("halo1.png");
  images[12] = loadImage("halo2.png");
  images[13] = loadImage("halo3.png");
  images[14] = loadImage("halo4.png");
  images[15] = loadImage("player5.png");
  images[16] = loadImage("player6.png");
  images[17] = loadImage("player7.png");
  images[18] = loadImage("player8.png");
}

void draw() {
  frame = frame + 1;
  mario = mario + 1;
  play = play + 1;
  halo = halo + 1;
  gow = gow + 1;


  if (frame > 0) {  //mario vs. masterchief
    frameRate(0.5);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(x*.01+y*0.6, 0, 0);
        point(x, y);
      }
    }
    image(images[frame], 0, 0);
  }

  if (frame > 1) {  // round 1
    frameRate(1);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(x*.01+y*0.6, 0, x*.01+y*0.6);
        point(x, y);
      }
    }  
    image(images[frame], 0, 0);
  }


  if (frame > 2) {  //super mario bros
    frameRate(2);
  }

  if (frame > 8) {  //mario wins
    frameRate(0.5);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(0, x*.01+y*.06, x*.01+y*0.6);
        point(x, y);
      }
    }  
    image(images[frame], 0, 0);
  }


  if (frame > 9) {  //round 2
    frameRate(1);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(x*.01+y*0.6, 0, x*.01+y*0.6);
        point(x, y);
      }
    }  
    image(images[frame], 0, 0);
  }


  if (frame > 10) {  //halo combat evolved
    frameRate(1.5);
  }

  if (frame > 13) {  //master chief wins
    frameRate(1);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(0, x*.01+y*.06, x*.01+y*0.6);
        point(x, y);
      }
    }  
    image(images[frame], 0, 0);
  }


  if (frame > 14) {  //wait kratos
    frameRate(0.5);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(x*.01+y*0.6, 0, 0);
        point(x, y);
      }
    }
    image(images[frame], 0, 0);
  }


  if (frame > 15) {  //kratos kill
    frameRate(1);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(x*.01+y*0.6, x*.01+y*0.6, 0);
        point(x, y);
      }
    }
    image(images[frame], 0, 0);
  }


  if (frame > 18) {  //kratos wins
    frameRate(0.01);
    for (int x =0;x<992;x+=1) {
      for (int y=0;y<480;y+=1) {
        stroke(0, x*.01+y*.06, x*.01+y*0.6);
        point(x, y);
      }
    }  
    image(images[frame], 0, 0);
  }
}


