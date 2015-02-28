
// Tickle My Cock's Waddle
//by Brian Pittman
//with programming help from the Processing book by
//Casey Reas and Ben Fry and the Processing.org web site
//Math 103, Mathematics & Computer Processes
//Warrior/Instructor: Mr. Nick Lally

//Final Project
//Art Statement
//I own a small fully grown little dog. While taking her for a walk the other day a gentleman approached
//us and jokingly asked if I feel emasculated  because my dog is only 12 inches long and weights 5 pounds.
//He noted that he found it amusing to him observing (6' 4" & 232 lbs) me and my dog walking down the street together.
//He asked, "If I would feel more macho with a big dog, i.e,, Rotweiller, Pitbull, Doberman Pinshcer?" I thought 
//for moment, and simply responded that "I don't feel emasculated at all. Besides, a 12 inch 5 lbs cock isn't nothing 
//to sneeze at." My concept is simple. If you want to be conceived as a "REAL" man then get a cock, be proud of it, 
//and tickle it.

String[] headlines = {
  "A new study shows that cocks enjoy having their waddles fondled.",
  };
PFont f; // Global font variable
float x;  // horizontal location of headline
int index = 0;
String word = "COCK";

PImage img;


char[] letters;

void setup() {
  size(600, 600);
  img = loadImage("rooster.png");
  f = loadFont("Serif-48.vlw");

  // Initialize headline offscreen to the right
  x = width;

   textFont(f);
  
  stroke(6);
 
  letters = word.toCharArray();
  }
 
void draw() {
  background(238, 0, 99);
 fill(0);
  image(img, 0, 0, 600, 600); //Establishes image location
  text("cock", random(-600, 600), random(-20, 600));

 
  pushMatrix();
  //Slowly move cursor over the rosster's waddle
  translate(290, 420);//Location of the word: "COCK"
  for (int i = 0; i < letters.length; i++) {
    float angle = map(mouseX, 0, width, -100, PI/8);
    rotate(angle);
    text(letters[i], 0, 0);
    //Offset by the width of the current letters
    translate(textWidth(letters[i]), 0);
  }
  popMatrix();
// Display headline at x  location
  textAlign(LEFT);
  text(headlines[index],x,180);

  // Decrement x
  x = x - 3;
 
  // If x is less than the negative width,
  // then it is off the screen
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width;
    index = (index + 1) % headlines.length;
   

  }
  
 
}


