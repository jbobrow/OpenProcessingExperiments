
// probably only one sentence is in use here (root)
ArrayList<Sentence> sentences = new ArrayList();
int IDsquare=0;

void setup() {
  size(900, 700);
  background(20);

  // definde root: 
  // the sentence 
  String mySentence = "This is a sentence.";
  // sub-sentences: this list must have the same number as words in mySentence
  String[] listOfSentences = { 
    "Another Sentence Number ONE.", "Another Sentence Number SECOND.", 
    "Another Sentence Number THREE.", "Another Sentence Number FOUR."
  };
  Sentence currSentence = new Sentence( 22, height/2, 
  mySentence, 
  listOfSentences);
  sentences.add(currSentence); 
  //
} // func 

void draw() {
  background(20);
  for (Sentence currSentence : sentences) {
    currSentence.display();
  } // for
} // func

// -------------------------------------------

void mousePressed() {
  // mouse 
  for (Sentence currSentence : sentences) {
    if (currSentence.selected ()) {
      // println(currSentence.squareWord);
      break;
    }
  } // for
  //
} // func 

/* *************** classes **************** */

class Sentence {

  // sentence 
  String theSentence; 

  // its words 
  ArrayList<Square> squares = new ArrayList();

  int x; // the x position 
  int y; // the y position 

  // constr
  Sentence (int xTemp, int yTemp, 
  String tempSentence, 
  String[] listOfChildren) {
    // 
    println (tempSentence);
    //println (listOfChildren);
    theSentence = tempSentence;
    String[] words = split (tempSentence, " ");
    x = xTemp; 
    y = yTemp;
    int xPos=20;  
    for (int i = 0; i < words.length; i++) {
      // println(listOfChildren[i]); 
      if (listOfChildren != null) {
        // println("1---");
        squares.add( new Square( IDsquare, x+xPos, y, 
        words[i], 
        color ( 10, IDsquare*20+40, 20), 
        listOfChildren[i] ) );
      } // if 
      else {
        squares.add( new Square( IDsquare, x+xPos, y, words[i], color ( 10, IDsquare*20+40, 20) ) );
      }
      IDsquare++;
      //
      xPos += textWidth(words[i]) + 12;
    } // for
  } // constr

  void display() {
    for (Square currSquare : squares) {
      currSquare.display();
    } // for
  } // method

  boolean selected() {
    for (Square currSquare : squares) {
      if (currSquare.selected ()) {
        println(currSquare.squareWord);
        return true;
      } // if
    } // for
    return false;
  } // method
  //
} // class 

// ------------------------------

class Square {

  // the single words 

  String squareWord=""; // the word of the square

  int x; // the x position of the square
  int y; // the y position of the square

  float s; // the width of the square
  color c; // the color of the square

  boolean expanded = false; 

  // the dependent sentences 
  Sentence sentence;

  // constr I
  Square (int IDsquare, 
  int tempX, int tempY, 
  String tempsquareWord, 
  color tempC, 
  String list1 ) {
    x = tempX;
    y = tempY;
    s = textWidth(tempsquareWord)+5;
    c = tempC;
    squareWord = tempsquareWord;
    int yPosNew=-12;
    sentence = new Sentence( x+30*IDsquare, y+yPosNew*IDsquare-40, list1, null);
    // sentences.add(currSentence);
    //
  } // constr I

  // constr II
  Square (int IDsquare, 
  int tempX, int tempY, 
  String tempsquareWord, 
  color tempC ) {
    x = tempX;
    y = tempY;
    s = textWidth(tempsquareWord)+5;
    c = tempC;
    squareWord = tempsquareWord;
    // location = tempN;
    //    String[] listOfSentences = {
    //    };
    sentence = null; // new Sentence( x+50, yPosNew, list1, listOfSentences);
    // sentences.add(currSentence);
  } // constr II

  void display() {
    /* draw the square */
    // int margin = 49;
    // rectMode(CENTER);
    noStroke();
    fill(c);
    rect(x, y, s, 20, 7 );
    //
    /* draw the number inside the square */
    noStroke();
    fill(0);
    //textFont(loadFont("TrebuchetMS-Bold-48.vlw"), 48);
    textAlign(LEFT);
    text(squareWord, x+2, y+13);
    if (expanded) {
      // println ("yes, expanded");
      if (sentence!=null)
        sentence.display();
      stroke(255);
      noFill();  
      bezier(x+20, y-12, 10, 20, 30, 10, sentence.x+18, sentence.y+8);
    }
  } 
  // method

  boolean selected() {
    /* check if the mouse is over the square */
    if (mouseX >= x && mouseX <= x+(s) &&
      mouseY >= y && mouseY <= y+(s)) {
      expanded = ! expanded; 
      return true;
    } else {
      return false;
    }
  } // method
  //
}

// class
// ----------------------------------------

