
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer meow;
AudioPlayer bark;
AudioPlayer swish;
AudioPlayer caw;
AudioPlayer neigh;

PImage intro;
PImage petbackground;
PImage puppy;
PImage kitty;
PImage cattext;
PImage bird;
PImage birdtext;
PImage fish;
PImage fishtext;
PImage horse;
PImage horsetext;
PImage dogtest;
PImage dogtext;
int STATE = 1;
float circleX;
float circleY;

boolean showpuppyinfo = false;
boolean showkittyinfo = false;
boolean showbirdinfo  = false;
boolean showfishinfo  = false;
boolean showhorseinfo  = false;




void setup() {
  minim = new Minim(this);
  meow = minim.loadFile("meow.mp3");
  bark = minim.loadFile("puppybark.mp3");
  swish = minim.loadFile("fishswish.mp3");
  caw = minim.loadFile("parrot.mp3");
  neigh = minim.loadFile("horseneigh.mp3");
  intro = loadImage("Petintropage.png");
  petbackground = loadImage("petbackground.png");
  puppy = loadImage("puppy3.png");
  kitty = loadImage("kitty.png");
  cattext = loadImage("textcatpaw.png");
  bird = loadImage("Bird.png");
  birdtext = loadImage("textbirdfeet.png");
  fish = loadImage("fish.png");
  fishtext = loadImage("textfishbubble.png");
  horse = loadImage("horse.png");
  horsetext = loadImage("texthorsefoot.png");
  dogtest = loadImage("dogtest.png");
  dogtext = loadImage("textdogpaw.png");
  size(1000, 1000);
  smooth();
  circleX = width/2;
  circleY = height/2;
}
void draw() {
  if (STATE == 1) {
    image(intro, 0, 0);
    if (dist(circleX, circleY, mouseX, mouseY) > 300) { //radius around paw ) {
      if (mousePressed == true) {
        STATE = 2;
      }
    }
  }
  else if (STATE >= 2) {
    background(239, 248, 254);
    image(petbackground, 0, 0);
    drawPuppyStuff();
    drawKittyStuff();
    drawFishStuff();
    drawBirdStuff();
    drawHorseStuff();
    //    image(bird, 180, 430, 150, 150);
    //    image(fish, 180, 630, 150, 150);
    //    image(horse, 180, 830, 150, 150);
  }//end state
  println("cat: " + showkittyinfo + " puppy: " + showpuppyinfo + " fish: " + showfishinfo + " bird: " + showbirdinfo);
}// end draw
// 1 Cat
void drawKittyStuff() {
  image(kitty, 180, 30, 150, 150);
  //ellipse(255,110,150,150);
  if (dist(255, 110, mouseX, mouseY) < 75) { //radius around paw ) { is Correct
    if (mousePressed == true) {
      showkittyinfo=true;
      meow.play();
      meow.rewind();
      println("here");
    }
  }
  if (showkittyinfo == true) {
    image(cattext, 350, 60);
  }
}
// 2 Dog
void drawPuppyStuff() {
  image(puppy, 180, 230, 150, 150);
  //ellipse( 255, 255, 150, 150);
  println(mouseX + " " + mouseY);
  if (dist(255, 255, mouseX, mouseY) < 75) { //radius around paw ) {
    if (mousePressed == true) {
      showpuppyinfo = true;
      bark.play();
      bark.rewind();
      //dog info
    }
  }

  if (showpuppyinfo == true) {
    image(dogtext, 350, 249); // find coordinate

    //dogBark.play();
  }
}
// 3 Fish

void drawFishStuff() {

  image(fish, 180, 430, 150, 150);
  // ellipse( 255,500, 150, 150);
  if (dist(255, 500, mouseX, mouseY) < 75) { //radius around paw ) {
    if (mousePressed == true) {
      showfishinfo=true;
      swish.play(); 
    swish.rewind();
    }
  }
  if (showfishinfo == true) {
    //fix fish text
    image(fishtext, 350, 449); 
    // fix fish sound
    
  }
}

// 4 Bird


void drawBirdStuff() {
  image(bird, 180, 630, 150, 150);
  //ellipse( 255,705, 150, 150);

  if (dist(255, 705, mouseX, mouseY) <75) { //radius around paw ) {
    if (mousePressed == true) {
      showbirdinfo=true;
      caw.play();
    caw.rewind();
    }
  }
  if (showbirdinfo == true) {
    image(birdtext, 350, 649);
    // fix bird sound
    
  }
}
// 5 Horse
void drawHorseStuff() {
  image(horse, 180, 830, 150, 150);
  // ellipse( 255,905, 150, 150);
  if (dist(255, 905, mouseX, mouseY) < 75) { //radius around paw ) {
    if (mousePressed == true) {
      showhorseinfo=true;
      neigh.play();
    neigh.rewind();
    }
  }
  if (showhorseinfo == true) {
    image(horsetext, 350, 849); // replace with horse

  }
}



