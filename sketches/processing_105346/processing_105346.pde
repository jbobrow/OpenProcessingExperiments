
//declare images & fonts
PImage dog;
PImage cat;
PFont H;
PFont T;
boolean buttonD;
boolean buttonC;

//declare values
int headx;
int heady;

int track1;
int track2;
int yposD;
int yposC;
int baseline;

int baselineW;

int dis;
int buttonW;
int buttonH;

int trackL;

int xposTime1;
int xposTime2;
int baselineT;

void setup() {
  size(600, 600);

  //load images
  dog=loadImage("dog.gif");
  cat=loadImage("cat.gif");

  //load font
  H=loadFont("H.vlw");
  T=loadFont("T.vlw");

  //locate items
  headx=width/2;
  heady=50;

  track1=200;
  track2=400;
  baseline=400;

  baselineW=480;

  dis=50;
  buttonW=60;
  buttonH=24;

  trackL=250;

  xposTime1=200;
  xposTime2=400;
  baselineT=100;
  
  buttonD=false;
  buttonC=false;
}

void draw() {
  background(200);

  //draw text
  textAlign(CENTER, CENTER);
  textFont(H, 20);
  fill(0);
  text("Animal Race", headx, heady);
  text("DOG", track1, baselineW);
  text("CAT", track2, baselineW);


  //draw tracks
  stroke(160);
  strokeWeight(30);
  line(track1, baseline, track1, baseline-trackL);
  line(track2, baseline, track2, baseline-trackL);

  //draw images
  imageMode(CENTER);
//  yposD=baseline;
//  yposC=baseline;
//  image(dog, track1, yposD);
//  image(cat, track2, yposC);


  //draw buttons

  stroke(230);
  strokeWeight(4);
  rectMode(CENTER);
  rect(track1, baselineW+dis, buttonW, buttonH);
  rect(track2, baselineW+dis, buttonW, buttonH);

  if (buttonD==false) {
    image(dog, track1, baseline);
  }
  else {
    image(dog, track1, baseline-trackL);
  }
  if (buttonC == false) {
    image(cat, track2, baseline);
  }
  else {
  image(cat, track2, baseline-trackL);
  }
}

void mouseClicked() {
  if (mouseX > track1-buttonW/2 && mouseX < track1+buttonW/2
    && mouseY > baselineW+dis-buttonH/2 && mouseY < baselineW+dis+buttonH/2) {
    buttonD = !buttonD;
    println(buttonD);
  }
  if (mouseX > track2-buttonW/2 && mouseX < track2+buttonW/2
    && mouseY > baselineW+dis-buttonH/2 && mouseY < baselineW+dis+buttonH/2) {
    buttonC = !buttonC;
    println(buttonC);
  }
}


