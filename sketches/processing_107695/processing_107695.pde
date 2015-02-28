
// Initialize XML 
XML xmlPrefixes;
XML xmlRoots;
XML xmlSuffixes;

String preNames;
String rootNames;
String sufNames;
String newWord;
String newDefinition;

String message = "Type Text Here: ";
ArrayList <Letter> letters = new ArrayList <Letter> ();
int shakeTime;

void setup() {
  size(300, 500);
  //frameRate(1);
  xmlPrefixes = loadXML("wordPartsPrefixes.xml");
  xmlRoots = loadXML("wordPartsRoots.xml"); 
  xmlSuffixes = loadXML("wordPartsSuffixes.xml");
}

void draw() {
  background(55);
  getNewWord();
  //typeText();
}

void getNewWord() {
  fill(255);
  stroke(122);
  strokeWeight(3);
  rectMode(CENTER);
  rect(width/2, height*0.15, width*0.9, height*0.10, 12);
  rect(width/2, height*0.55, width*0.9, height*0.5, 12);
  rect(width/2, height*0.9, width*0.9, height*0.08, 12);
  
  XML[] prefixes = xmlPrefixes.getChildren("prefix");
  int indexP = int(random(prefixes.length));
  String preDefinition = prefixes[indexP].getString("prevalue");
  String preName = prefixes[indexP].getContent();
  //preNames = indexP + ", " + preDefinition + ", " + preName;

  XML[] roots = xmlRoots.getChildren("root");
  int indexR = int(random(roots.length));
  String rootDefinition = roots[indexR].getString("rootvalue");
  String rootName = roots[indexR].getContent();
  //rootNames = indexR + ", " + rootDefinition + ", " + rootName;

  XML[] suffixes = xmlSuffixes.getChildren("suffix");
  int indexS = int(random(suffixes.length));
  String sufDefinition = suffixes[indexS].getString("sufvalue");
  String sufName = suffixes[indexS].getContent();
  //sufNames = indexS + ", " + sufDefinition + ", " + sufName;
  
  newWord = preName + rootName + sufName;
  newDefinition =  sufDefinition + preDefinition + rootDefinition;
  
  fill(0);
  textSize(16);
  text(newWord, width/8.5, height*0.15, width*0.8, height*0.33);
  text(newDefinition, width/8.5, height*0.37, width*0.8, height*0.33);
  fill(255,10,10);
  text("Click for New Word", width/4, height*0.89, width*0.8, height*0.1);
  fill(255);
  textSize(18);
  text("Random Word:", width/8, height*0.04, width*0.8, height*0.1);
  text("Definition:", width/8, height*0.24, width*0.8, height*0.1);
  noLoop();
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (message.length() > 0) {
      message = message.substring(0, message.length()-1);
    }
  } else if (keyCode == DELETE) {
    message = "";
  } else if (keyCode != SHIFT && keyCode != ENTER) {
      message = message + key;
  }
}

void makeLetters() {
  int x = 100;
  for (int i=0; i<message.length(); i++) {
    Letter let = new Letter(x,height/2,message.charAt(i));
    letters.add(let);
    x += textWidth(message.charAt(i));
  }
}

void typeText() {
  text(message,100,height/2);
  shakeTime++;
  makeLetters();
  message = "";
  if (shakeTime > 240) {
    makeLetters();
    message = "";
    shakeTime = 0;
  }

  for (Letter let : letters) {
    let.shake();
    let.display();
  }
}

void mouseReleased() {
  if (mouseX < width*0.95 && mouseY > height*0.87) {
    redraw();
  }
}
class Letter {
  char letter;
  float x,y;
  float xChange,yChange;

  Letter (float x_, float y_, char letter_) {
    x = x_;
    y = y_;
    letter = letter_;
    xChange = random(-1,1);
    yChange = random(-1,1);
  }
  
  void shake() {
    x += xChange;
    y += yChange;
  }

  void display() {
    text(letter,x,y);
  }
}


