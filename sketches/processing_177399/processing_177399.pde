
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

//Importing 'Minim' library files

//Global variables for music, with 'Minim' library
Minim minim;
AudioSample donote;
AudioSample renote;
AudioSample minote;
AudioSample fanote;
AudioSample solnote;
AudioSample lanote;
AudioSample sinote;

//Global variables for visual environment
int radius = 150;
color[] rainbowColor = {#F00518, #F0A605, #FFF303, #03FF22, #03FF22, #000AFA, #9003AD};
int[] broad = {75, 225, 375, 525, 675, 825, 975};
//"broad" var sets up rectangle's widths

//Declaring PImage variables for background images
PImage color01;
PImage color02;
PImage color03;
PImage color04;
PImage color05;
PImage color06;
PImage color07;
PImage whiteFringe;

//Declaring string variables for Do Re Mi... notes
String[] notesEng = {"C", "D", "E", "F", "G", "A", "B"};
String[] notesLat = {"do", "re", "mi", "fa", "sol", "la", "si"};

String press = "press key ";

void setup(){
  size(1050,700);
  /* The window size for your sketch must be no smaller than 800x600
and no larger than 1280x720. */
  background(#ffffff);
  color01 = loadImage("color (1).png");
  color02 = loadImage("color (2).png");
  color03 = loadImage("color (3).png");
  color04 = loadImage("color (4).png");
  color05 = loadImage("color (5).png");
  color06 = loadImage("color (6).png");
  color07 = loadImage("color (7).png");
  whiteFringe = loadImage("transparentwhite.png");
//Drawing the images for rainbow fringes 

image(color01, 0, 0);
image(color02, 150, 0);
image(color03, 300, 0);
image(color04, 450, 0);
image(color05, 600, 0);
image(color06, 750, 0);
image(color07, 900, 0);
image(whiteFringe, 0, 225);

//Loading audio files

minim = new Minim(this);
donote = minim.loadSample("DO.wav");
renote = minim.loadSample("RE.wav");
minote = minim.loadSample("MI.wav");
fanote = minim.loadSample("FA.wav");
solnote = minim.loadSample("SOL.wav");
lanote = minim.loadSample("LA.wav");
sinote = minim.loadSample("SI.wav");

//Setting up typography and text
PFont elephant = loadFont("elephant.vlw");
textFont(elephant);
textSize(60);
textAlign(CENTER);

// English notes TAGS / TEXTS
fill(rainbowColor[2]);
text(notesEng[0], broad[0], 300);
fill(rainbowColor[5]);
text(notesEng[1], broad[1], 300);
fill(rainbowColor[4]);
text(notesEng[2], broad[2], 300);
fill(rainbowColor[0]);
text(notesEng[3], broad[3], 300);
fill(rainbowColor[2]);
text(notesEng[4],broad[4], 300);
fill(rainbowColor[4]);
text(notesEng[5], broad[5], 300);
fill(rainbowColor[1]);
text(notesEng[6], broad[6], 300);
fill(rainbowColor[2]);

// Latin notes TAGS / TEXTS
textSize(50);
text(notesLat[0], broad[0], 350);
fill(rainbowColor[5]);
text(notesLat[1], broad[1], 350);
fill(rainbowColor[4]);
text(notesLat[2], broad[2], 350);
fill(rainbowColor[0]);
text(notesLat[3], broad[3], 350);
fill(rainbowColor[2]);
text(notesLat[4],broad[4], 350);
fill(rainbowColor[4]);
text(notesLat[5], broad[5], 350);
fill(rainbowColor[1]);
text(notesLat[6], broad[6], 350);

//Drawing text "Press key"...
textSize(23);
fill(#000000);
text(press, broad[0], 420);
fill(#333333);
text(press, broad[1], 420);
fill(#666666);
text(press, broad[2], 420);
fill(#999999);
text(press, broad[3], 420);
fill(#bbbbbb);
text(press, broad[4], 420);
fill(#dddddd);
text(press, broad[5], 420);
fill(#ffffff);
text(press, broad[6], 420);

//Drawing key NUMBERS below...
textSize(45);
fill(#000000);
text("1", broad[0], 470);
fill(#333333);
text("2", broad[1], 470);
fill(#666666);
text("3", broad[2], 470);
fill(#999999);
text("4", broad[3], 470);
fill(#bbbbbb);
text("5", broad[4], 470);
fill(#dddddd);
text("6", broad[5], 470);
fill(#ffffff);
text("7", broad[6], 470);

}

void draw(){
  /*radius = radius + 8;
  stroke(#ffffff);
  noFill();
  strokeWeight(1);
  ellipse(broad[0], 300, radius, radius);*/
}

void keyReleased(){
  if (key == '1') donote.trigger();
  if (key == '2') renote.trigger();
  if (key == '3') minote.trigger();
  if (key == '4') fanote.trigger();
  if (key == '5') solnote.trigger();
  if (key == '6') lanote.trigger();
  if (key == '7') sinote.trigger();
  if (key == 's' || key == 'S') saveFrame("myScreenshot.png");
}


