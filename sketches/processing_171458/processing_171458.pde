
int savedTime;
int totalTime = 5000;

float ypos;
int count;
int state;

PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;

void setup() {
  size(128, 640);
  savedTime = millis();
  image1 = loadImage ("dclock1.png");
  image2 = loadImage ("dclock2.png");
  image3 = loadImage ("dclock3.png");
  image4 = loadImage ("dclock4.png");
  image5 = loadImage ("dclock5.png");
  image6 = loadImage ("skullicon.png");
}

void draw() {
  image (image1, 0, 0);
  image (image2, 0, 128);
  image (image3, 0, 256);
  image (image4, 0, 384);
  image (image5, 0, 512);
  int wastedTime = millis() - savedTime;
  if (wastedTime > totalTime) {
    println( " You are 5 seconds closer to death. " );
    savedTime = millis(); // Save the current time to restart the timer!
  }
  count++;
  if (count > 45.83) {
    count = 0;
    state++;
    if (state > 5) {
      state = 0;
    }
  }
  ypos = state * 128;
  image(image6, 48, ypos+48);
}



