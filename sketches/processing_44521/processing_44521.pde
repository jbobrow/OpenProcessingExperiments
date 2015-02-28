


PFont f;              // A variable to hold onto a font
float leading = 55;   //leading
String[] design;    // The array to hold all of the text
String[] psychology;
String[] invention;
int counter = 1509;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)
boolean bStop;

// We will use spaces and punctuation as delimiters
String delimiters = " _',.?!;:[]";

void setup() {
  size(700, 500);
  background(255, 198, 0); 

  // Load the font
  f = loadFont( "Helvetica-Bold-48.vlw" );

  // Load King Lear into an array of strings
  String[] rawtext1 = loadStrings("pg30804.txt"); /*Applied Design for Printers, Harry Lawrence Gage, 1920*/
  String[] rawtext2 = loadStrings("psychology.txt"); /*Analysis of Mind, Bertrand Russel, 1921*/
  String[] rawtext3 = loadStrings("pg19533.txt"); /*Stories of Great Inventors, Hattie E. Macomber, 1897*/

  // Join the big array together as one long string
  String everything1 = join(rawtext1, "" );
  String everything2 = join(rawtext2, "" );
  String everything3 = join(rawtext3, "" );

  // All the lines in King Lear are first joined as one big String and then split up into an array of individual words. 
  // Note the use of splitTokens() since we are using spaces and punctuation marks all as delimiters.  
  design = splitTokens(everything1, delimiters);
  psychology = splitTokens(everything2, delimiters);
  invention = splitTokens(everything3, delimiters);
  frameRate(1);
}

void draw() {

  int a = 0;
  int b = 0;
  int c = 0;

  int index1;
  int index2;
  int index3;

  String designPrompt = "test";
  String psychologyPrompt  = "test";
  String inventionPrompt  = "test";


  while (a < 4) {          // while a is less than 4
    index1 = int(random(design.length));  // generate a random position
    designPrompt = design[index1];        // grab a word
    a = designPrompt.length();            // test for length
  }                                       // if it is not longer than 4, it will loop back to the beginning

  while (b < 4) {
    index2 = int(random(psychology.length));  // same as int(random(4))
    psychologyPrompt = psychology[index2];
    b = psychologyPrompt.length();
  }

  while (c < 4) {
    index3 = int(random(invention.length));  // same as int(random(4))
    inventionPrompt = invention[index3];
    c = inventionPrompt.length();
  }

  background(255, 198, 0); 
  textFont(f);
  fill(0);
  textLeading(leading);
  text("make" + " " + inventionPrompt + " " + "using" + " " + designPrompt + " " + "about" + " " + psychologyPrompt + ".", 100, 100, 500, 480);
}


