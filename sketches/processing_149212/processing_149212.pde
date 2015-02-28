
String[] words = new String[] { 
  "Music", "is", "an", "art", "form", "that", "involves", "organized", "and", "audible", "sounds", "and", "silence.", "It", "is", "usually", "expressed", "in", "terms", "of", "pitch", "(which", "includes", "melody", "and", "harmony),", "rhythm", "(which", "includes", "tempo", "and", "meter),", "and", "the", "quality", "of", "sound", "(which", "includes", "timbre,", "articulation,", "dynamics,", "and", "texture).", "Music", "may", "also", "involve", "generative", "forms", "in", "time", "through", "the", "construction", "of", "patterns", "and", "combinations", "of", "natural", "stimuli,", "principally", "sound.", "Music", "may", "be", "used", "for", "artistic", "or", "aesthetic,", "communicative,", "entertainment,", "or", "ceremonial", "purposes.", "The", "definition", "of", "what", "constitutes", "music", "varies", "according", "to", "culture", "and", "social", "context." 
};

int[][] squares = new int[][] {
  new int[] { 0, 0 },
  new int[] { 1, 0 },
  new int[] { 1, 1 },
  new int[] { 0, 1 }
};

class Cycle<T> {
  int i = -1;
  T[] items;
  Cycle(T[] items) {
    this.items = items;
  }
  T next() {
    i = (i + 1) % items.length;
    return items[i];
  }
}

class Countdown {
  int msPerTick = 100;
  long lastUpdate;
  long msTillDone = 0;
  
  Countdown(int msPerTick) {
    this.msPerTick = msPerTick;
    markTime();
  }
  
  void update() {
    long oldLastUpdate = lastUpdate;
    markTime();
    
    long msPassed = lastUpdate - oldLastUpdate;
    msTillDone -= msPassed;
  }
  
  boolean timeIsUp() {
    return msTillDone <= 0;
  }
  
  void addTicks(int numTicks) {
    msTillDone += numTicks * msPerTick;
  }
  
  private void markTime() {
    this.lastUpdate = System.currentTimeMillis();
  }
}

Cycle<int[]> squaresCycle;
Cycle<String> wordsCycle;
Countdown nextWordCountdown;

void setup() {
  size(400, 400);
  background(233, 233, 240);
  textFont(createFont("serif", 35));
  
  squaresCycle = new Cycle(squares);
  wordsCycle = new Cycle(words);
  nextWordCountdown = new Countdown(100);  // 100ms per letter
  
  textAlign(CENTER, CENTER);
}

void fadeOut() {
  pushStyle();
  noStroke();
  fill(233, 233, 240, 5);
  rect(0, 0, width, height);
  popStyle();
}

void draw() {
  fadeOut();
  nextWordCountdown.update();
  if (nextWordCountdown.timeIsUp()) {
    int[] square = squaresCycle.next();
    PVector spot = squareCoords(square);
    noStroke();
    
    fill(10, 30, 30);
    String word = wordsCycle.next();
    text(word, spot.x, spot.y);
    nextWordCountdown.addTicks(word.length());
    
    char lastChar = word.charAt(word.length() - 1);
    if (lastChar == '.') {
      nextWordCountdown.addTicks(10);
    }
    else if (lastChar == ',') {
      nextWordCountdown.addTicks(5);
    }
  }
}

PVector squareCoords(int[] square) {
  int squaresWide = 2;
  int squaresHigh = 2;
  float squareWidth = (float)width / squaresWide;
  float squareHeight = (float)height / squaresHigh;
  
  float x = (square[0] + 0.5) * squareWidth;
  float y = (square[1] + 0.5) * squareHeight;
  return new PVector(x, y);
}
