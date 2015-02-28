
//Nick
//October 3, 2012


//Imported the music part of processing and declared a variable for the music
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

//Declared a variable for a method that will get a picture of a rat, 
//a string variable for all the strings I make, and an int for keeping track of time
boolean rat = false;
int time = 0;
String s;

//Created constant for size of some pictures
final int dimensions_for_some_pictures = 500;

void setup()
{
  //Set up the music player and the size of the screen and the frame rate
  frameRate(1);
  size(500, 500);
  minim = new Minim(this);
  player = minim.loadFile("08 Real World.mp3", 2048);
  player.play();
}

void draw()
{
  //Set up the variable for time and called all the methods I need
  time = time + 1;
  clear();
  drawGround();
  backGroundImage();


  drawPerson();

  codeBasedVideo();

  //allAmericanRejects();
  //allAmericanRejects2();
  //allAmericanRejects3();
  //allAmericanRejects4();
  firstSlide();
  println(time + " seconds have passed and " + minutes() + " minutes have passed.");
}

void stop()
{
  //For the music stopping
  player.close();
  minim.stop();
  super.stop();
}




void drawPerson() {
  stroke(255, 0, 0);
  fill(252, 182, 3);  //A tannish color
  ellipse(250, 335, 30, 30);  //Draw the head
  line(250, 350, 250, 400);  //Draw the body
  line(250, 350, 220, 380);  //Draw the left arm
  line(250, 350, 280, 380);  //Draw the right arm
  line(250, 400, 210, 450);  //Draw the left leg
  line(250, 400, 290, 450);  //Draw the right leg
}

void drawPerson2() {
  stroke(255, 0, 0);
  fill(252, 182, 3);  //A tannish color
  ellipse(350, 335, 30, 30);  //Draw the head
  line(350, 350, 350, 400);  //Draw the body
  line(350, 350, 320, 380);  //Draw the left arm
  line(350, 350, 380, 380);  //Draw the right arm
  line(350, 400, 310, 450);  //Draw the left leg
  line(350, 400, 390, 450);  //Draw the right leg
}

void drawChild() {
  stroke(255, 0, 0);
  fill(252, 182, 3);  //A tannish color
  ellipse(375, 395, 20, 20);  //Draw the head
  line(375, 405, 375, 430);  //Draw the body
  line(375, 405, 400, 420);  //Draw the left arm
  line(375, 405, 350, 420);  //Draw the right arm
  line(375, 430, 355, 450);  //Draw the left leg
  line(375, 430, 395, 450);  //Draw the right leg
}

void firstSlide() {
  //These two if statements are the two pictures at the beginning
  if (time <= 13) {
    PImage logo;
    logo = loadImage("logo.jpg");
    image(logo, 0, 0, 500, 500);
  }

  if (time > 13 && time < 25) {
    PImage picture2;
    picture2 = loadImage("Altogether.jpg");
    image(picture2, 0, 0, 500, 500);
  }
}




