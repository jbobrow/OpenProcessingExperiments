
WordSet ws;

void setup() {
  size(600, 600);
  ws = new WordSet(loadStrings("words.txt"), 0, 0, width / 2);
}

void draw() {
  background(0);
  ws.draw();
}

void mousePressed() {
  ws.mousePressed();
}

void mouseReleased() {
  ws.mouseReleased();
}

class Word {
  
  String t;
  
  int x, y;
  int w, h;

  int grabX, grabY;
  boolean isDragging;
  
  Word(String t, int x, int y) {
    this.t = t;
    this.x = x;
    this.y = y;
    w = int(textWidth(t)) + 8;
    h = 20;
  }
  
  boolean update() {
    if(isDragging) {
      x = constrain(x + mouseX - grabX, 0, width - w);
      grabX = mouseX;
      y = constrain(y + mouseY - grabY, 0, height - h);
      grabY = mouseY;
      return true;
    }
    return false;
  }

  void display() {
    rectMode(CORNER);
    fill(mouseOver() ? (mousePressed ? 215 : 230) : 255);
    rect(x, y, w, h);
    strokeWeight(1);
    fill(0);
    text(t, x + 4, y + 14);
  }
  
  boolean mouseOver() {
    return mouseX > x && mouseX < x + w
        && mouseY > y && mouseY < y + h;
  }
  
  void mousePressed() {
    if(mouseOver()) {
      grabX = mouseX;
      grabY = mouseY;
      isDragging = true;
    }
  }
  
  void mouseReleased() {
    if(isDragging) {
      isDragging = false;
    }
  }
}

class WordSet {

  Word words[];

  WordSet(String[] wordList, int x, int y, int w) {
    words = new Word[wordList.length];
    placeWords(wordList, x, y, w);
  }

  WordSet(String[] wordList) {
    words = new Word[wordList.length];
    placeWords(wordList, 0, 0, width);
  }
  
  void placeWords(String[] wordList, int startX, int startY, int w) {
    int x = startX + 1;
    int y = startY + 1;
    for(int i = 0; i < wordList.length; i++) {
      int nextWidth = int(textWidth(wordList[i])) + 9;
      if(x + nextWidth > startX + w - 1) {
        y += 21;
        x = startX + 1;
      }
      words[i] = new Word(wordList[i], x, y);
      x += nextWidth;
    }
  }
  
  void draw() {
    for(int i = 0; i < words.length; i++) {
      if(words[i].update()) {
        moveToFront(i);
        break;
      }
    }
    for(int i = words.length - 1; i >= 0; i--) {
      words[i].display();
    }
  }
  
  void moveToFront(int moveIndex) {
    Word wordToMove = words[moveIndex];
    for(int i = moveIndex; i > 0; i--) {
      words[i] = words[i - 1];
    }
    words[0] = wordToMove;
  }
  
  void mousePressed() {
    for(Word w: words) {
      w.mousePressed();
    }
  }
  
  void mouseReleased() {
    for(Word w: words) {
      w.mouseReleased();
    }
  }
}


