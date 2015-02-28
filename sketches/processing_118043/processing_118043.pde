
PFont font;
String word= "GIVE UP";
char[] letters;
float[] y;
int currentLetter = 0;

void setup () {
 textFont(createFont("AndaleMono", 60, true));
 letters = word.toCharArray();
 y = new float[letters.length];
 for (int i = 0; i < letters.length; i++) {
   y[i] =500;
 }
size(567,567);
PImage img;
img = loadImage("reality.jpg");
background(img);
 stroke(244, 97, 97);
 smooth();

}
void draw() { 
  if (y[currentLetter] > 35) {
    y[currentLetter] -= 3; // Move current letter up
  } else {
    if (currentLetter < letters.length - 1) {
      currentLetter++; // Switch to next letter
    }
  }
// Calculate x to center the word on screen
  float x = (width - textWidth(word)) / 2;
  for (int i = 0; i < letters.length; i++) {
    text(letters[i], x, y[i]);
    x += textWidth(letters[i]);
  }
}

void drawCircle(float x, float y, float radius) {
 fill(244, 97, 97, 127);
 ellipse(x, y, radius, radius);
 noFill();
  textFont(createFont("Helvetica-Light", 12, true));
 text("damn reality", x, y);
 text("face it", x, y+12);
}
void mousePressed() {
 drawCircle(mouseX, mouseY, random(50,200));
}


