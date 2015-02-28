
HashMap words;  // HashMap object
HashMap words2;  // HashMap objekt
String[] tokens;  // array aller worte der eingangsdatei

int counter;

String wort;
PImage a;
PFont f;
PShape g;

float offset = 90;
float angle = 16;
float scalar = 5;

void setup() {
  size(720, 400);
  words = new HashMap();
  smooth ();
  
 

  //lade datei ...
  String[] lines = loadStrings("dnk_text_pdf.txt");
  String allText = join(lines, " ");
  tokens = splitTokens(allText, " ,.?!:;[]-");
  f = createFont("FuturaStd-Light-48.vlw", 76, true); 

   
    g = loadShape("/Users/nataljapomozova/Documents/Processing/sketch_aug08a/data_for_code_aug08a/dnk_grafik_03-01g.txt");
   
   

}

void draw() {
  background(255);
  fill(0);
  
  // Look at words one at a time
  String s = tokens[counter];
  counter = (counter + 30) % tokens.length;


  float v1 = offset + cos(angle)*scalar;
   float v2 = offset + sin(angle)*scalar;

  // Is the word in the HashMap
  if (words.containsKey(s)) {
    // hol ein wort und vergößere die anzahl
    // objekte durch key String aus hashmap
    Word w = (Word) words.get(s);
    w.count(); 
  } else {
    // neuese wort trotzdem
    Word w = new Word(s);
    // zu hashmap
    // put() = "key" and "value"
    // key==String;value== wort-obj
    words.put(s, w);    
  }

  // lass iterator auf alle dateien im Hash durchsuchen
  Iterator i = words.values().iterator();

  // x und y plazieren jedes wort
  float x = 20;
  float y = height-10;

  while (i.hasNext()) {
    //Lschau auf jedes wort
    Word w = (Word) i.next();
    
    // zeige wort welches nur 3 mal auftaucht
    if (w.count > 3) {
      // count=größe (fsize)
      int fsize = constrain(w.count, 10, 120);
      textFont(f, fsize);
      text(w.word, x, y);
      

x+=textWidth(w.word+"");
    }
// x am ende,bewege Y
    if (x > width) {
      x = 0;
      y -= 50;
 
      // y am ende=  Ende
      if (y < 0) {
        break; 
      }
    }
  } 


  } 


class Word {
  
  int count;
  String word;
  
  Word(String s) {
    word = s;
    count = 5;
  }
  
  void count() {
    count++;
  }

}  




