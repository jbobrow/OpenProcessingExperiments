
//http://www.openprocessing.org/sketch/60980//

import processing.pdf.*;
boolean savePDF = false;
PImage img0; 
PImage img1;
 PImage img2;
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
 img0 = loadImage ("car1.jpg");

 
  size(650, 431);
  String[] lines = loadStrings("music.txt");

  joinedText = join(lines, " ");
 
  font = createFont("Courier", 30);
 
  countCharacters();
}
 
 
void draw() {
 image (img0,0, 0);


  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  textFont(font);
  noStroke();
  smooth();
 
  posX = 100;
  posY = 200;
 
  // go through all characters in the text to draw them 
  for (int i = 0; i < joinedText.length(); i++) {
    // again, find the index of the current letter in the alphabet
    String s = str(joinedText.charAt(i)).toUpperCase();
    char uppercaseChar = s.charAt(0);
    int index = alphabet.indexOf(uppercaseChar);
    if (index < 0) continue;
 
    if (drawAlpha) fill(40, 400, 300, counters[index]*6);
    else fill(100, 200, 129);
    textSize(mouseX/2.5);
 
    float sortY = index*20+40;
    float m = map(mouseX, 100,width-50, 0,1);
    m = constrain(m, 0, 2);
    float interY = lerp(posY, sortY, m);
 
    text(joinedText.charAt(i), posX, interY);
 
    posX += textWidth(joinedText.charAt(i));
    if (posX >= width-170 && uppercaseChar == ' ') {
      posY += 50;
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


