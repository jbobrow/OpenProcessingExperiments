
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/12413*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
Built with WordCram 0.2, http://code.google.com/p/wordcram/
 US Constitution text from http://www.usconstitution.net/const.txt
 Liberation Serif font from RedHat: https://www.redhat.com/promo/fonts/
 */

import wordcram.*;
import wordcram.text.*;

WordCram wordCram;
Word[] words;

void setup() {
  size(800, 600);
  background(0);
  colorMode(HSB);

  String[] usConst = loadStrings("deniyombenya.txt");
  words = new TextSplitter(StopWords.ENGLISH + " shall").split(usConst);
  initWordCram();
}

void initWordCram() {
  wordCram = new WordCram(this, 
  words, 
  Fonters.alwaysUse(createFont("Consolas-250.vlw", 1)), 
  Sizers.byWeight(10, 250), 
  Colorers.pickFrom(color(255), color(145), color(95), color(45)), 
  Anglers.mostlyHoriz(), 
  Placers.horizLine());
}

void draw() {
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
}

void mouseClicked() {
  background(0);
  initWordCram();
}



