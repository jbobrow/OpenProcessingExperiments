
HashMap words;  // HashMap object

String[] tokens;  // Array of all words from input file
int counter;

PFont f;
PImage b;

void setup() {
  size(500, 640);
  words = new HashMap();
  //frameRate=(130);
  //frameRate(130);

  // Load file and chop it up
  // file has been modified to remove "the, and, for, in, that, with, as, it, at, from"
  String[] lines = loadStrings("mypaper.txt");
  String allText = join(lines, " ");
  tokens = splitTokens(allText, " ,.?!:;[]-");
  f = createFont("Georgia", 50, true); 

  //b = loadImage("");
}

void draw() {
  background(255);
  fill(199,50,120);
  


  //image(b, 120, 120);
  textFont(f);
  text("Web 3.0", 30, 50);

  fill(0,0,0,210);

  // Look at words one at a time
  String s = tokens[counter];
  counter = (counter + 1) % tokens.length;

  // Is the word in the HashMap
  if (words.containsKey(s)) {
    // Get the word object and increase the count
    // We access objects from a HashMap via its key, the String
    Word w = (Word) words.get(s);
    w.count(); 

  } 
  else {
    // Otherwise make a new word
    Word w = new Word(s);
    // And add to the HashMap
    // put() takes two arguments, "key" and "value"
    // The key for us is the String and the value is the Word object
    words.put(s, w);    
  }

  // Make an iterator to look at all the things in the HashMap
  Iterator i = words.values().iterator();

  // x and y will be used to locate each word
  float x = 0;
  float y = 100;

  while (i.hasNext()) {
    // Look at each word
    Word w = (Word) i.next();

    // Only display words that appear 3 times
    if (w.count > 5) {
      // The size is the count
      int fsize = constrain(int(w.count*1.7), 3, 100);
      textFont(f, fsize);
      text(w.word, x, y);
      // Move along the x-axis
      x += textWidth(w.word + " ");
    }



    // If x gets to the end, move Y
    if (x > width) {
      x = 0;
      y += 30;
      // If y gets to the end, we're done
      if (y < 0) {
        break; 
      }
    }
  } 
}



class Word {

  int count;
  String word;

  Word(String s) {
    word = s;
    count = 1;
  }

  void count() {
    count++;
  }
  

}

  void mousePressed() { 
  link("http://techfold.com/2007/08/28/7-definitions-of-web-30/"); 
}