void codeBasedVideo() {

  //This is all the code for making the different strings and 
  //calling all the methods that draw pictures

  if (time > 25 && time < 30) {

    s = "Oh man, I really did wake up on the wrong side.";
    fill(255);
    text(s, 10, 10, 100, 500);  // Text wraps within text box
  }

  if (time > 32 && time < 36) {
    s = "AHHHHHHHHHHH!!!!!!!  What is this place?!!!!!!";
    text(s, 10, 10, 100, 500);
  }

  if (time > 37 && time < 42) {
    s="Why is this food coming out of the tv.  Why can't I choose what to eat?"; 
    text(s, 10, 10, 100, 500);
    weirdfood();
  }

  if (time > 43 && time < 47) {
    s = "Why am I one of the only people that can see this stuff happening?";
    text(s, 10, 10, 100, 500);
    drawGhost();
  }


  if (time > 49 && time < 54) {
    s = "This is just never going to change!!!  No matter how much I pray, nothing will happen!!!!!  I hate it!!!!";
    text(s, 10, 10, 100, 500);
    holyCross();
  }

  if (time > 60  && time < 65) {

    drawGhost2();
    drawSpider();
    drawBat();
    line(0, 450, 500, 450);
    drawPerson();
    rat = true;  //When this is true rat is drawn
  }

  if (time > 66 && time < 76) {
    s = "Is that man poisoning that kid?!!!!  That's just wrong!!!!!  Why is this owrld a tragedy now?!!!!!";
    text(s, 10, 10, 100, 500);
    drawPerson2();
    drawChild();
  }

  if (time > 77 && time < 82) {
    s = "Am I going insane?!!!!!!!  This really can't be the real world!!!!!!!!!!!";
    text(s, 10, 10, 100, 500);
    drawGhost();
    drawSpider();
    drawBat();
  }

  if (time > 83 && time < 95) {
    drawPerson2();
    s = "Oh my gosh!!!!!  Everyone in this world looks with a blank stare at me!!!!!";
    text(s, 10, 10, 100, 500);
  }

  if (time > 96 && time < 103) {
    s = "I could try to change something!!  Who am I kidding!!!!!!  Me against an army of blank faced idiots!!!!!!!  Why is this darkness just messing up everything?!!!!!";
    text(s, 10, 10, 100, 500);
  }

  if (time > 103 && time < 106) {

    s = "There is blood here!!!  This is crazy!!!!!";
    text(s, 10, 10, 100, 500);
  }

  if (time > 108 && time < 111) {

    s = "Why am I holding my breath?!!!!!  This world is driving me insane!!!!!!!";
    text(s, 10, 10, 100, 500);
  }

  if (time > 111 && time < 116) {

    s = "There must be someone out here who thinks like me.  But who??";
    text(s, 10, 10, 100, 500);
  }

  if (time > 119  && time < 125) {
    drawGhost2();
    drawSpider();
    drawBat();
    line(0, 450, 500, 450);
    drawPerson();
  }

  if (time > 125 && time < 135) {
    s = "Again?!!!!!  Why is that man poisoning the kid?!!!!!";
    text(s, 10, 10, 100, 500);
    drawPerson2();
    drawChild();
  }

  if (time > 136 && time < 147) {
    s = "I am going insane!!!!  This can't be the real world, but here it is!!!!!!!";
    text(s, 10, 10, 100, 500);
    drawGhost();
    drawSpider();
    drawBat();
  }

  if (time > 148 && time < 160) {
    s = "I understand all the flaws, but what can I do with them?!!!!";
    text(s, 10, 10, 100, 500);
  }

  if (time > 162 && time < 181) {
    s = "What is that man doing?!!!           Child: This is not the real world!!!!!  Did you create this stupid place?!!!  Hey, no!!!!!!  Stiop, let me go!!!!!  AHHHHHHHH!!!!!!!      Man: Say goodbye to the world.";
    text(s, 10, 10, 100, 500);
    drawPerson2();
    drawChild();
  }

  if (time > 182  && time < 192) {
    drawGhost2();
    drawSpider();
    drawBat();
    line(0, 450, 500, 450);
    drawPerson();
  }

  if (time > 192 && time < 201) {
    s = "Why dio adults just keep poisoning children?!!!!";
    text(s, 10, 10, 100, 500);
    drawPerson2();
    drawChild();
  }

  if (time > 201 && time < 220) {
    s = "Oh this is insanity!!!!  Oh no!!!!!!!!!  Please don't!!!!!!  Good bye world!!!!!!";
    text(s, 10, 10, 100, 500);
    drawGhost();
    drawSpider();
    drawBat();
    drawPerson2();
  }

  if (time >= 223 && time <= 224) {
    allAmericanRejects();
  } 

  if (time >= 224 && time <= 225) {
    allAmericanRejects2();
  }

  if (time >= 225 && time <= 226) {
    allAmericanRejects3();
  }

  if (time >= 226) {
    allAmericanRejects4();
  }


  //This is the if statement for calling the rat picture
  //in a way that takes a boolean value
  if (time > 60 && time < 65) {
    if (rat == true) {
      PImage imgrat;
      imgrat = loadImage("rat.jpg");
      image(imgrat, 400, 400, 50, 50);
    }
  }
}


//From here on down, different methods are made fior the 
//different pictures that I can use multiple times
void holyCross() {
  PImage img;
  img = loadImage("Cross.jpg");
  image(img, 250, 0, 150, 150);
}

void weirdfood() {
  PImage img;
  img = loadImage("tv.jpg");
  image(img, 450, 350, 50, 50);
  PImage img2;
  img2 = loadImage("food.jpg");
  image(img2, 450, 420, 30, 30);
}

void backGroundImage() {
  PImage img;
  img = loadImage("the-haunted-house.jpg");
  image(img, 125, 125, width/2, height/2);
}


void drawGround() {
  PImage imgSidewalk;
  imgSidewalk = loadImage("sidewalk.jpg");
  image(imgSidewalk, 200, 320, 110, 130);
  line(0, 450, 500, 450);
}

void drawBat() {
  PImage imgBat;
  imgBat = loadImage("vampirebat.jpg");
  image(imgBat, 125, 400, 50, 50);
}

void drawGhost() {
  int xPosition;
  int yPosition;
  PImage imgGhost;
  imgGhost = loadImage("ghost.jpg");
  image(imgGhost, 140, 135, 100, 120);
}

void drawGhost2() {
  PImage imgGhost;
  imgGhost = loadImage("ghost.jpg");
  image(imgGhost, 0, 0, dimensions_for_some_pictures, dimensions_for_some_pictures);
}

void drawSpider() {
  PImage imgSpider;
  imgSpider = loadImage("spider2.jpg");
  image(imgSpider, 30, 380, 70, 70);
}

void allAmericanRejects() {
  PImage theAllAmericanRejects;
  theAllAmericanRejects = loadImage("The-All-American-Rejects.jpg");
  image(theAllAmericanRejects, 0, 0, dimensions_for_some_pictures, dimensions_for_some_pictures);
}

void allAmericanRejects2() {
  PImage theAllAmericanRejects;
  theAllAmericanRejects = loadImage("Move Along.jpg");
  image(theAllAmericanRejects, 0, 0, dimensions_for_some_pictures, dimensions_for_some_pictures);
}

void allAmericanRejects3() {
  PImage theAllAmericanRejects;
  theAllAmericanRejects = loadImage("Move Along 2.jpg");
  image(theAllAmericanRejects, 0, 0, dimensions_for_some_pictures, dimensions_for_some_pictures);
}

void allAmericanRejects4() {
  PImage theAllAmericanRejects;
  theAllAmericanRejects = loadImage("When The World Comes Down.jpg");
  image(theAllAmericanRejects, 0, 0, dimensions_for_some_pictures, dimensions_for_some_pictures);
}

//This method is for keeping the screen clear of what happened before
void clear() {
  background(7, 0, 49);
}


//Calculate time in hours
float minutes() {
  return time / 60;
}


