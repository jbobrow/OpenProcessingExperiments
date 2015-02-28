
/* @pjs preload = "one.png, two.png, three.png, four.png, five.png, six.png";*/

int a1 = 0;
int a2 = 0;
int a3 = 0;
int a4 = 0;
int a5 = 0;
int a6 = 0;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;

void setup() {
  size(700,700);
  background(255,255,255);
  one = loadImage("one.png");
  two = loadImage("two.png");
  three = loadImage("three.png");
  four = loadImage("four.png");
  five = loadImage("five.png");
  six = loadImage("six.png");
};

void draw() {
  //Images
  smooth();
  noStroke();
  
  tint(255,a1);
  image(one, 0,0);
  tint(255,a2);
  image(two, 0,0);
  tint(255,a3);
  image(three, 0,0);
  tint(255,a4);
  image(four, 0,0);
  tint(255,a5);
  image(five, 0,0);
  tint(255,a6);
  image(six, 0,0);
}

void keyPressed() {
  if (key == '1') {
    a1 = a1 + 10;
  }
  if (key == '2') {
    a2 = a2 +10;
  }
  if (key == '3') {
    a3 = a3 + 10;
  }
  if (key == '4') {
    a4 = a4 + 10;
  }
  if (key == '5') {
    a5 = a5 + 10;
  }
  if (key == '6') {
    a6 = a6 + 10;
  }
};

//press and hold down 1 - 6 keys to reveal image//


