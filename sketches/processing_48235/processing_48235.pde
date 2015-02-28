


// Loads the Grimm's Tales and display Word by Word with 
// frequency (how many occurances in total) of each Word. 
// Shows frequency by size & color of the word.

// constants -----
// for split
final String delimiters = " ,.?!;:[]()";
// for Timer
final int WaitTime = 500;  
// for loading 
final String url_Adress = "http://www.gutenberg.org/cache/epub/2591/pg2591.txt"; 

// vars -----
PFont font; // Font 
ArrayList ListOfAllWords; // this is a list of objects of class oneSingleWord
int i = 370;  // this is the first word after the TOC - or use 0 here
int Last_i = -1;  // check whether it's different 
int myOldTime;    // for Timer

// =========================================================================
// classes

class oneSingleWord {

  // only one single word
  // 
  // its properties
  String Text1; 

  oneSingleWord(String TextTemp)
  {
    Text1 = TextTemp;
  }

  void display(int i2)
  {
    int total = 0;
    stroke(175);
    fill(175);
    for (int i = 0; i < ListOfAllWords.size(); i ++ ) {
      oneSingleWord Element = (oneSingleWord) ListOfAllWords.get(i); 
      if (Text1.equals(Element.Text1)) {
        total ++;
      } // if
    } // for    
    int textSize1 = total; 
    if (textSize1<12) {
      textSize1=12;
    }
    if (textSize1>504) {
      textSize1=504;
    }    
    fill (color(textSize1, 2, 2));
    textSize( textSize1 ); 
    textAlign(CENTER, CENTER);
    text(Text1, width/2-10, height/2-10);
    //textSize(22);
    //text(Text1 + " (has number " + i2 + ")", 10, 90);
    //text(total + " occurances.", 10, 110);
    //rect(10, 50, total/4, 20);
  } // function
} // class ends here 

// =========================================================================
// in-build functions

void setup()
{
  // Inits
  // Screen ---------------------
  size(800, 500);
  // size(screen.width, screen.height);  
  //background(111);
  noCursor();
  // Font -----------------------
  // font = createFont("Serif-16.vlw",16);
  font = createFont("FFScala-32.vlw", 22); 
  textFont(font);
  // Create an empty ArrayList --------------
  ListOfAllWords = new ArrayList();
  // fill the ArrayList with text from url
  FillArrayForClass (url_Adress);
  // Other Inits
  println ("Working");
  // set the timer 
  myOldTime = millis();
}

void draw()
{
  // This function is called again and again and 
  // acts therefore as a Loop. 
  // When the word is different from the old:
  if (i != Last_i ) {
    // display it
    background(111);
    oneSingleWord Element = (oneSingleWord) ListOfAllWords.get(i); 
    Element.display(i);
    // set the timer 
    myOldTime = millis(); 
    // set last word = current Word 
    Last_i = i;
  }
  // if enough time has passed go to next word
  if (myOldTime + WaitTime < millis()) {
    i++;
  }
  // at the end, quit
  if (i>ListOfAllWords.size()) {
    println ("End.");
    exit();
  }
}

// =========================================================================
// own functions

void FillArrayForClass (String url) {
  // Loading all tales and store them in a ArrayList.
  // loading
  println ("Start reading");
  String rawtext[] = loadStrings(url);
  println ("Stop reading");
  // join all paragraphs 
  String everything = join(rawtext, " " );
  // split it Word by Word into an Array
  String [] WordListTemp = splitTokens(everything, delimiters);
  // push as objects of class "oneSingleWord" in ArrayList 
  for (int i = 0; i < WordListTemp.length; i ++ ) {
    ListOfAllWords.add (new oneSingleWord(WordListTemp[i]));
  } // for
  // print how many words there are
  println ("Words: " + ListOfAllWords.size());
} // function
// =========================================================================


