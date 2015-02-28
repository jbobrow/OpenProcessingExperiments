
import rita.wordnet.*;

String [] loadedText;
String allWords;
String [] words;
String selection;
int tempi;

RiWordnet wordnet;

PFont myFont;
String [] results;


void setup() {

  size(640, 480);
  myFont = loadFont("Arial-Black-16.vlw");
  wordnet=new RiWordnet(this);

  loadedText = loadStrings ("processing_text.txt");
  allWords = join (loadedText, " ");
  words = splitTokens (allWords, " ");

  // println(results[0]+" "+results.length);
}

void draw() {

  background (0);
  generate();

  try {
    for (int i=0; i<results.length; i++) {

      text (words[tempi], 15, 15);
      text (results[i], 15, (40+ (i*15)));
    }
  }

  catch (Exception e) {
  }
}

void generate()
{

  if (frameCount%200 == 1) {

    tempi= int(random(0, words.length));
    selection = words[tempi];
    results = wordnet.getAllSynonyms(selection, "n");
  }
}


