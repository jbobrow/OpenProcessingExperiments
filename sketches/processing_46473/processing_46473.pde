
//This sketch is inspired by the project of Jeffrey Bartell "Fear Of A Blank Planet".

  PImage b;
  //PFont f;              // A variable to hold onto a font
  //float leading = 55;   //leading
  String[] design;    // The array to hold all of the text

  // We will use punctuation as delimiters
  String delimiters = ",";

void setup() {
  size(373, 727);
  background(255);

  // Load the image
  b = loadImage("map.jpg");
  image(b, 0, 0);
  
  // Load the font
  // f = loadFont( "Arial.vlw" );

  // Load text into an array of strings
  String[] rawtext1 = loadStrings("random_direction.txt"); 

  // Join the big array together as one long string
  String everything1 = join(rawtext1, "," );

  // All the lines in are first joined as one big String and then split up into an array of sentences.
  // Note the use of splitTokens() since we are using "," as delimiters. 
  design = splitTokens(everything1, delimiters);

  frameRate(1);
}

void draw() {
    
  b = loadImage("map.jpg");
  image(b, 0, 0);
  fill(0);
  int ycounter = 450;
  int index1;

  int a = 0;

  String designPrompt = "test";

  for (int i=1; i < 6; i++) {          // while i is less than 6
    index1 = int(random(design.length));  // generate a random position
    designPrompt = design[index1];        // grab a sentence
    a = designPrompt.length();       // test for length
    text(i+".  "+ designPrompt, 43, ycounter);
    ycounter += 40;
  }
}


