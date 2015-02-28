
int numFrames = 12;  
int frame = 0;
PImage[] img = new PImage[numFrames];

void setup() {
  size(600, 600);
  frameRate(12);
  
  img[0]  = loadImage("The cars_001.png");
  img[1]  = loadImage("The cars_002.png"); 
  img[2]  = loadImage("The cars_003.png");
  img[3]  = loadImage("The cars_004.png"); 
  img[4]  = loadImage("The cars_005.png");
  img[5]  = loadImage("The cars_006.png"); 
  img[6]  = loadImage("The cars_007.png");
  img[7]  = loadImage("The cars_008.png"); 
  img[8]  = loadImage("The cars_009.png");
  img[9]  = loadImage("The cars_010.png"); 
  img[10] = loadImage("The cars_011.png");
  img[11] = loadImage("The cars_012.png"); 
}

void draw() { 
  background(255);
  frame = (frame+1) % numFrames;  
  int offset = 2;
  for (int x = 0; x < width; x += img[0].width) { 
    image(img[(frame+offset) % numFrames], x, -10);
    offset+=2;

    image(img[(frame+offset) % numFrames], x, 130);
    offset+=2;

    image(img[(frame+offset) % numFrames], x, 270);
    offset+=2;  

    image(img[(frame+offset) % numFrames], x, 410);
  }
}

void mouseReleased() {
  loop();  
}

void mousePressed() {
  noLoop();  
}


