
/**
 This is an example that demonstrates reading from a file, and also 
 incorporates a numebr of the other examples we looked at.
 
 This reads in a file of "interesting things" into an array. This is
 passed to a Typewriter class. The Typewriter object picks a random
 string from the list, a random lcoation and starts writing the 
 text out to the screen, one character at a time. If it hits the edge
 of the screen, it wraps (not very intelligently -- it doesn't break
 on word boundaries). When the string runs out, it picks a new one.
 
 
 C. Andrews
 2014-01-20
 **/


String[] strings; // our array of Strings
PFont font;
Typewriter tw; // the Typewriter object
void setup() {
  size(600, 600);

  // load the font
  font = createFont("Chalkboard", 40, true);

  // load the text from a file (which should be in your data directory)
  // add it through the Add File option in the Sketch menu above
  // each line in the file will be a new String in the array
  strings = loadStrings("quotes.txt");

  smooth();
  textFont(font);

  // pass the arry to a new Typewriter object
  tw = new Typewriter(strings);

  background(255);
  fill(0);
  frameRate(15);
}

void draw() {
  // use our fade technique
  fill(255, 10);
  rect(0, 0, width, height);

  // tell the typewriter to update
  tw.update();
}

class Typewriter {
  int x, y; // current position
  String[] strings; // the list of Strings
  int currentChar; // the current character position in the current String
  String currentString; // the current String


  /**
   The constructor.
   Initializes the Typewriter with the list os Strings. 
   **/
  Typewriter(String[] theText) {
    strings = theText;

    // pick a random String
    currentString = strings[(int)random(strings.length)];
    // pick a random location on screen where it will fit
    x = (int)max(0, random(width - textWidth(currentString)));
    y = (int)random(textAscent(), height - textDescent());

    // start at the beginning of the String
    currentChar = 0;
  }

  /**
   On each call to update(), this draws one character. 
   When the String runs out, it picks a new one.
   **/
  void update() {
    if (currentChar < currentString.length()) {
      // we haven't run out of characters yet

      fill(0);

      // draw the current character
      text(currentString.charAt(currentChar), x, y);
      // advance the position
      x += textWidth(currentString.charAt(currentChar));

      // if we will overrun, reset back and down one line
      if (x > width) {
        x = 0;
        y += textAscent() + textDescent();
      }
      // advance to the next character
      currentChar++;
    }
    else {
      // we are out of characters -- start over

      // pick a random String
      currentString = strings[(int)random(strings.length)];
      // pick a random location on screen where it will fit
      x = (int)max(0, random(width - textWidth(currentString)));
      y = (int)random(textAscent(), height - textDescent());

      // start at the beginning of the String
      currentChar = 0;
    }
  }
}



