
import wordcram.*;

/* WordCram can tell you which word (if any) 
 * is at a given [x,y] coordinate. You can use this
 * to make words "clickable", by implementing 
 * Processing's mouseClicked() method.
 */

WordCram wordCram;
String level="opening.txt";
int bgLvl=230;

void setup() {
  size(800, 550);
  background(bgLvl);

  wordCram = new WordCram(this).fromTextFile(level);
  wordCram.sizedByWeight(10,20);
  wordCram.drawAll();
  for (Word word : wordCram.getSkippedWords()) {
   switch (word.wasSkippedBecause()) {
   case WordCram.SHAPE_WAS_TOO_SMALL:
     println(word.word + ": shape was too small");
     break;
   case WordCram.WAS_OVER_MAX_NUMBER_OF_WORDS:
     println(word.word + ": was over max # of words");
     break;
   case WordCram.NO_SPACE:
     println(word.word + ": no room to place it");
     break;
   }
 }

}

void draw() {
  
}

void mouseClicked() {


  Word wordAtMouseClick = wordCram.getWordAt(mouseX, mouseY);
  print("[" + mouseX + "," + mouseY + "]: ");
  if (wordAtMouseClick != null) {
  String clickedString = wordAtMouseClick.toString();
  println(" ");
  String[] m = split(clickedString, ' ');
  println(m[0]);
  
  if(m[0].equals("plant"))
  {
   level="avenge.txt";
   bgLvl+=10;
   setup();
  }
  
  if(m[0].equals("work"))
  {
   level="harold.txt";
   bgLvl+=10;
   setup();
  }
  else{
  setup();
  bgLvl-=10;
  }
  }
  else {
    setup();
  }
}



