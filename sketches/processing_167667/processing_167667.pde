
/* @pjs font="AvenirNext-Heavy.ttf"; */

PFont font;
String word = "wiggle";
char[] letters;
float[] y;
//float x = random(150,160);
int currentLetter = 0;

void setup() {
  size(400,400);
//  font = loadFont("AvenirNext-Heavy-48.vlw");
  font = createFont("AvenirNext-Heavy",48);
  textFont(font);
  letters = word.toCharArray();
  y = new float[letters.length];
  for (int i = 0; i < letters.length; i++) {
    y[i] = 480;
  }
  
  frameRate(20);
}

void draw() {
  fill(0,50);
  rect(0,0,width, height);
  fill(100,100,255,180);
//  background(0);
//  pushMatrix();
//    translate(0,20);
//  popMatrix();
  if (y[currentLetter] > 35) {
    y[currentLetter] -= 12;
  } else {
    if (currentLetter < letters.length-1) {
      currentLetter++;
    }
  }
  float x = (width - textWidth(word)) / 2;
  for (int i = 0; i < letters.length; i++) {
    translate(0,52);
    pushMatrix();
    rotate(PI/24);
    translate(0,-12);
    popMatrix();
    text(letters[i], random(150,220), y[i]);
    x += textWidth(letters[i]);
  }
}


