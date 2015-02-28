
// Ben Turner
// NYU-ITP ICM project

// "chance composition", "In This Together"

// x position for upwards black interlacing rect
int i=300;

// timer for overall animation
int counter=0;
boolean counterConsole = false;

// loads OpenCV
import hypermedia.video.*;
import java.awt.*;
OpenCV opencv;
int threshold = 80;

// needed to build the right-side terminal shell
int consoleLine = 1;
int consoleLineCount = 15;

// holds console message buffer
String[] messages2 = new String[50];
StringBuffer command = new StringBuffer();
String s;

// holds cipher's pre-arranged messages
String[] messages = new String[50];

// changes tenor of piece depending on user input & time
String globalTint;

// counts chars on console line in order to move cursor
int keyCount = 0;

// did user respond to cipher yet?
boolean pingBack = false;

void setup() {
  size(800, 350);
  background(0);

  globalTint = "green";

  // need a console-like fixed-width font
  PFont font;
  font = loadFont("LucidaConsole-48.vlw");
  textFont(font, 40);

  // init empty arrays to avoid errors
  for (int j = 0; j < 50; j++) {
    messages[j] = "";
    messages2[j] = "";
  }

  smooth();
  frameRate(15);

  // OpenCV needs this
  opencv = new OpenCV( this );
  opencv.capture(450, 350);
}

void draw() {
  background(0);

  // loading random subliminal images
  PImage b0, b1, b2, c0, c1, c2, d0, d2;
  b0 = loadImage("martiallaw.jpg");
  b1 = loadImage("riot.jpg");
  b2 = loadImage("com.jpg");
  c0 = loadImage("moon.jpg");
  c1 = loadImage("ww2kiss.jpg");
  c2 = loadImage("mlk.jpg");
  d0 = loadImage("orpheus.jpg");
  d2 = loadImage("kiss.jpg");

  // inputs camera footage for OpenCV
  opencv.read();
  image(opencv.image(), 0, 0);

  // puts a color tint over captured video image
  if (globalTint == "yellow") {
    fill(255, 255, 0, 100);
  }
  else if (globalTint == "red") {
    fill(255, 0, 0, 100);
  }
  else if (globalTint == "pink") {
    fill(200, 0, 200, 100);
  }
  else {
    fill(0, 255, 0, 100);
  }
  rect(0, 0, 450, 350);

  // adds subliminal images
  if (counter%50 == 0) {
    if (globalTint == "green" || globalTint == "red") {
      tint(0, 200, 0);
      image(b0, 0, 0);
    }
    else if (globalTint == "yellow") {
      tint(200, 200, 0);
      image(c0, 0, 0);
    }
    else if (globalTint == "pink") {
      tint(255, 0, 255);
      image(d0, 0, 0);
    }
    tint(255);
  }

  if (counter%30 == 0) {
    if (globalTint == "green" || globalTint == "red") {
      tint(0, 200, 0);
      image(b1, 0, 0);
    }
    else if (globalTint == "yellow") {
      tint(200, 200, 0);
      image(c1, 0, 0);
    }
    tint(255);
  }

  if (counter%80 == 0) {
    if (globalTint == "green" || globalTint == "red") {
      tint(0, 200, 0);
      image(b2, 0, 0);
    }
    else if (globalTint == "yellow") {
      tint(200, 200, 0);
      image(c2, 0, 0);
    }
    else if (globalTint == "pink") {
      tint(255, 0, 255);
      image(d2, 0, 0);
    }
    tint(255);
  }

  // some black matting for video
  fill(0, 100);
  rect(0, 0, 450, 350);

  if (counter >= 600) {
    globalTint = "red";
    fill(255);
    text("SIGNAL ACTIVELY JAMMED", 50, 300);
  }

  if (counter >= 1000) {
    fill(255);
    textSize(30);
    text("CONNECTION TERMINATED", 250, 175);
  }

  fill(255, 100);
  textSize(20);
  text("LIVE", 380, 30);

  // black bg for console text
  fill(0);

  textSize(12);
  fill(161, 211, 147);

  messages[0] = "cipher> honey, are you there? it's urgent.";
  messages[1] = "cipher> my life is in danger.";
  messages[2] = "cipher> pls respond, give proof you're there.";
  messages[3] = "cipher> i don't have much time...";
  messages[4] = "cipher> let me just hear you say it";

  if (counter%400==0 && counter > 0 && counter < 850) {
    addConsoleLine(messages[4]);
  }
  if (counter == 300) {
    addConsoleLine(messages[3]);
  }
  else if (counter == 200 && pingBack == false) {
    addConsoleLine(messages[2]);
  }
  else if (counter == 50) {
    addConsoleLine(messages[1]);
  }
  else if (counter == 5) {
    addConsoleLine(messages[0]);
  }

  displayConsole();

  s = command.toString();
  fill(255);
  text(s, 520, 335);
  fill(161, 211, 147);

  text("root:~$ ", 465, 335);

  drawCursor();

  videoFeed();

  i-=20;

  fill(0, 100);

  // interlacing rect
  if (i<=-100) {
    i = 600;
  }
  else {
    fill(0, 0, 0, 50);
    noStroke();
    rect(0, i, 900, 90);
  }

  // don't want counter to go out of bounds, but don't want it to restart either
  if (counter > 20000) {
    counter = 10000;
  }
  counter++;
}

