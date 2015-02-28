
boolean snapping;
int startTime;
final int totalTime = 200;

PFont f;
String message = "snapped";
// An array of Letter objects
Letter[] letters;

void setup() {
  size(260, 200);
  f = createFont("Arial", 20, true);
  textFont(f);
  frameRate(50);

  // Create the array the same size as the String
  letters = new Letter[message.length()];
  // Initialize Letters at the correct x location
  int x = 16;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x, 100, message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}

void draw() { 
  background(100, 100, 240);

  float cpx1 = 90;
  float cpy1 = 95;
  float cpx2 = 90;
  float cpy2 = 95;
  float y2 = 95;
  float a1 = 260;
  int x1 = 260;
  int x2 = 95;
  for (int i = 0; i < letters.length; i++) {
    letters[i].display();
  }
  if (snapping) {
    line(90, 95, 90, 95);
    cutString(90, 95, 90, 95, 95);
    if (millis() - startTime > totalTime) {
      snapping = false;
      for (int i = 0; i < letters.length; i++) {
        letters[i].home();
      }
      //background(100, 100, 240);
      Pause();
    }
  }
  else {
    line(90, 95, 260, 95);
    for (int i = 0; i < letters.length; i++) {
      letters[i].display();
    }
  }
}

void mouseClicked() {
  //background(255); 
  loop();  
  snapping = true;
  startTime = millis();
  for (int i = 0; i < letters.length; i++) {
    letters[i].snap();
  }
}

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex, homey;
  // As well as its current location
  float x, y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }

  // Display the letter
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter, x, y);
  }
  void snap() {
    line(90, 95, 260, 95);

    for (int i=260; i>10; i -=5) {
      x = i;
    }
  }
  void home() {
    x = homex;
    y = homey;
  }
}

void cutString(float cpx1, float cpy1, float cpx2, float cpy2, float y2) {
  //stroke(10);
  float a1 = 150;
  float b1 = 150;
  int x1 = 150;
  int x2 = 95;
  float lineLength1 = 90;
  float lineLength2 = 110;
  float framesToAnimate = 20;
  cpx2 = random(90, 260);
  cpy2 = random(50, 200);
  y2 = random(60, 150);
  noFill();
  curve(cpx1, cpx1, 90, 95, a1 - (frameCount % framesToAnimate)/framesToAnimate*lineLength1, y2, cpx2, cpy2);
  curve(cpx1, cpx1, b1+ (frameCount % framesToAnimate)/framesToAnimate*lineLength2, y2, 260, 95, cpx2, cpy2);
  cpx1 = cpx2;
  cpy1 = cpy2;
}

void Pause() {
  //if (millis() - startTime > totalTime) {
    noLoop();
  //}
}



