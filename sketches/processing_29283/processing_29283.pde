
String theText = "Ceremony - Sick";
String[] cere;
PFont myFont;
int c = 0;
int x = 0;


void setup() {

  size(300, 830);
  smooth ();

  myFont = createFont("Rockwell", 12);
  textFont(myFont);

  cere = loadStrings("sick.txt");
  println(cere);
}


void draw() {

  smooth();
  background(255);

  float wordPositionX = 30;
  float wordPositionY = 0;

  text (cere[c], 30, 70 + x);

  if (c == cere.length-1) {
    c = 0;
    x = 0;
  }


  for (int i = 0; i<theText.length(); i++) {

    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);

    fill(0);
    text(letter, wordPositionX, 30 + wordPositionY);

    wordPositionX = wordPositionX + letterWidth;   
  }


  String gesuchtesWort = "sick";

  int wordIndex = theText.indexOf(gesuchtesWort);
  int wordCount = 0;

  if(wordIndex > -1) {
    wordCount = wordCount + 1;

    wordIndex = theText.indexOf("Sick", wordIndex+1);
  }
  
  
   text (wordCount, 200, 30);
}

void keyPressed() {

  if((int)key == 10) {
    c = c+1;
  }

  if((int)key == 10) {
    x = x + 10;
  }
}