void addConsoleLine(String newMessage) {
  for (int f=10;f>0;f--) {
    messages2[0] = newMessage;
    messages2[f] = messages2[f-1];
  }
}

void displayConsole() {
  for (int f=10;f>0;f--) {
    text(messages2[f], 465, 320-f*consoleLineCount);
  }
}

void keyTyped() {
  if (key == RETURN || key == ENTER) {
    s = command.toString();
    addConsoleLine(s);
    if (pingBack == false) {
      pingBack = true;
      addConsoleLine("cipher> oh thank god you're there.");
      addConsoleLine("cipher> is it you? what school did we meet at?");
    }
    if (s.matches("(?i).*tisch.*") || s.matches("(?i).*itp.*") || s.matches("(?i).*nyu.*")) {
      addConsoleLine("cipher> so it IS you...!");
      globalTint = "yellow";
    }
    if (s.matches("(?i).*i love you.*")) {
      addConsoleLine("cipher> i love you too");
      addConsoleLine("cipher> stay with me here, till they find me.");
      globalTint = "pink";
    }
    if (s.matches("(?i).*help.*")) {
      addConsoleLine("cipher> can't help, too risky. don't come find me.");
    }
    if (s.matches("(?i).*counter.*")) {
      addConsoleLine("counter is currently: " + counter);
    }
    s = "";
    command.setLength(0);
    keyCount = 0;
  }
  else {
    command.append(key);
    fill(255);
    text(key, 520+keyCount*7, 335);
    keyCount++;
  }
}

// creates random colored matrix look
void videoFeed() {
  int j = 0;
  int k = 0;
  while (k <= 570) {
    if (j >= 900) {
      j = 0;
      k += 20;
    }
    if (globalTint == "yellow") {
      fill(random(200, 255), random(200, 250), 0, 50);
    }
    else if (globalTint == "red") {
      fill(random(0, 255), 0, 0, 100);
    }
    else if (globalTint == "pink") {
      fill(random(0, 255), 0, random(0, 255), 30);
    }
    else {
      fill(0, random(0, 100), 0, 50);
    }
    rect(j, k, 20, 20);
    j += 20;
  }
}

// draws and moves console cursor
void drawCursor() {
  if (counter%15 == 0) {
    fill(0);
  }
  else {
    fill(161, 211, 147);
  }
  rect(520+keyCount*7, 325, 7, 12);
}

