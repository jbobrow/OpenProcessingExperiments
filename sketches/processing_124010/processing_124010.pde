
int numFrames = 12;
int frame = 0;
int counter = 04;
PImage[] images = new PImage[numFrames];

int lastMinute;
int lastSecond;
int lastHour;

void setup() {
  size(2000, 350);
  frameRate(2);
  for (int counter = 0; counter<11; counter=counter+1) {
    images[counter] = loadImage("IMG_42"+ nf(counter+4, 2) + ".JPG");
  }
  
  lastSecond = second();
  lastMinute = minute();
  lastHour = hour();
 
}

void draw() {

if (lastSecond != second()) {
    println(second());
    lastSecond = second();
  }
  if (lastMinute != minute()) {
    println(minute());
    lastMinute = minute();
  }
  if (lastHour != hour()) {
    println(hour());
    lastMinute = hour();
  }

 
  frame++;
  if (frame==numFrames-1) {
    frame = 0;
  }
  image(images[frame], 0, 0, width/4, height);
  image(images[frame], 500, 0, width/4, height);
  image(images[frame], 1000, 0, width/4, height);
  image(images[frame], 1500, 0, width/4, height);
  // Displays the image at point (100, 0) at half of its size
  // image(a, 0, 0, a.width/5, a.height/5);
  //image(b, 1000, 0, b.width/5, b.height/5);
}

