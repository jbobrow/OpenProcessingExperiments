
/*****************************************
 * Assignment #7 (part 2)
 * Name:         Amanda Guadalupe
 * E-mail:       aguadalupe@brynmawr.edu
 * Course:       CS 110 - Section #2
 * Submitted:    4/26/2012
 * 
 * Here is a word cloud of my twitter status's! Along with a 
 * personified version of the twitter bird  that I drew
 * manually with my wacom tablet, reading all of my 
 * most common words!  
 *
 *With this text analysation I wanted to re-create the status 
 *word cloud by adding a bit of my art to the sketch. I decided 
 *the text should be various colors because each unique word had
 *some sort of meaning in my status's. It's interesting to see 
 *what I tend to say the most! The code to sort my many status's 
 *was tough to understand, however, I was able to gather the 
 *basics of how to aquire, clean, filter, mine, and visualize
 *data. I hope to successfully produce more challenging data 
 *visualizations in the future. 
 ***********************************************/
String file = "tweettweet.txt", raw;
String delimiters = " ,./?;:'\"[{]}\\|=+-_)(*&^%$#@!~";
String [] fileText, words, tokens;
PImage tg;
int [] count;
ArrayList stopWords;
PFont f;
float x, y;
float minFS, maxFS;
int maxWords;
float textFS;
float c;

void setup() { 
  size(700, 700);
  smooth();
  textAlign(CENTER);
  minFS = 15;
  maxFS = 90;
  f = createFont("Andalus", 110, true);
  acquire();
  mine();
  maxWords = max(count);
  display();
}

void draw() {
  if (mousePressed) { //switch up the status's
    display();
    frameRate(2);
  }
}


void display() {//word cloud
  background(255);
  tg = loadImage("tweetme.png"); //twitter bird personified ! 

  image(tg, width/2-300, height/2-250);
  textFont(f);

  for ( int i=0; i<80; i++) {        
    fill (random(255), random(255), random(255));
    textFS = map (count[i], 1, maxWords, minFS, maxFS);
    textFont(f, textFS);
    x = random(10, width-50);
    y = random(9, height-380);
    text(words[i], x, y);
  }
}

void acquire() {
  fileText = loadStrings(file);
  raw = join(fileText, " ");
  raw = raw.toLowerCase();
  tokens = splitTokens(raw, delimiters);
  println("There are" + tokens.length + " words to process.");

  //stop words 
  fileText = loadStrings("stoptweet.txt");
  stopWords = new ArrayList(fileText.length);
  for (int i=0; i<fileText.length; i++) {
    stopWords.add(fileText[i].toLowerCase());
  }
  println("Read" + stopWords.size() +" stop words." );
}

void mine() {
  words = new String[0];
  count = new int[0];

  for (int i=0; i < tokens.length; i++) {

    if (!stopWords.contains(tokens[i])) {
      int idx = contains(tokens[i], words);

      if (idx < 0) {
        words = append(words, tokens[i]);
        count = append(count, 1);
      }
      else {

        count[idx]++;
      }
    }
  }
  wordSorting(words, count);

  println("There are "+ words.length +" unique words.");
}

int contains(String t, String [] ws) {
  for (int i=0; i<ws.length; i++) {
    if (t.equals(ws[i]))
      return i;
  }
  return -1;
}

void wordSorting(String[] ws, int[] cs) {
  int maxIdx;
  int tmp;
  String tmpStr;
  for (int i=0; i<cs.length-1; i++) {
    maxIdx = i;
    for (int j=i; j<cs.length; j++) {
      if (cs[j] > cs[maxIdx])
        maxIdx = j;
    }

    tmp = cs[i];
    cs[i] = cs[maxIdx];
    cs[maxIdx] = tmp;

    tmpStr = ws[i];
    ws[i] = ws[maxIdx];
    ws[maxIdx] = tmpStr;
  }
}


  



