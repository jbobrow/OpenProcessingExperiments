
int numFrames = 12;
int frame = 0;
int counter = 04;
PImage[] images = new PImage[numFrames];

int s;
int m;
int h;

int minutedigit;

void setup() {
  size(2000, 350);
  frameRate(2);
  for (int counter = 0; counter<11; counter=counter+1) {
    images[counter] = loadImage("IMG_42"+ nf(counter+4, 2) + ".JPG");
  }

  //s = second();
  m = minute();
  h = hour();
}

void draw() {

  //if (s != second()) {
  //println(second());
  //s = second();
  //}
  //if (m != minute()) {
  //println(minute());
  //m = minute();
  //}
  //if (h != hour()) {
  //println(hour());
  //h = hour();
  //}

  String theminute = nf(minute(), 2);
  println (theminute.charAt(0) + "and" + theminute.charAt(1)); 

// NEED TO WORK ON THIS PART TO MATCH STILL TO ACTUAL TIME 
//minutedigit = theminute.charAt(1);

if (frame = minutedigit) 
  String thehour = nf(hour(), 2);
  println(thehour.charAt(0) + "and" + thehour.charAt(1));



  frame++;
  if (frame==numFrames-1) {
    frame = 0;
  }
  image(images[frame], 0, 0, width/4, height);
  image(images[frame], 500, 0, width/4, height);
  image(images[frame], 1000, 0, width/4, height);
  image(images[frame], 1500, 0, width/4, height);
}

