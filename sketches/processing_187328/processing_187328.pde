
// IMAGINE BACON
// by Ole Petter Ferstad

// The line below contains all the different text alternatives.
String [] words = {"and strawberries","in ice cream","covered in chocolate","and fudge","and beer","and eggs","in cake"," topped with whipped cream","and champagne","and bacon","and more bacon","in cookies","with mayonaise","and meat","wrapped around chicken","on fish","to soothe a hangover","and sex","as health food","because why not","to restore your calm","in the future","as the solution to all your problems","grew on trees","for dinner","for lunch","as a drink","in a sundae","and coffee","and pineapple","and apples","and anchovies","and grapes","at a party","and popcorn","on a cold day","on a sunny day","on the beach","in bed","and a good movie","flavored toothpaste","in candy","as a perfume"};

void setup() {
  size(900, 600);
  background(255);
  println(words.length); // Shows the number of alternatives in the words array in the console.
  
  textAlign(CENTER);
  smooth();
  textSize(32);
  stroke(0);
  fill(0);
  text(words[int(random(words.length))], 450, 300); // Draws the initial random word from the words array .
  
  textAlign(CENTER);
  smooth();
  textSize(32);
  stroke(0);
  fill(0);
  text("Imagine bacon", 450, 250); // The static first line of text.
}

void draw() {
}

void mousePressed() {
  stroke(255);
  fill(255);
  rect(0, 260, 900, 50); // Clears the second line of text with every mouse click.
  
  textAlign(CENTER);
  smooth();
  textSize(32);
  stroke(0);
  fill(0);
  text(words[int(random(words.length))], 450, 300); // Draws a random text alternative from the words array with every mouse click.
}



