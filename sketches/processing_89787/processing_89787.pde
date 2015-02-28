
PFont myFont;

String[] linesOfText;
String[] aliceWords;

String[] prepWords = {
  "a", "an", "of", "the", "at"
};
int counter;
float wordPositionY;
float wordPositionX;
int numberOfWords;

//counter for holding text --- how can I change the display duration???
boolean bDisplayMessage; // False by default
int startTime; // The (last) time when the mouse have been clicked
final int DISPLAY_DURATION = 1000; // in milliseconds = 1s

void setup() {
  frameRate(2);
  size(800, 600);
  colorMode(HSB);
  smooth();
  noStroke();

  myFont=loadFont("HelveticaBold.vlw");
  textFont(myFont);
  counter=0;
  

  
  linesOfText=loadStrings("AliceInWonderland.txt");
  String aliceBook=join(linesOfText, " ");
  aliceWords=splitTokens(aliceBook, " ,.?!:;[]-\"");

  // This begins counting through the words
  for (int i=0; i<aliceWords.length; i++) { // count through main text
    for (int n=0; n<prepWords.length; n++) { // cycle through preps
      if (prepWords[n].equals(aliceWords[i])) { // equal?
        aliceWords[i]=""; // kill the main word (a prep), then.
        println(prepWords[n]); // let us know what you killed
      }
    }
  }
}

  void draw() {
    
  background(24);
  textSize(random(20,80));
  
  
  String singleWord=aliceWords[counter].trim(); // get rid of extra space
       
    
// bDisplayMessage holds to text on screen longer    
     if (bDisplayMessage)
  {
     text(singleWord, wordPositionX, wordPositionY);
     
  }
  else
  {
    
     wordPositionY=random(300);
     wordPositionX=random(500); //randomize word position
     fill(random(255),245,245);
     text(singleWord, wordPositionX, wordPositionY);
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
  
  
  
  // Tests to see if word from aliceWords[i] is a preposition

  //boolean prepWords(String test) {
  //  boolean flag=false;
  //  for (int i=0; i< 30; i++) {
  //    if (test.equals(prepWords[i])) {
  //      flag = true;
  //    }
  //  }
  //  return flag;//
  //}



