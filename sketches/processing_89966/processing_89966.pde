
PFont myFont;
String[] linesOfText;
String[] aliceWords;

String[] prepWords = {
  "a", "an", "of", "the", "at"
};
int counter;
int wordPositionY;
int wordPositionX;
int numberOfWords;

void setup() {
  size(800, 600);
  background(24);
  colorMode(HSB);
  smooth();
  noStroke();

  wordPositionY=20;
  wordPositionX=20;
 // myFont=loadFont("HelveticaBold.vlw");
 // textFont(myFont);
  textSize(16);
  counter=0;

  linesOfText=loadStrings("http://processing.colophon.org/Plato.txt");
  String aliceBook=join(linesOfText, " ");
  aliceWords=splitTokens(aliceBook, " ,.?!:;[]-\"");

  // This begins counting through the words
  for (int i=0; i<aliceWords.length; i++) { // count through main text
    for (int n=0; n<prepWords.length; n++) { // cycle through preps
      if (prepWords[n].equals(aliceWords[i])) { // equal?
        aliceWords[i]=""; // kill the main word (a prep), then.
      }
    }
  }
}

void draw() {

  String singleWord=aliceWords[counter].trim(); // get rid of extra spaces
  if (singleWord.length()>5) { // word bigger than five letters?
    int wordFrequency=checkWholeSpeech(singleWord);
    if (wordFrequency>2) { // word appears at least 3 times?
      float convertedFrequency=log(wordFrequency);
      // this is just a way of trying to get the numbers to fit together;
      // log(wordFrequency) grabs the logarithm of the wordFreq;
      // logs are great ways of dealing with the problem of the
      // "long tail."
      float mappedFrequency=map(convertedFrequency, 1.0, 3.65, 0, 235);
      // again, here I'm just mapping these numbers in a way that
      // seems to work.  No magic, just trial and error.
      // (a mathematician would have lots of insight here,
      // I suppose).
      fill(mappedFrequency, 245, 245);
      rect(wordPositionX-12, wordPositionY-13, 11, 16);
      fill(mappedFrequency, 245, 245);
      text(singleWord, wordPositionX, wordPositionY);
      wordPositionY=wordPositionY+20;
      if (wordPositionY>height-22) {
        wordPositionX=wordPositionX+110;
        wordPositionY=20;
      }
    }
  }
  counter=(counter+1)%aliceWords.length; // using modulo
  //keeps us from accidentally exceeding alicewords.length and
  //breaking the program!
}    

int checkWholeSpeech(String wordToLookFor) {
  int microCounter = 0;
  for (int i=0;i<aliceWords.length;i++) {
    String wordToCheckAgainst = aliceWords[i].trim(); // clean it up
    if (wordToLookFor.equals(wordToCheckAgainst)) {
      microCounter++; // yes?  then increment microcounter
      aliceWords[i]=""; // and destroy the evidence:
      // by deleting the word, we make sure we never count it again.
    }
  }
  return microCounter;
}



