
PFont times;
PFont arial;
PImage smile;
float ypos,xpos,example,fade,b1,b2,b3;
int savedTime;
int Timer1 = 12;
int Timer2 = 16;
int Timer3 = 18;
int Timer4 = 19;
int Timer5 = 20;
int Timer6 = 21;
int Timer7 = 22;
int Timer8 = 23;
int Timer9 = 24;
int Timer10 = 25;
int Timer11 = 26;
int Timer12 = 27;

void setup() {
  smile = loadImage("Big_smile.png");
  fade = 99;
  b1 = 0;
  b2 = 0;
  b3 = 0;
  frameRate(30);
  size(700,700);
  savedTime = second();
  times = createFont("Times New Roman",3);
  arial = createFont("Arial",3);
  colorMode(HSB);
}

void draw() {
  int passedTime = second() - savedTime;
  background(b1,b2,b3);
  if (passedTime < Timer4) {
    fill(255,0,fade);
    textFont(times,50);
    text("Skinny",20,150+ypos);
    text("Quiet",340,150+ypos);
    text("Nerdy",190,600-ypos);
    text("Glasses",500,600-ypos);
    ypos++;
  }
  
  if (passedTime > Timer1) {
    fade-=10;
    }
  if (passedTime > Timer2) {
    fade=0;
    }
  if (passedTime > Timer3) {
    }
  if (passedTime > Timer5) {
    b1+=37;
    b2+=99;
    b3+=99;
  }
  if (passedTime > Timer6) {
    fill(255);
    textFont(arial,50);
    text("Funny",10,50);
  }
  if (passedTime > Timer7) {
    fill(255);
    textFont(arial,100);
    text("Sports",300,310);
    text("Lover",310,380);
  }
  if (passedTime > Timer8) {
    fill(255);
    textFont(arial,150);
    text("Outgoing",50,600);
  }
  if (passedTime > Timer9) {
    fill(255);
    textFont(arial,70);
    text("Caring",450,90);
  }
  if (passedTime > Timer10) {
    fill(255);
    textFont(arial,90);
    text("Smile",50,300);
  }
  if (passedTime > Timer11) {
    image(smile,110,100,100,100);
  }
  if (passedTime > Timer12) {
    noLoop();
  }
}


