
//Background photo property of Mark Leichtiter
//Used under Creative Common license
//http://www.flickr.com/photos/markleichliter/

/* @pjs preload="Table.jpg"; */

PImage backdrop;
PImage[] images;
PImage img;
int[] xArray;
int[] yArray;
int i;
int j;
int x;
int y;

void setup() {
  size(1024, 768);
  imageMode(CENTER);
  backdrop = loadImage("Table.jpg");
  image(backdrop, width/2, height/2);

  images = new PImage[52];
  for (int i = 0; i <images.length; i++) {
    images[i] = loadImage(i + ".jpg");
  }

  xArray = new int[4];
  xArray[0] = 602;
  xArray[1] = 322;
  xArray[2] = 494;
  xArray[3] = 749;
  yArray = new int[4];
  yArray[0] = 157;
  yArray[1] = 295;
  yArray[2] = 397;
  yArray[3] = 207;
}

void draw() {
  tint(255, 50);
  int m = frameCount;

  if (m % 50 == 0) {
    image(backdrop, width/2, height/2);
  }

  tint(255, 200);

  if (m % 50 == 0) {
    i++;
  }

  x = xArray[int(i % 4)];
  y = yArray[int(i % 4)];

  img = images[int(i % images.length)];

  image(img, x, y);
}



