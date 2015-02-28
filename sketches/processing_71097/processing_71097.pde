
Line ln;
Line lns[];
int LANDSCAPE;

String words[] = {
  "full tragedy productions","web solutions and interactivity", "the lines of text", "that they want to dance?",
  "leonardo de melo 2012", "the art does not need of likes to survive", "living on the page like that",
  "waiting to be read...", "events service",
};

void setup() {
  size(600, 350, P3D);

  
  // Array of line objects
  lns = new Line[8];

  // Load the font from the sketch's data directory
  textFont(loadFont("Univers-66.vlw"), 1.0);

  // White type
  fill(255);

  // Creating the line objects
  for(int i = 0; i < 8; i++) {
    // For every line in the array, create a Line object to animate
    // i * 70 is the spacing
    ln = new Line(words[i], 0, i * 70);
    lns[i] = ln;
  }
  
  hint(DISABLE_DEPTH_MASK);
}

void draw() {
  background(0);
  
  translate(-200, -50, -450);
  rotateY(0.3);

  // Now animate every line object & draw it...
  for(int i = 0; i < 8; i++) {
    float f1 = sin((i + 1.0) * (millis() / 10000.0) * TWO_PI);
    float f2 = sin((8.0 - i) * (millis() / 10000.0) * TWO_PI);
    Line line = lns[i];
    pushMatrix();
    translate(0.0, line.yPosition, 0.0);
    for(int j = 0; j < line.myLetters.length; j++) {
      if(j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 75, 0.0, 0.0);
      }
      rotateY(f1 * 0.005 * f2);
      pushMatrix();
      scale(75.0);
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    }
    popMatrix();
  }
}
class Letter
{
  char myChar;
  float x;
  float y;
  
  Letter(char c, float f, float f1)
  {
    myChar = c;
    x = f;
    y = f1;
  }
}
class Line
{
  String myString;
  int xPosition;
  int yPosition;
  int highlightNum;
  float speed;
  float curlInX;
  Letter myLetters[];
  
  Line(String s, int i, int j) 
  {
    myString = s;
    xPosition = i;
    yPosition = j;
    myLetters = new Letter[s.length()];
    float f1 = 0.0;
    for(int k = 0; k < s.length(); k++)
    {
      char c = s.charAt(k);
      f1 += textWidth(c);
      Letter letter = new Letter(c, f1, 0.0);
      myLetters[k] = letter;
    }

    curlInX = 0.1;
  }
}
class Word
{
  String myName;
  int x;
  
  Word(String s)
  {
    myName = s;
  }
}

