
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;


PImage pageTitle;
PImage pageOne;
PImage pageTwo;
PImage pageThree;
PImage pageFour;
PImage pageFive;
PImage pageSix;
PImage pageSeven;
PImage pageEight;
PImage pageTheEnd;

int nativeOneX;
int nativeOneY;

int pageNumber = 0;
int pageNumber1 = 1;
int pageNumber2 = 2;
int pageNumber3 = 3;
int pageNumber4 = 4;
int pageNumber5 = 5;
int pageNumber6 = 6;
int pageNumber7 = 7;
int pageNumber8 = 8;
int pageNumber9 = 9;
int pageNumber10 = 10;

//////////////////////
void setup() {
  size(1019, 558);
  pageTitle = loadImage("title1.jpg");
  pageOne = loadImage("pageOne.jpg");
  pageTwo = loadImage("pageTwo.jpg");
  pageThree = loadImage("pageThree.jpg");
  pageFour = loadImage("pageFour.jpg");
  pageFive = loadImage("pageFive.jpg");
  pageSix = loadImage("pageSix.jpg");
  pageSeven = loadImage("pageSeven.jpg");
  pageEight = loadImage("page8.jpg");
  pageTheEnd = loadImage("theEnd1.jpg");
  
  nativeOneX = width/2;

  minim = new Minim(this);
  player = minim.loadFile("whistling.mp3");
  player2 = minim.loadFile("icicle.mp3");
  player3 = minim.loadFile("licking1.mp3");
  player4 = minim.loadFile("uhoh.mp3");
  player5 = minim.loadFile("spill.mp3");
  player6 = minim.loadFile("mmm.wav");
  player7 = minim.loadFile("mmm2.wav");
  player8 = minim.loadFile("yay.mp3");
}

void draw() {
  frame.setTitle(mouseX + ", " + mouseY);

  imageDisplay();
  buttonDisplay();
  soundDisplay();
  pageButtons();
}

////////////////////////////////////////
void imageDisplay() {
  if (pageNumber == 0) {
    image(pageTitle, 0, 0);
  }
  
  if (pageNumber == 1) {
    image(pageOne, 0, 0);
  }

  if (pageNumber == 2) {
    image(pageTwo, 0, 0);
  }
  
  if (pageNumber == 3){
    image(pageThree, 0, 0);
  }
  
   if (pageNumber == 4){
    image(pageFour, 0, 0);
  }
  
   if (pageNumber == 5){
    image(pageFive, 0, 0);
  }
  
   if (pageNumber == 6){
    image(pageSix, 0, 0);
  }
  
   if (pageNumber == 7){
    image(pageSeven, 0, 0);
  }
  
    if (pageNumber == 8){
    image(pageEight, 0, 0);
  }
  
    if (pageNumber == 9){
    image(pageTheEnd, 0, 0);
  }
  
}
//////////////////////////////////////
void buttonDisplay() {
  ellipse(129, 519, 10, 10);
  
  ellipse(223, 519, 10, 10);
  
  ellipse(317, 519, 10, 10);
  
  ellipse(411, 519, 10, 10);
  
  ellipse(505, 519, 10, 10);
  
  ellipse(599, 519, 10, 10);
  
  ellipse(693, 519, 10, 10);
  
  ellipse(787, 519, 10, 10);
  
  ellipse(881, 519, 10, 10);
  
  ellipse(975, 519, 10, 10);
  
}
//////////////////////////////////////
void soundDisplay() {
  if (pageNumber == 1) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player.play();
    }
  }
  
   if (pageNumber == 2) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player2.play();
    }
  }
  
   if (pageNumber == 3) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player3.play();
    }
  }
  
   if (pageNumber == 4) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player4.play();
    }
  }
  
  if (pageNumber == 5) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player5.play();
    }
  }
  
  if (pageNumber == 6) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player6.play();
    }
  }
  
  if (pageNumber == 7) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player7.play();
    }
  }
  
   if (pageNumber == 8) {
    if (mouseX >= width/2 - 321 
      && mouseX <= width/2 + 321
      && mouseY >= height/2 - 120
      && mouseY <= height/2 + 120)
    {
      //println("it's in!");
      //rect(width/2, height/2, 1, 2);
      player8.play();
    }
  }
}


/////////////////
void pageButtons() {
  if (dist(mouseX, mouseY, 129, 519) <= 5){
    pageNumber = 0;
  }
  
  if (dist(mouseX, mouseY, 223, 519) <= 5){
     pageNumber = 1;
  }
  
   if (dist(mouseX, mouseY, 317, 519) <= 5){
     pageNumber = 2;
  }
  
   if (dist(mouseX, mouseY, 411, 519) <= 5){
     pageNumber = 3;
  }
  
  if (dist(mouseX, mouseY, 505, 519) <= 5){
     pageNumber = 4;
  }
  
  if (dist(mouseX, mouseY, 599, 519) <= 5){
     pageNumber = 5;
  }
  
  if (dist(mouseX, mouseY, 693, 519) <= 5){
     pageNumber = 6;
  }
  
  if (dist(mouseX, mouseY, 787, 519) <= 5){
     pageNumber = 7;
  }
  
  if (dist(mouseX, mouseY, 881, 519) <= 5){
     pageNumber = 8;
  }
  
  if (dist(mouseX, mouseY, 975, 519) <= 5){
     pageNumber = 9;
  }
  //example for next page
}


