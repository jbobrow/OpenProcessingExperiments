
//Li Cheuk Hin 53077582
//Assignment 3

int framenum = 12; 
int frame = 0; 
PImage[] images = new PImage[framenum];

void setup() {
  size(854, 570);
  frameRate(30);

  images[0]  = loadImage("0.jpg");
  images[1]  = loadImage("1.jpg"); 
  images[2]  = loadImage("2.jpg");
  images[3]  = loadImage("3.jpg"); 
  images[4]  = loadImage("4.jpg");
  images[5]  = loadImage("5.jpg"); 
  images[6]  = loadImage("6.jpg");
  images[7]  = loadImage("5.jpg");
  images[8]  = loadImage("4.jpg"); 
  images[9]  = loadImage("3.jpg");
  images[10]  = loadImage("2.jpg"); 
  images[11]  = loadImage("1.jpg");
}

void draw() { 
  background(0);
  frame = (frame+1) % framenum;
  for (int x = 0; x < width; x += images[0].width) { 
    image(images[(frame+1) % framenum], x, 0);
  }
}



