
// Example 18-6: Analyzing recipes

PFont f;              // A variable to hold onto a font
String[] recipes;    // The array to hold all of the text
int counter = 0;   // Where are we in the text (start later b/c Project Gutenberg has licensing info at beginning)

// We will use spaces and punctuation as delimiters
String delimiters = " ,.?!;:[]";

void setup() {
  size(500,600);
  f = loadFont( "HelveticaNeue-Bold-32.vlw" );
  
  // Load Recipes into an array of strings

  String[] rawtext = loadStrings("recipes.txt");
  String everything = join(rawtext, "" );
 
  recipes = splitTokens(everything,delimiters);
  frameRate(1.5);
}

void draw() {
  background(255);
  
  
  // Pick one word from recipes
  String word = recipes[counter];
  
  // Count how many times that word appears in recipes
  int total = 0;
  for (int i = 0; i < recipes.length; i ++ ) {
    if (word.equals(recipes[i])) {
      total ++;
    }
  }
  
  // Display the text and total times the word appears
  textFont(f);
  fill(0);
  text(word,10,90);
  text(total,10,130);
  stroke(0);
  fill(175);
  
  // Move onto the next word
  counter = (counter + 1) % recipes.length;
}

