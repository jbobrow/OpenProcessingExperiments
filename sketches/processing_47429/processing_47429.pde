

PFont font;
String fontFile = "FranklinGothicBT-Roman-48.vlw";
int fSize = 96;
int maxSize = 192;
int minSize = 48;
String txt = "london.txt";
 
String[] words;
int[]  count;
int most;
int least;
float currentSize;
int currentIndex;
 
void setup(){
  size(600, 400, P2D);
  colorMode(HSB, TWO_PI, 1, 1, 1);
  rectMode(CORNER);
  background(color(0, 0, 1));
  smooth();
  font = loadFont(fontFile);
  initializeWords(); 
  //loop();
 
}
 
void draw() {
  while(currentIndex < words.length) {
    float relsize = map(count[currentIndex],least,most,minSize,maxSize);
    print("maxSize " + maxSize);
    print("count " + count[currentIndex]);
    boolean drawn = false; 
    while (!drawn) {
      drawn = drawWord(words[currentIndex], relsize);
      if (!drawn)
       println("redrawing "+words[currentIndex]);
        relsize = relsize * 0.95;
    }
    currentIndex++;
  } 
}
 
boolean drawWord(String word, float wordSize) {
  println (word);
  int intSize = (int)wordSize;
  println(wordSize);
  textFont(font, wordSize);
  int w = int(textWidth(word));
  PGraphics g = createGraphics(w, intSize, P2D);
  g.beginDraw();
  g.background(color(0, 0, 1, 0));
  g.fill(color(0,0,0));
  g.textAlign(CENTER, CENTER);
  g.translate(w/2, wordSize/2);
  g.scale(wordSize / fSize);
  g.textFont(font);
  g.text(word, 0, 0);
  g.endDraw();
 
  PGraphics gMask = createGraphics(w, intSize, P2D);
  gMask.beginDraw();
  //gMask.background(color(0, 0, 1, 1));
  gMask.image(g, 0, 0);
  gMask.filter(ERODE); 
  gMask.filter(ERODE);
  gMask.endDraw();
   
  for (int tries=50; tries>0; tries--) {
    int x = (int)random(width-w);
    int y = (int)random(height-intSize);
     
    boolean fits = true;
    for (int dx = 0; dx< w && fits; dx++) {
      for (int dy = 0; dy<intSize && fits; dy++) {
        if (brightness(gMask.get(dx, dy))<0.5) {
          if (brightness(get(x+dx, y+dy))<0.5) {
            fits = false;
          }
        }
      }
    }
    if (fits) {
      image(g, x, y);
      println(x + "," + y);
      return true;
    }
  }
  return false;
}
 
boolean equalColor(color c1, color c2) {
  String h1 = hex(color(c1));
  String h2 = hex(color(c2));
  return h1.equals(h2);
}
 
 
void initializeWords() {
  ArrayList ignore = new ArrayList();
  String[] ignoreStrs  = loadStrings("ignore.txt");
  for (int i = 0; i < ignoreStrs.length; i++) {
    ignore.add(ignoreStrs[i].trim().toUpperCase());
  }
  HashMap wordcount = new HashMap();
  String[] lines = loadStrings(txt);
  for (int i = 0; i < lines.length; i++) {
   // String[] words = split(lines[i], " "); 
   // for (int j = 0; j < words.length; j++)  {
      String word = clean(lines[i]).toUpperCase();
      if (word.length() == 0) {
        continue;
      }
      if (ignore.contains(word)) {
        continue;
      }
      Integer count = (Integer)wordcount.get(word);
      if (count == null) {
         wordcount.put(word, new Integer(1));
       }
       else {
         int newCount = count.intValue() + 1;
         wordcount.put(word, new Integer(newCount));
       }
    }
  //}
  words = new String[wordcount.size()];
  count = new int[wordcount.size()];
  int idx = 0;
  Iterator it = wordcount.entrySet().iterator();  // Get an iterator
  while (it.hasNext()) {
      Map.Entry me = (Map.Entry)it.next();
      words[idx] = (String)me.getKey();
      count[idx] = ((Integer)(me.getValue())).intValue();
      idx++;
  }
  sortWords();
  String[] sorted = new String[words.length];
  for (int i = 0; i < words.length; i++) {
    sorted[i] = count[i]+" "+words[i];
  }
  most = count[0];
  least = count[count.length-1];
  //saveStrings("totals.txt", sorted);
 
}
 
String clean(String word) {
  word = word.trim();
  if (word.endsWith(".") || word.endsWith(",") || word.endsWith(";"))
    word = word.substring(0, word.length() - 1);
  return word.trim();   
}
 
 
void sortWords() {
  boolean changed = true;
  while (changed) {
    boolean madeChange = false;
    for (int i = 0; i < count.length-1; i++) {
      if (count[i] < count[i+1]) {
        int temp = count[i];
        String tempW = words[i];
        count[i] = count[i+1];
        words[i] = words[i+1];
        count[i+1] = temp;
        words[i+1] = tempW;
        madeChange = true;
      }
    }
    changed = madeChange;
  }
}

