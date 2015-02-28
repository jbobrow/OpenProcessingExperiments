
// Code by Jeremy Peterson 2011 //
// using code adapted from examples at RitaWordnet //
// useing the RitaWordnet library //
// font thanks to Google Fonts//

import rita.wordnet.*;

RiWordnet wordnet;
PFont font1;
String word, hypos[];
String word2, hypos2[];
void setup() 
{
  size(600, 300);
  frameRate = 30;  
  font1 = loadFont("JosefinSlab-Thin-64.vlw");  
  wordnet = new RiWordnet(this);
}

void draw() 
{  
  background(149,172,179);
  
  // get synonyms every 225 frames 
  if (frameCount%225 == 1)  
  { 
    String[] tmp = null;
    while (tmp == null) {
      word = ("failure");
      
      tmp = wordnet.getSynonyms(word, "n", 1);
    }
      
    String[] tmp2 = null;
    while (tmp2 == null) {
      word2 = ("opportunity");  
      tmp2 = wordnet.getSynonyms(word2, "n", 1);
    }    
    Arrays.sort(tmp);
    hypos = tmp;   
   hypos2 = tmp2; 
  }

textFont(font1);  // draw static words
text("is",30,160);


  int yPos=50;   // draw the synonyms
  textFont(font1);
  for (int i = 0; i < hypos.length; i++)
    text(hypos[i], 30, yPos += 48);  
    
    
  int y2Pos=220;   // draw the synonyms 2
  textFont(font1);
  for (int i = 0; i < hypos2.length; i++)
    text(hypos2[i], 30, y2Pos);
    
    text("."); // the period.
  
}



