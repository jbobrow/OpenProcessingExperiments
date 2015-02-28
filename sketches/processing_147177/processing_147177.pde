
int counter;
int pipevelocity;
int velocity;
int flappyY;
int nextpipe;
int highscore;
int score;
int oldMilli;
int fpsCount;
int fps;
boolean pause;
boolean dead;
boolean sound = true;
ArrayList pipes;

void setup() {
  // Project
  size(288, 512);
  background(255);
  colorMode(RGB);
  counter = 0;
  // Images
  bg = loadImage("http://imghost.comuf.com/bg.png");
  flappy = loadImage("http://imghost.comuf.com/flappy.png");
  favorites = loadImage("http://imghost.comuf.com/favorites.png");
  // Variables
  pipevelocity = -1.9;
  score = 0;
  velocity = -5;
  flappyY = 232;
  dead = false;
  highscore = 0;
  oldMilli = millis();
  // Objects
  pipes = new ArrayList();
}

void draw() {
  if (pause == false) {
    counter++;
    fpsCount += 1;
    if (dead == false) {
      pipevelocity = pipevelocity + ((-3 - pipevelocity) / 10000);
      nextpipe = nextpipe + 0.9 - (pipevelocity / 15);
      velocity = velocity + 0.3;
      image(bg, 0, 0);
      flappyY += velocity;
      if (nextpipe > 100) {
        pipes.add(new Pipe(random(-330, -20)));
        nextpipe = 0;
      }
      for (int i = pipes.size() - 1; i >= 0; i--) { 
        Pipe p1 = (Pipe) pipes.get(i);
        p1.update();
          
        if (p1.finished()) {
          pipes.remove(i);
        }
      }
      PFont font;
      font = loadFont("Tahoma", 20); 
      textFont(font); 
      text(score, 20, 30, 50, 50);
      stroke(0);
      fill(255);
      rect(278, 502, 9, 9);
      if (!sound) {
        fill(0);
        PFont font;
        font = loadFont("Tahoma", 13); 
        textFont(font); 
        text("x", 280, 510, 20, 20);
        fill(255);
      }
      translate(80 + 17, flappyY + 12);
      rotate(velocity / 10);
      image(flappy, -17, -12);
    } else {
      background(0);
      PFont font;
      font = loadFont("Tahoma", 20); 
      textFont(font); 
      text("You lose!\nScore: " + score + " Highscore: " + highscore + "\nPress 'r' to restart\n\nDon't kill flappy that\nquickly next time ;D", 20, 30);
      stroke(0);
      fill(255);
      rect(278, 502, 9, 9);
      if (!sound) {
        fill(0);
        PFont font;
        font = loadFont("Tahoma", 13); 
        textFont(font); 
        text("x", 280, 510, 20, 20);
        fill(255);
      }
    }
  }
  resetMatrix();
  PFont font;
  font = loadFont("Courier New", 15); 
  textFont(font); 
  text("fps: " + fps, 210, 20, 80, 50);
  if (millis() - oldMilli > 1000) {
    oldMilli = millis();
    fps = fpsCount;
    fpsCount = 0;
  }
  image(favorites, 0, 462);
}

void keyPressed() {
  if (key == 'r') {
    velocity = -5;
    flappyY = 232;
    pipes.clear();
    score = 0;
    dead = false;
    pipevelocity = -1.9;
  } 
  if (key == 'p') {
    if (pause == false) {
      pause = true;
    } else {
      pause = false;
    }
  }
  if (key == ' ') {
    if (pause == false && dead == false) {
      flap();
    }
  }
}

void mouseClicked() {
  if (dead == false && pause == false) {
    flap();
  }
  if (mouseX > 278 && mouseY > 502) {
    if (sound == false) {
      sound = true;
    } else {
      sound = false;
    }
  } 
  if (mouseX < 50 && mouseY > 462) {
    parent.setFavorite();
  } 
}

void flap() {
  if (velocity < 0) {
    velocity -= 4;
    if (velocity < -10) {
      velocity = -10;
    }
  } else {
    velocity = -5.2;
  }
  playSound("http://imghost.comuf.com/flap.mp3"); 
}

void playSound(String url) {
  if (sound == true) {
    var MyAudio = new Audio(url);
    MyAudio.play();
  }
}

class Pipe {
  int pipeleft;
  int offset;
  boolean passed;
  boolean collided;
  PImage pipetop = loadImage("http://imghost.comuf.com/pipe_top.png");
  PImage pipebottom = loadImage("http://imghost.comuf.com/pipe_bottom.png");
  
  Pipe (int o) {
    offset = o;
    pipeleft = 400;
    passed = false;
  }
  
  void update() {
    pipeleft += pipevelocity;
    image(pipetop, pipeleft, offset);
    image(pipebottom, pipeleft, offset + 484);
    if (pipeleft < 90 && passed == false) {
      passed = true;
      score++;
      playSound("http://imghost.comuf.com/point.mp3");
    }
    if ( (pipeleft < 114 && pipeleft > 52) && 
     (flappyY < (384 + offset) || (flappyY + 24) > (484 + offset)) ) {
      collided = true;
    }
  }
  
  boolean finished() {
    if (pipeleft < -100) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean colliding() {
    return collided;
  }
}
