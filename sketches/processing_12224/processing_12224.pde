
import ddf.minim.*;

Minim minim;
AudioSnippet[] spokenWords;
Word[] words;
ArrayList<Word> faders;

void setup()
{
  size(500, 500);

  minim = new Minim(this);

  int numWords = 28;

  words = new Word[numWords];
  words[3] = new Word("nothing", 'q');
  words[4] = new Word("everything", 'w');
  words[5] = new Word("present", 'c');
  words[6] = new Word("composition", 'r');
  words[7] = new Word("art", 't');
  words[8] = new Word("war", 'z');
  words[9] = new Word("time", 'x');
  words[10] = new Word("it", 'e');
  words[11] = new Word("series", 'v');
  words[12] = new Word("is", 'u');
  words[13] = new Word("begins", 'i');
  words[14] = new Word("makes", 'o');
  words[15] = new Word("uses", 'p');
  words[16] = new Word("sees", 'y');
  words[17] = new Word("same", 'n');
  words[18] = new Word("different", 'm');
  words[19] = new Word("classic", ',');
  words[20] = new Word("continuous", '.');
  words[21] = new Word("naturally", 'k');
  words[22] = new Word("simply", 'l');
  words[23] = new Word("again", ';');
  words[24] = new Word("a", 'a');
  words[25] = new Word("the", 's');
  words[26] = new Word("and", 'd');
  words[27] = new Word("in", 'f');
  words[0] = new Word("if", 'g');
  words[1] = new Word("this", 'h');
  words[2] = new Word("there", 'j');

  faders = new ArrayList<Word>();

  spokenWords = new AudioSnippet[numWords];
  for (int i=0; i<spokenWords.length; i++) {
    spokenWords[i] = minim.loadSnippet(words[i].word()+".wav");
  }
}

void draw()
{
  background(0);
  for (int i=0; i<faders.size(); i++) {
    Word f = faders.get(i);
    
    // draw the line
    if(i+1 < faders.size()) {
      strokeWeight(2);
      stroke(color(255, 0, 0), f.getFade());
      line(f.getX(), f.getY(), faders.get(i+1).getX(), faders.get(i+1).getY());
    }
    
    // draw the word
    fill(f.getFade());
    textAlign(CENTER);
    textSize(width/20);
    text(f.word(), f.getX(), f.getY());
   
    f.fade(3);
    
//    if (f.isFaded())
//      faders.remove(f);
  }
  ArrayList<Word> newFaders = new ArrayList<Word>();
  for (int i=0; i<faders.size(); i++) {
    if(!faders.get(i).isFaded()) {
       newFaders.add(faders.get(i));
    }
  }
  faders = newFaders;
}

void keyPressed() {
  for (int i=0; i<spokenWords.length; i++) {
    if (key == words[i].key()) {
      spokenWords[i].rewind();
      spokenWords[i].play();
      faders.add(words[i].fader());
    }
  }
}

class Word {
  String w;
  char c;
  int fade, x, y;
  Word (String aw, char ac) {
    w = aw;
    c = ac;
    fade = 255;
    x = (int) random(width-100) + 50;
    y = (int) random(height-50) + 25;
  }
  String word() { 
    return w;
  }
  char key() { 
    return c;
  }
  Word fader() {
    return new Word(w, c);
  }
  boolean isFaded() {
    return fade <= 0;
  }
  void fade(int n) {
    fade -= n;
  }
  int getFade() {
    return fade;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
}

void stop()
{
  for (int i=0; i<spokenWords.length; i++) {
    spokenWords[i].close();
  }
  minim.stop();

  super.stop();
}


