
int sec;
float hour;
float minute;

PFont helvetica;

PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage ten;
PImage eleven;
PImage twelve;

void setup () {
  background(0);
  size(345, 357);
  sec = second();
  hour = hour();
  one = loadImage("one.jpg");
  two = loadImage("two.jpg");
  three = loadImage("three.jpg");
  four = loadImage("four.jpg");
  five = loadImage("five.jpg");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");
  ten = loadImage("ten.jpg");
  eleven = loadImage("eleven.jpg");
  twelve = loadImage("twelve.jpg");
  helvetica = loadFont("helvetica.vlw");
}

void draw () {
 
  if (hour == 1) {
    background(twelve);
  }

  if (hour == 0) {
    background(twelve);
  }

  if (hour == 2) {
    background(eleven);
  }

  if (hour == 23) {
    background(eleven);
  }

  if (hour == 3) {
    background(ten);
  }

  if (hour == 22) {
    background(ten);
  }

  if (hour == 4) {
    background(nine);
  }

  if (hour == 21) {
    background(nine);
  }

  if (hour == 5) {
    background(eight);
  }

  if (hour == 20) {
    background(eight);
  }

  if (hour == 6) {
    background(seven);
  }

  if (hour == 19) {
    background(seven);
  }

  if (hour == 7) {
    background(six);
  }

  if (hour == 18) {
    background(six);
  }

  if (hour == 8) {
    background(five);
  }

  if (hour == 17) {
    background(five);
  }

  if (hour == 9) {
    background(four);
  }

  if (hour == 16) {
    background(four);
  }

  if (hour == 10) {
    background(three);
  }

  if (hour == 15) {
    background(three);
  }

  if (hour == 11) {
    background(two);
  }

  if (hour == 14) {
    background(two);
  }

  if (hour == 12) {
    background(one);
  }

  if (hour == 13) {
    background(one);
  }
  
    
  textFont(helvetica);
  fill(0);
  textSize(25);
  text(hour() + "_" + minute(), 270, 350);
}


