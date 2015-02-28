
final int WIDTH = 30;
final int HEIGHT = 49;
color FORE = color(227, 57, 57), BACK = color(203, 197, 227);

boolean startT;
boolean case1 = true;
boolean case2 = false;

int timeS = 0;
int searchNum;
int currIndex = 0;
Card[] cards = new Card[12];

void setup() {
  size(540, 300);

  int startX = 40;
  int startY = height/2;

  for (int i = 0; i < cards.length; i++) {
    cards[i] = new Card(startX, startY, int(random(1) * 40  + random(1, 8)));
    startX += 12 + WIDTH;
  }

  searchNum = cards[int(random(0, cards.length))].getID();
  textAlign(CENTER);
}

void draw() {
  background(255);
  startTimer();

  if (!case2) {
    fill(0);
    textSize(16);
    text("Sequential Search", width/2, height/3);
  }
  else {
    fill(0);
    textSize(16);
    text("Searching for: **" + searchNum + "**", width/2, height/3);
  }

  if (case1 && getTimePassed() > 2400) {
    for (int i = 0; i < cards.length; i++) {
      cards[i].flip();
    }

    stopTimer();
    case1 = false;
    case2 = true;
    currIndex = 0;
  } else if (getTimePassed() > 900 && case2) {
    stopTimer();
    cards[currIndex].flip();
    
    if (searchNum == cards[currIndex].getID()){
      terminate();
    }
    currIndex++;
  }

  for (int i = 0; i < cards.length; i++) {
    cards[i].display();
  }
}

void terminate() {
  noLoop();
  textSize(24);
  fill(0);
  text("Found " + searchNum + "!", width/2, 2 * height / 3);
  textSize(16);
  text("Search took " + currIndex + " flips.", width/2, 5 * height / 6);
}

void seqFlip(int i) {
  cards[i].flip();
}

class Card {
  boolean isFlipped;
  int x, y;
  int id;

  Card(int x1, int y1, int id) {
    x = x1;
    y = y1;
    this.id = id;
  }

  void display() {
    rectMode(CENTER);
    if (isFlipped) {
      fill(FORE);
    } else {
      fill(BACK);
    }

    stroke(0);
    strokeWeight(2);
    rect(x, y-3, WIDTH, HEIGHT);
    if (!isFlipped) {
      fill(0);
      textSize(12);
      textAlign(CENTER);
      text(id + "", x, y);
    }
  }

  void flip() {
    isFlipped = !isFlipped;
  }

  int getID() {
    return id;
  }

  //  boolean checkBounds(int x1, int y1) {
  //    boolean checkX = x1 >= (x - WIDTH/2) && x1 <= (x + WIDTH/2);
  //    boolean checkY = y1 >= (y - HEIGHT/2) && y1 >= (y + HEIGHT/2);
  //    return  checkX && checkY;
  //  }
}

void startTimer() {
  if (startT)
    return;
  startT = true;
  timeS = millis();
}

int getTimePassed() {
  return millis() - timeS;
}

void stopTimer() {
  startT = false;
}

void restartTimer() {
  stopTimer();
  startTimer();
}


