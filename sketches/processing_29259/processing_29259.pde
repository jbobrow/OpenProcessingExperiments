
String theText ="";

PFont myFont;
 
void setup() {
  size(800, 200);
  myFont = loadFont("Courier-20.vlw");
  textFont(myFont);
}
 
void draw() {
  background(255);
  smooth();
  
  float wordPositionX = 0;
  float wordPositionY = 0;
 
  for (int i = 0; i<theText.length(); i++) {

    char letter = theText.charAt(i);
    float letterWidth = textWidth(letter);
    switch (letter) {
      
    case 'A':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'B':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'C':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;

    case 'D':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      break;
      
    case 'E':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      break;    
      
    case 'F':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      break;
      
    case 'G':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case 'H':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

   case 'I':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'J':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;
      
    case 'K':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;

    case 'L':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'M':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'N':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'O':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case 'P':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'Q':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;

   case 'R':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'S':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'T':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      break;

    case 'U':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 8, 200);
      break;
      
    case 'V':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      break; 
      
    case 'W':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'X':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case 'Y':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;
      
    case 'Z':
      noStroke();
      fill(255);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
    
    case 'a':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'b':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'c':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;

    case 'd':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      break;
      
    case 'e':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      break;    
      
    case 'f':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      break;
      
    case 'g':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case 'h':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

   case 'i':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'j':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;
      
    case 'k':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;

    case 'l':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'm':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 'n':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'o':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case 'p':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'q':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;

   case 'r':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;    
      
    case 's':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 't':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      break;

    case 'u':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 8, 200);
      break;
      
    case 'v':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      break; 
      
    case 'w':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case 'x':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case 'y':
      noStroke();
      fill(0);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;
      
    case 'z':
      noStroke();
      fill(255);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case '.':
      noStroke();
      fill(255);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 8, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 4, 200);
      break;
      
    case '!':
      noStroke();
      fill(255);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    case '?':
      noStroke();
      fill(255);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;
      
    case ',':
      noStroke();
      fill(255);
      rect(wordPositionX, wordPositionY, 12, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 10, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      break;
      
    case ' ':
      fill(255);
      rect(wordPositionX, wordPositionY, 6, 200);
      fill(0);
      rect(wordPositionX, wordPositionY, 4, 200);
      fill(255);
      rect(wordPositionX, wordPositionY, 2, 200);
      break;

    }
 
    fill(0);
    // text(letter, wordPositionX, 30 + wordPositionY);
 
    wordPositionX = wordPositionX + letterWidth;
 
    if(wordPositionX > width-0) {
      wordPositionX = 0;
      wordPositionY = wordPositionY + 200;
    }
  }
 
  String gesuchtesWort = "and";

  int wordIndex = theText.indexOf(gesuchtesWort);
  int wordCount = 0;
  while(wordIndex > -1) {
    wordCount = wordCount + 1;
    wordIndex = theText.indexOf("and", wordIndex+1);
  }
  println(wordCount);
}
 
void keyPressed() {
  if((int)key != 65535) {
    theText += key;
    println("Wert des Zeichens " + key + " ist " + int(key));
  }
}


