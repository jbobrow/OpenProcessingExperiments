
/*
http://acm.uva.es/p/v4/464.html
S -> NP + VP
NP -> Det + N
VP -> V + NP
Det -> “the”, "a"
N   “cat”, "dog","man", "woman", "ball"
V  “saw”, "chased"
*/

PFont f;
PImage paper;
String sentence;
String[] sent;
ArrayList words;

word aword;


String[] nouns = { "bracket", "hyphen", "comma", "asterisk", "slash", "dash",  "parenthesis", "colon", "exclamation", "period" };
String[] verbs = { "noticed", "forgot", "dismissed", "replaced", "confused", "remembered" };
String[] artcs = { "the","that" };


void setup() {
  size(400,600);
  
  paper = loadImage("paper2.jpg");
  
  sentence =  getNounPhrase() + " " + getVerbPhrase();
  sent = split(sentence, " ");
  
  words = new ArrayList();
  
  for(int i = 0; i < sent.length; i++) {
    words.add(new word( sent[i], 40+(i*20), 40+(i*20), 0) );
  }
  
}


String getVerbPhrase() { return getVerb() + " " + getNounPhrase(); }

String getNounPhrase() { return getArticle() + " " + getNoun(); }
 
String getArticle() { return artcs[ int(random(0, artcs.length)) ]; }

String getNoun() { return nouns[ int(random(0, nouns.length)) ]; }

String getVerb() { return verbs[ int(random(0, verbs.length)) ]; }

//not using
void draw() {
  background(paper);
  for(int j = 0; j < sent.length; j++) {
    word w = (word)words.get(j);
    w.display();
  
    
    if( mousePressed ) { 
       w.shake();
    } else {
      w.home();
    }
  
  }

  
  
  //textFont(f);
  //fill(136,174,175);
  //text(sentence,100,height/2);
}

void keyPressed() {
  if( key == ' '  ) {  
    sentence =  getNounPhrase() + " " + getVerbPhrase();
    sent = split(sentence, " ");
    
    for(int j = 0; j < sent.length; j++) {
      word w = (word)words.get(j);
      w.setText(sent[j]);
    }
  
  }
}

