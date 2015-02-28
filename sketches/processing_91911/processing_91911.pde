
PImage bg;
PlayerNinja p;
BufferedReader reader;
ArrayList words = new ArrayList();
boolean l = false;
boolean r = false;
void setup() {
  size(800, 800);
  background(0, 0, 0);
  PFont courier;
  courier = loadFont("CourierNewPSMT-24.vlw");
  stroke(255);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(courier);
  bg = loadImage("BackgroundSquare.jpg");
  p = new PlayerNinja();
  reader = createReader("words.txt");
  for (int i = 0; i < 500; i++) {
    try {
      words.add(reader.readLine());
    }
    catch(IOException ex) {
      System.out.println(ex.toString());
    }
  }
}

ArrayList current = new ArrayList();
int i;
Word word;
Word temp;
int delay = 0;
float generate;
String typed = "";
int score = 0;
boolean clear = false;
int lives = 10;
boolean shootMode = false;
int modeSwitch = floor(random(8, 16));
boolean blindMode = false;
int blindCounter = 50;
boolean freezeMode = false;
int freezeCounter = 150;
boolean screenShake = false;
int shakeCounter = 50;

void draw() {
  pushMatrix();
  if (screenShake == true) {
    translate(random(10), random(10));
    shakeCounter--;
  }
  image(bg, 0, 0, 800, 800);
  p.display();
  generate = random(0, 10);
  if (generate > 9.91) {
    i = floor(random(500));
    word = new Word(words.get(i-1).toString().toUpperCase(), floor(random(100, width-100)), 30);
    current.add(word);
  }
  for (int j = 0; j <= current.size()-1 ; j++) { 
    temp = (Word) current.get(j);
    if (freezeMode == false) {
      temp.changePos();
    }
    else {
      freezeCounter--;
    }
    if (freezeCounter == 0) {
      freezeCounter = 150;
      freezeMode = false;
    }
    temp.display();
    temp.checkLoss();
  }
  if (score > modeSwitch) {
    shootMode = !shootMode;
    screenShake = true;
    modeSwitch = modeSwitch + floor(random(8, 20));
    System.out.println(modeSwitch);
  }
  stroke(0, 0);
  fill(0, 0);
  textAlign(LEFT, CENTER);
  text(score, 700, 700);
  stroke(255);
  fill(255);
  text("SCORE: " + score, 600, 750);
  text("LIVES: " + lives, 400, 750);
  text("TYPED: " + typed, 000, 750);
  textAlign(CENTER, CENTER);
  if (shootMode == false) {
    p.setSpeed(0);
    l = false;
    r = false;
    line(0, 670, 800, 670);
    text("MODE: Type - Type the words above the ninjas to kill.", 400, 700);
  }
  if (shootMode == true) {
    line(0, 670, 800, 670);
    text("MODE: Shoot - Move with Left/Right. Shoot with Up.", 400, 700);
    p.movePos();
  }

  if (blindMode == true) {
    background(255, 255, 255);
    fill(0);
    text("BLINDED", 400, 400);
    fill(255);
    blindCounter--;
  }
  if (blindCounter == 0) {
    blindCounter = 50;
    blindMode = false;
  }
  if (lives < 1) {
    background(0, 0, 0);
    text("GAME OVER", 400, 400);
    text("SCORE: " + score, 400, 500);
    noLoop();
  }
  if (shakeCounter==0) {
    screenShake = false;
    shakeCounter = 50;
  }
  popMatrix();
}

void keyPressed() {
  if (keyCode==' ') {
    typed = "";
  }
  if (keyCode==BACKSPACE) {
    if (!typed.equals("")) {
      typed = typed.substring(0, typed.length()-1);
    }
  }
  if (Character.isLetter(key)&&shootMode==false) {
    typed += Character.toString(key).toUpperCase();
    for (int j = 0; j <= current.size()-1 ; j++) { 
      temp = (Word) current.get(j);
      if (typed.equals(temp.getString())) {
        temp.remove();
        current.remove(temp);
        score = score + 1;
        clear = true;
        if (random(0, 10)>9) {
          freezeMode = true;
        }
      }
    }
    if (clear == true) {
      clear = false;
      typed = "";
    }
  }

  if (shootMode == true) {
    if (keyCode==LEFT) {
      l = true;
      p.setSpeed(-5);
    }
    if (keyCode==RIGHT) {
      r = true;
      p.setSpeed(5);
    }
    if (keyCode==UP) {
      p.shoot();
      for (int j = 0; j <= current.size()-1 ; j++) { 
        temp = (Word) current.get(j);
        temp.checkHit(p.getX());
      }
    }
  }
}
void keyReleased() {
  if (shootMode == true) {
    if (keyCode==LEFT) {
      if (r) {
        p.setSpeed(5);
      }
      else {
        p.setSpeed(0);
      }
      l = false;
    }
    if (keyCode==RIGHT) {
      if (l) {
        p.setSpeed(-5);
      }
      else {
        p.setSpeed(0);
      }
      r = false;
    }
  }
}



class Word {
  String word;
  int xPos;
  int yPos;
  boolean show = true;
  int randPosChange;
  PImage ninja = loadImage("Ninja.png");

  Word(String str, int x, int y) {
    word = str;
    xPos = x;
    yPos = y;
    randPosChange = floor(random(1, 3));
  }

  String getString() {
    return word;
  }

  void remove() {
    show = false;
    fill(0, 0);
    stroke(0, 0);
    text(word, xPos, yPos);
    stroke(255);
    fill(255);
  }

  void changePos() {
    yPos = yPos + randPosChange;
  }

  void display() {
    if (show == true) {
      fill(0, 0);
      stroke(0, 0);
      text(word, xPos, yPos-randPosChange);
      fill(255);
      stroke(255);
      text(word, xPos, yPos);
      image(ninja, xPos - 30, yPos - randPosChange + 24, 70, 90);
    }
  }

  void checkLoss() {
    if (yPos > 700) {
      remove();
      lives = lives - 1;
      current.remove(this);
      if (random(0, 10) > 7) {
        blindMode = true;
      }
    }
  }

  void checkHit(int x) {
    if (x > xPos - 35 && x < xPos + 35) {
      remove();
      score = score + 1;
      current.remove(this);
      if (random(0, 10)>9) {
        freezeMode = true;
      }
    }
  }
}


class PlayerNinja {
  int xPos;
  int yPos;
  PImage ninja = loadImage("PlayerNinja.png");
  int speed;

  PlayerNinja() {
    xPos = 360;
    yPos = 550;
    speed = 0;
  }

  int getSpeed() {
    return speed;
  }
  void setSpeed(int s) {
    speed = s;
  }
  void movePos() {
    xPos = xPos + speed;
  }

  void display() {
    image(ninja, xPos, yPos, 80, 100);
  }

  void shoot() {
    Bullet b = new Bullet(xPos, yPos);
    for (int i = 0; i < 100; i++) {
      b.display();
    }
  }

  int getX() {
    return xPos;
  }
}

class Bullet {
  int xPos;
  int yPos;
  PImage s = loadImage("Shuriken.png");

  Bullet(int x, int y) {
    xPos = x;
    yPos = y;
  }

  void display() {
    yPos = yPos - 10;
    image(s, xPos, yPos, 20, 20);
  }
}


