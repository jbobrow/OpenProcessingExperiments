
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
PImage background1;

void setup() {
  size(1191,842);
  one = loadImage("1.png");
  two = loadImage("2.png");
  three = loadImage("3.png");
  four = loadImage("4.png");
  five = loadImage("5.png");
  six = loadImage("6.png");
  seven = loadImage("7.png");
  eight = loadImage("8.png");
  nine = loadImage("9.png");
  ten = loadImage("10.png");
  eleven = loadImage("11.png");
  twelve = loadImage("12.png");
  background1 = loadImage("background.png");
}

void draw() {
  
  
  int hours = hour();
  if(hours > 12){
    hours = hour() - 12;
    background(4,48,85);
  }else{
    background(155,209,255);
  }
  image(background1,0,0);
  //println(hours);
  //println(hour());
  //int hours = hour();
  if(hours == 1){
    image(one,0,0);
  }else if(hours == 2) {
    image(two,0,0);
  }else if(hours == 3) {
    image(three,0,0);
  }else if(hours == 4) {
    image(four,0,0);
  }else if(hours == 5) {
    image(five,0,0);
  }else if(hours == 6) {
    image(six,0,0);
  }else if(hours == 7) {
    image(seven,0,0);
  }else if(hours == 8) {
    image(eight,0,0);
  }else if(hours == 9) {
    image(nine,0,0);
  }else if(hours == 10) {
    image(ten,0,0);
  }else if(hours == 11) {
    image(eleven,0,0);
  }else if(hours == 12) {
    image(twelve,0,0);
  }
  
  
  //watch 1
  fill(255);
  strokeWeight(10);
  ellipse(420, 750, 150,150);
  
  textSize(60);
  fill(0, 102, 153);
  text(minute(), 385, 770);
  
  //watch 1
  fill(255);
  strokeWeight(10);
  ellipse(820, 750, 150,150);
  
  textSize(60);
  fill(0, 102, 153);
  text(second(), 780, 770);
  
}


