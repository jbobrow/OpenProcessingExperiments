
import java.awt.*;


PFont f;              // A variable to hold onto a font
String[] kinglear;    // The array to hold all of the text
String leastCommonWord = "NOTHIN' YET";
String[] leastCommonWords = new String[100];
int leastCommonWordsCounter = 0;
int counter = 1509;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)
int leastCommonCounter = 10;

// We will use spaces and punctuation as delimiters
String delimiters = " ,.?!;:[]>()";

void setup() {
  background(255);
  noStroke();
  size(600, 600);

  // Load the font
  f = loadFont( "AndaleMono-9.vlw" );

  // Load King Lear into an array of strings
  String url = "tdota.txt";
  String[] rawtext = loadStrings(url);

  // Join the big array together as one long string
  String everything = join(rawtext, "");

  // All the lines in King Lear are first joined as one big String and then split up into an array of individual words. 
  // Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.  
  kinglear = splitTokens(everything, delimiters);
  frameRate(25);
}

void draw() {
  background(255);
  // Pick one word from King Lear
  String theword = kinglear[counter];

  // Count how many times that word appears in King Lear
  int total = 0;
  for (int i = 0; i < kinglear.length; i ++ ) {
    if (theword.equals(kinglear[i])) {
      total ++;
    }
  }

  if (total <= leastCommonCounter) {
    leastCommonCounter = total;
    leastCommonWord = theword;
    leastCommonWords[leastCommonWordsCounter] = leastCommonWord;
    leastCommonWordsCounter++;
  }

  // Display the text and total times the word appears

  textFont(f);
  fill(0);
  text(theword, 10, 40);
  text(total, 10, 55);
  text(leastCommonWord, 10, 70);
  text(leastCommonCounter, 10, 80);
  fill(175);
  rect(10, 10, total/4, 10);
  


  //println(theword + " " + total);
  //println(counter);
  /*
  println(leastCommonWord + " " + leastCommonCounter);
  */
  // Move onto the next word
  counter = (counter + 1) % kinglear.length;
  if(leastCommonWordsCounter >= 99){
    println(leastCommonWords);
  }
}



