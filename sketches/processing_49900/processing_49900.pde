
import controlP5.*;
import wordcram.*;
import wordcram.text.*;

ControlP5 controlP5;
WordCram wordCram;

String txt[] = {
  "Einleitung.txt", "aschenputtel.txt", "froschkoenig.txt", "rotkaeppchen.txt"
};

int ind = 0;

void setup() {
  size(800, 600);
  background(238, 238, 238);

  controlP5 = new ControlP5(this);
  controlP5.addButton("Aschenputtel",0,50,20,80,19);
  controlP5.addButton("Froschkoenig",20,200,20,80,19);
  controlP5.addButton("Rotkaeppchen",100,350,20,80,19);

  initWordCram();
}

void draw() {
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
}

void Froschkoenig() {
  ind=2;
  background(238, 238, 238);
  initWordCram();
}

void Rotkaeppchen() {
  ind=3;
  background(238, 238, 238);
  initWordCram();
}

void Aschenputtel() {
  ind=1;
  background(238, 238, 238);
  initWordCram();
}

void initWordCram() {
  background(238, 238, 238);
  wordCram = new WordCram(this)
  .fromTextFile(txt[ind])
  .withStopWords(StopWords.GERMAN)
  .withFont(createFont("Rock.TTF", 1))
  .sizedByWeight(10, 110)
  .withColors(color(234, 21, 122), color (0, 112, 192), color (26, 179, 159));
  //println(ind);
}


