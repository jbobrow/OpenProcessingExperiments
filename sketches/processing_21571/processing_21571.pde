
/*
 Emily Sneeden

/*
Built with WordCram 0.3, http://code.google.com/p/wordcram/
 */

import wordcram.*;
WordCram wordCram;
//String[] e = {"AbadiMT-CondensedExtraBold-20.vlw", "AdobeGothicStd-Bold-30.vlw", "AmericanTypewriter-CondensedBold-15.vlw"};
  //int ranIndex = int(random(0,2));
  //PFont l = e[ranIndex];


void setup() {
  size(800, 600);
  background(255);
  frameRate(14); //slows down frame by frame so they don't all show up at once
  PImage b;
  b = loadImage("bgimagepiet3.png");
  background(b);
  //colorMode(RGB);
  

  initWordCram();
}

void initWordCram() {
  colorMode(RGB);
  Word[] words = new Word[266];
  for (int i = 0; i < words.length; i++) {
    words[i] = new Word(i % 2 == 0 ? "Piet" : "Mondrian", 1);
  }

  wordCram = new WordCram(this).fromWords(words)
    .withSizer(Sizers.byWeight(20, 20))
    .withColors(color(0), color(1), color(1,1,1), color(255,255,0), color(255,0,0), color(0,0,255), color(0,0,0))
    .withAngler(
      new WordAngler() {
        public float angleFor(Word w) {
          return w.word.equals("Piet") ? 0 : HALF_PI;
        }
      })
    .withPlacer(new WordPlacer() {
      public PVector place(Word w, int wordIndex, int wordsCount, int wordWidth, int wordHeight, int fieldWidth, int fieldHeight) {
        int columns = int(random(13,33));
        return new PVector(map(wordIndex % columns, 0, columns, 0, fieldWidth),
                           map(floor(wordIndex / (float)columns), 0, 10, 0, height));
        //return new PVector(random(fieldWidth - wordWidth), random(fieldHeight - wordHeight));
      }
    });
}

int count = 0;
void draw() {
  
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  
  }
  /*
  wordCram.drawAll();
  noLoop();
  */
}

void mouseClicked() {
  //background(255);
    //saveFrame("mondrian-###.png");
  initWordCram();
  //loop();
}


