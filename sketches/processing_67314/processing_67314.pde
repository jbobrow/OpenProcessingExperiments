

PImage clockwork;
PImage even;
PImage odd;
PFont timepiece;

float[] secEven = {
  0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58
};

float[] secOdd = {
  1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59
};

void setup() {
  clockwork = loadImage("clockwork.jpg");
  even = loadImage("even.png");
  odd = loadImage("odd.png");
  timepiece = loadFont("Timepiece.vlw");
  size(300, 353);
  smooth();
}

void draw() {
  image(clockwork, 0, 0);
  for (int i = 0; i < 30; i++) {
    if (second() == secEven[i]) {
      image(even, 190, 200);
    }
    else {
      if (second() == secOdd[i]) {
        image(odd, 190, 200);
      }
    }


    textFont(timepiece);

    text((hour() + "." + minute()), 150, 50);
  }
}


