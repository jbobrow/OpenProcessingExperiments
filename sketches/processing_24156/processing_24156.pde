
// Codes stolen from...
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni


/**
 * analysing and sorting the letters of a text 
 * changing the letters alpha value in relation to frequency
 *
 * MOUSE
 * position x          : interpolate between normal text and sorted position
 *
 * KEYS
 * 1                   : toggle alpha mode
 * s                   : save png
 * p                   : save pdf
 */


import processing.pdf.*;
boolean savePDF = false;

PFont font;
String joinedText;

String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜß,.;:!? ";
int[] counters = new int[alphabet.length()];

float charSize;
color charColor = 0;
int posX, posY;

boolean drawAlpha = true;
PImage bg;

void setup() {
  bg = loadImage("sky.jpg");
  size(500, 750);
  String[] lines = loadStrings("sky2.txt");
  joinedText = join(lines, " ");

  font = createFont("Courier", 10);

  countCharacters();
}


void draw() {
  background(bg);
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  textFont(font);
  noStroke();
  smooth();

  posX = 20;
  posY = 40;

  // go through all characters in the text to draw them  
  for (int i = 0; i < joinedText.length(); i++) {
    // again, find the index of the current letter in the alphabet
    String s = str(joinedText.charAt(i)).toUpperCase();
    char uppercaseChar = s.charAt(0);
    int index = alphabet.indexOf(uppercaseChar);
    if (index < 0) continue;

    if (drawAlpha) fill(90, 110, 190, counters[index]*6);
    else fill(10, 200, 129);
    textSize(mouseX/6);

    float sortY = index*20+40;
    float m = map(mouseX, 100,width-50, 0,1);
    m = constrain(m, 0, 1);
    float interY = lerp(posY, sortY, m);

    text(joinedText.charAt(i), posX, interY);

    posX += textWidth(joinedText.charAt(i));
    if (posX >= width-170 && uppercaseChar == ' ') {
      posY += 30;
      posX = 20;
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void countCharacters(){
  for (int i = 0; i < joinedText.length(); i++) {
    // get one char from the text, convert it to a string and turn it to uppercase
    char c = joinedText.charAt(i);
    String s = str(c);
    s = s.toUpperCase();
    // convert it back to a char
    char uppercaseChar = s.charAt(0);
    // get the position of this char inside the alphabet string
    int index = alphabet.indexOf(uppercaseChar);
    // increase the respective counter
    if (index >= 0) counters[index]++;
  }
}




void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;

  if (key == '1') drawAlpha = !drawAlpha;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



