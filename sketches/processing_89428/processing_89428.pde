
String word = "fleeting";
Letter[] letters;
float alphaValue;
float curMillis;
float lastMillis;
float deltaMillis;
float counter;
boolean cycleOver;
PFont font;

void setup() {
  size(640, 480);
  background(0);

  colorMode(RGB, 255, 255, 255, 1.0);
  letters = new Letter[word.length()];
  alphaValue = 0.0;
  curMillis = 0;
  lastMillis = 0;
  cycleOver = true;
  font = createFont("Monotype Corsiva", 90);
  textFont(font, 32);

  noStroke();
  smooth();

  for (int i =0; i < word.length(); i++)
  {
    letters[i] = new Letter(word.charAt(i));
  }
}

void draw() {
  background(0);

  curMillis = millis();
  deltaMillis = curMillis - lastMillis;
  lastMillis = curMillis;
  //counter += deltaMillis*0.001;
  //constrain(counter, 0, 2);

  if (!(mouseX == pmouseX && mouseY == pmouseY) || !cycleOver) {
    if (cycleOver) {
      cycleOver = false;
      counter = 0;
    }
    
    counter += deltaMillis*0.001;
    
    for (int i = 0; i < word.length(); i++) {
      alphaValue = ((sin(PI*(counter-((float)i/word.length())))) * .5);
 
      fill(255, 255, 255, alphaValue);
 
      letters[i].x = lerp(mouseX+15, mouseX+300, (float)i/(word.length()-1.0f));
      letters[i].y = mouseY + 15;
      letters[i].drawLetter();
    }
    
    if (counter >= 2)
    {
      cycleOver = true;
    }
  }
  else {
    cycleOver = true;
  }
}

class Letter
{
  char letter;
  public float x;
  public float y;

  public Letter(char letter)
  {
    this.letter = letter;
  }

  public void drawLetter()
  {
    text(letter, x, y);
  }
}



