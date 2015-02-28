
//Assignement 3
//52627887_Hung Wing Chu

int numFrames = 51;
int frame = 0;
PImage[] image = new PImage[numFrames];

void setup() {
  size(600, 600);
  frameRate(10);
  
  image[0] = loadImage("001-01.png");
  image[1] = loadImage("001-02.png");
  image[2] = loadImage("001-03.png");
  image[3] = loadImage("001-04.png");
  image[4] = loadImage("001-05.png");
  image[5] = loadImage("001-06.png");
  image[6] = loadImage("001-07.png");
  image[7] = loadImage("001-08.png");
  image[8] = loadImage("001-09.png");
  image[9] = loadImage("001-10.png");
  image[10] = loadImage("001-11.png");
  image[11] = loadImage("001-12.png");
  image[12] = loadImage("001-13.png");
  image[13] = loadImage("001-14.png");
  image[14] = loadImage("001-15.png");
  image[15] = loadImage("001-16.png");
  
  image[16] = loadImage("002-17.png");
  image[17] = loadImage("002-18.png");
  image[18] = loadImage("002-19.png");
  image[19] = loadImage("002-20.png");
  image[20] = loadImage("002-21.png");
  image[21] = loadImage("002-22.png");
  image[22] = loadImage("002-23.png");
  image[23] = loadImage("002-24.png");
  image[24] = loadImage("002-25.png");
  image[25] = loadImage("002-26.png");
  
  image[26] = loadImage("003-01.png");
  image[27] = loadImage("003-02.png");
  image[28] = loadImage("003-03.png");
  image[29] = loadImage("003-04.png");
  image[30] = loadImage("003-05.png");
  image[31] = loadImage("003-06.png");
  image[32] = loadImage("003-07.png");
  image[33] = loadImage("003-08.png");
  image[34] = loadImage("003-09.png");
  image[35] = loadImage("003-10.png");
  image[36] = loadImage("003-11.png");
  image[37] = loadImage("003-12.png");
  image[38] = loadImage("003-13.png");
  image[39] = loadImage("003-14.png");
  image[40] = loadImage("003-15.png");
  image[41] = loadImage("003-16.png");
  
  image[42] = loadImage("004-17.png");
  image[43] = loadImage("004-18.png");
  image[44] = loadImage("004-19.png");
  image[45] = loadImage("004-20.png");
  image[46] = loadImage("004-21.png");
  image[47] = loadImage("004-22.png");
  image[48] = loadImage("004-23.png");
  image[49] = loadImage("004-24.png");
  image[50] = loadImage("004-25.png");
  
}

void draw() {
  background(255);
  
  if (mousePressed == true) {
    frameRate(27);
  } else if (keyPressed == true) {
    frameRate(10);
  }
  
  //Speed up the speed with mouse pressed
  //Lower it down wuth key pressed
  
  frame = frame + 1;
  while (frame>=numFrames) {
    frame = 0;
  }
  
  image(image[frame], 0, 0);
}


