
//Martin C, CP1, Mods 4-5
//Magic Eight Ball

PImage eightBall, eightBall2;
boolean askMode = true;
PFont font;
String[] answers;
int i;

void setup() {
  size(300, 300);
  background(215);
  font = loadFont("Arial-BoldMT-18.vlw");
  answers = loadStrings("answers.txt");
  eightBall = loadImage("EightBall.png");
  eightBall2 = loadImage("EightBall2.png");
}

void draw() {
  if (askMode) {
    image(eightBall, 0, 0, 300, 300);
    textFont(font);
    textAlign(CENTER);
    textSize(16);
    fill(215);
    text("Ask a yes or no question, then click on the Magic Eight Ball!", 60, 140, 180, 300);
  } 
  else {
    image(eightBall2, 0, 0, 300, 300);
    textFont(font);
    textAlign(CENTER);
    textSize(16);
    fill(215);
    text(answers[i], 60, 140, 180, 300);
  }
}

void mousePressed() {
  askMode = !askMode;
  i = int(random(answers.length));
}



