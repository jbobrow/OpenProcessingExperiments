
String theText = "Unter 4 Augen";
String[] geladenerText;
PFont myFont;
int c = 0;
int x = 0;


void setup() {

  size(600, 800);
  smooth ();
  println(geladenerText);
}


void draw() {
  smooth();
  background(255);
  float wordPositionX = 0;
  float wordPositionY = 0;
  float textgroesse = 8;

  if(mouseX > 0) {
    textgroesse = textgroesse + mouseX*mouseY/10000;
  }

  else {
  } 

  // Die Schrift erstellen
  myFont = createFont("Helvetica-Bold", textgroesse);
  textLeading(textgroesse);
  // Die Schrift auswählen. Es sind auch mehrere möglich
  textFont(myFont);
  geladenerText = loadStrings("curse.txt");

  for(int i = 0; i < geladenerText.length; i ++) {
    //textSize(random(10, 15));
    text (geladenerText[i], 30, 70 + i * 20);

    noFill();
    ellipse(mouseX, mouseY, 100, 100);
  }

  for (int i = 0; i<theText.length(); i++) {

    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);

    fill(0, 100, 100, 120);
    text(letter, 10 + wordPositionX, 30 + wordPositionY);

    if(wordPositionX > width-30) {
      wordPositionX = 30;
      wordPositionY = wordPositionY + 200;
    }
    wordPositionX = wordPositionX + letterWidth;
  }
}


void keyPressed() {

  if((int)key == 10) {
    c = c+1;
  }

  if((int)key == 10) {
    x = x + 10;
  }
}


