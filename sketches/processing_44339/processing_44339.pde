
// Jeremy Peterson 2011
// based on code from: 
// http://www.rednoise.org/rita/documentation/rimarkov_class_rimarkov.htm



import rita.*;
import rita.wordnet.*;

RiWordnet wordnet;

int MAX_LINE_LENGTH = 40;
String data = "http://jeremyryanpeterson.com/PUB_DROP/";

RiText line2[];
RiText rts2[];
RiText rts[];
RiMarkov markov;

void setup()
{    
  size(1000, 400);


 
  RiText.setDefaultFont("Ziggurat32.vlw");
  RiText.setDefaultBBoxVisibility(false);

  
//  line1 = new RiText(this, txt, 64, 50);        // line
//  line2 = RiText.createWords(this, txt, 64, 100); // words
//  line3 = RiText.createLetters(this, txt, 64, 150); // letters
  
  
  

  // a little info msg
  new RiText(this, "click to (re)generate!", 135, height/2);
  
  RiText.setDefaultAlignment(LEFT);

  // create a new markov model w' n=3
  markov = new RiMarkov(this, 2); 
 markov.setTokenizerRegex("\\s"); 
  
  markov.setPrintIgnoredText(true);

  // load files into the model
//   markov.loadFile(data+"simple_1.txt");
// markov.loadFile(data+"idioms.txt");
//  markov.loadFile(data+"taote-mitchell.txt");
  markov.loadFile(data+"eng_proverbs.txt");  
//  markov.loadFile(data+"proverbs.txt");    
}

void draw()
{
  background(255);
}

// generate on mouse click
void mouseClicked() 
{   
  RiText.deleteAll(); // clean-up old data

//  String[] lines = markov.generateSentences(1);

String[] results = markov.generateSentences(1);
          
     for (int i = 0; i < 1; i++) {
       results[i] = markov.generateSentence();
     }


      
//  // get synonyms every 100 frames 
//  if (frameCount%225 == 1)  
//  { 
//    String[] tmp = null;
//    while (tmp == null) {
//      word = word;
//      
//      tmp = wordnet.getSynonyms(word, "n", 1);
//    }
//      
//    String[] tmp2 = null;
//    while (tmp2 == null) {
//      word2 = ("opportunity");  
//      tmp2 = wordnet.getSynonyms(word2, "n", 1);
//    }    
//    Arrays.sort(tmp);
//    hypos = tmp;   
//   hypos2 = tmp2; 
//  }
  
  
  

  // lay out the return text starting at x=20 y=50)
//    rts = RiText.createLines(this, lines, 20, 200, MAX_LINE_LENGTH);
//  
  rts2 = RiText.createLines(this, results, 20, 50, MAX_LINE_LENGTH);
  
//  line2 = RiText.createWords(this, lines, 20, 300, MAX_LINE_LENGTH);

  	
}


