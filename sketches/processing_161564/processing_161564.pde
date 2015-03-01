
import wordcram.*;

WordCram wordCram;

void setup() {
  size(600, 400);
  background(222, 222, 222);

  wordCram = new WordCram(this)
    .fromWebPage("http://www.educ.ar/dinamico/UnidadHtml__get__6308fa7b-7a08-11e1-823d-ed15e3c494af/index.html")
    .withColor(#000000)
    .sizedByWeight(8, 70);
}

void draw() {
  if (wordCram.hasMore()) {
    wordCram.drawNext();
    report();
  }
  else {
    noLoop();
  }
}

void report() {
  Word[] words = wordCram.getWords();
  int tooMany = 0;
  int tooSmall = 0;
  int couldNotPlace = 0;
  int placed = 0;
  int left = 0;

  for (int i = 0; i < words.length; i++) {
    Word word = words[i];
    if (word.wasSkipped()) {

      WordSkipReason skipReason = word.wasSkippedBecause();

      switch(skipReason) {
      case WAS_OVER_MAX_NUMBER_OF_WORDS:
        tooMany++;
        break;
      case SHAPE_WAS_TOO_SMALL:
        tooSmall++; 
        break;
      case NO_SPACE:
        couldNotPlace++; 
        break;
      }
    }
    else if (word.wasPlaced()) {
      placed++;
    }
    else {
      left++;
    }
  }

  print("TooMany " + tooMany + "  ");
  print("TooSmall " + tooSmall + "  ");
  print("CouldNotPlace " + couldNotPlace + "  ");
  print("Placed " + placed + "  ");
  println("Left " + left);
}



