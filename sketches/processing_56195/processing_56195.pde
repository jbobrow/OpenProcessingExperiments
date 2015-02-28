
class Eraser {
  public PVector origin;
  public float w, h;
  public PVector speed;
  PImage eraser;
  boolean endGame;
  boolean toRight;
  boolean toLeft;
  float leftEdge;
  PVector eraseStart;
  float eraseW, eraseH;
  boolean setErase;

  Eraser(PVector origin, float w, float h) {
    this.origin = origin;
    this.w = w;
    this.h = h;
    speed = new PVector(0.5, 3.0);
    eraser = loadImage("eraser.png");
    endGame = false;
    toRight = false;
    toLeft = false;
    leftEdge = origin.x - w/2;
    eraseStart = new PVector(origin.x, origin.y);
    eraseW = 0;
    eraseH = 0;
    setErase = false;
  }

  boolean collision() {
    if (origin.y+h/2 > figure.origin.y-figure.mainSpr.height) {
      if ((figure.origin.x-figure.mainSpr.width/2 < origin.x+w/2 
        && origin.x-w/2 < figure.origin.x+figure.mainSpr.width/2)
        || (origin.x-w/2 < figure.origin.x+figure.mainSpr.width/2
        && figure.origin.x-figure.mainSpr.width/2 < origin.x+w/2)) 
      {
        return true;
      }
    }
    return false;
  }

  void update() {
    if (playGame && !gamePaused) {
      checkCollisions();
      leftEdge = origin.x - w/2;
      if (leftEdge >= figure.origin.x-figure.mainSpr.width/2) 
      {
        toRight = true;
        toLeft = false;
      }
      else {
        toRight = false;
        toLeft = true;
      }
    }
    if (origin.x < 16+w/2 || 16+width-32-w/2 < origin.x) {
      speed.x = -speed.x;
    }
    if (origin.y < 15+h/2 || 15+height-170-h/2 < origin.y) {
      speed.y = -speed.y;
    }
    if (beginGameOver) {
      if (origin.y + h/2 >= 15+height-170) {
        finalErase();
        if (!endGame) {
          if (origin.x >= 16+width-32-w/2) {
            origin.x = 16+width-32-w/2;
            endGame = true;
          }
        }
      }
    }
    if (gameOver) {
      speed.x = 0;
      speed.y = 0;
    }
    float factor = map(level, 1, 10, 1, 3); 
    PVector modifiedSpeed = new PVector(factor*speed.x, 
    factor*speed.y);
    origin.add(modifiedSpeed);
    if (playGame && !gamePaused) {
      if (collision()) {
        figure.beingErased = true;
        beginGameOver = true;
        playGame = false;
        if (soundOn) eraseFigure.trigger();
      }
    }
  }

  void finalErase() {
    checkCollisions();
    for (int i=0; i < marker.swiggles.size(); i++) {
      Swiggle s = marker.swiggles.get(i);
      if (s.beingErased) {
        marker.swiggles.remove(i);
      }
    }
    noStroke();
    fill(#000000);
    speed.y = 0;
    if (!endGame) {
      speed.x = 5;
      if (toLeft) {
      }
      else if (toRight) {
        eraseStart.y = origin.y-h/2;
        eraseH = h;
         if (!setErase) {
          eraseStart.x = origin.x-w/2;
          eraseW = (figure.origin.x+figure.mainSpr.width/2) - eraseStart.x;
          setErase = true;
        }
      }
    }
    else {
      speed.x = -5;
    } 
  }

  void render() {
    if (beginGameOver && !gameOver) {
      noStroke();
      fill(#ffffff);
      rect(eraseStart.x, eraseStart.y, eraseW, eraseH);
    }
    if (beginGameOver) {
      if (origin.x-w/2 <= figure.origin.x-figure.mainSpr.width/2 && 
      origin.x+w/2 >= figure.origin.x+figure.mainSpr.width/2 &&
      origin.y + h/2 >= 15+height-170) {
        figure.hideFigure();
      }
    }
    imageMode(CENTER);
    image(eraser, origin.x, origin.y, w, h);
    imageMode(CORNER);
  }

  void checkCollisions() {
    for (int i=0; i < marker.swiggles.size(); i++) {
      Swiggle s = marker.swiggles.get(i);
      if (((origin.x + w/2 > s.origin.x) && 
        (origin.x - w/2 <= s.origin.x)) || 
        ((origin.x - w/2 < s.origin.x + s.w) &&
        (origin.x + w/2 >= s.origin.x + s.w))) {
        if (origin.y + h/2 > s.origin.y) {
          if (!s.falling) {
            s.beingErased = true;
            if (soundOn) eraseSwiggle.trigger();
          }
        }
      }
    }
  }
}


