
import java.util.Iterator;

boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
boolean spacePressed;
int screenNum;
int x, y;
int u, v;
int speed;
int pointsA, pointsB;
int roundNum;
int playerAScore, playerBScore;
ArrayList<Square> allSquares;
ArrayList<Square> allBadSquares;
PFont tFont, font;
int specialTime;
boolean isTimeSet;
Square currentSpecial;
boolean finalScoreCalculated;

void setup() {
  size(600, 600);
  smooth();
  screenNum = 0;
  x = 25;
  u = width - 40;
  y = v = height / 2;
  speed = 4;
  pointsA = pointsB = 0;
  roundNum = 1;
  playerAScore = playerBScore = 0;
  allSquares = new ArrayList<Square>();
  allBadSquares = new ArrayList<Square>();
  tFont = loadFont("KristenITC-Regular-50.vlw");
  font = loadFont("TimesNewRomanPS-BoldMT-25.vlw");
  textAlign(CENTER);
  finalScoreCalculated = false;
}

void draw() {
  background(0);
  if (screenNum == 0) {
    displayMenu();
    if (keyCode == KeyEvent.VK_SPACE && !spacePressed) {
      screenNum = 1;
      setUpObjects(40, 0);
    }
  } else if (screenNum == 1) {
    startAndCheckSchedule();
    Iterator iterator = allSquares.iterator();
    while (iterator.hasNext()) {
      Square s = (Square) iterator.next();
      if (s.show(x, y, u, v)) {
        iterator.remove();
      }
    }
    iterator = allBadSquares.iterator();
    while (iterator.hasNext()) {
      Square s = (Square) iterator.next();
      if (s.show(x, y, u, v)) {
        iterator.remove();
      }
    }
    if (allSquares.isEmpty()) {
      screenNum = 2;
    }
    fill(230, 0, 0);
    rect(x, y, 20, 20);
    fill(0, 0, 230);
    rect(u, v, 20, 20);
    displayScore();
    if (wPressed) y -= speed;
    if (aPressed) x -= speed;
    if (sPressed) y += speed;
    if (dPressed) x += speed;
    if (rightPressed) u += speed;
    if (leftPressed)  u -= speed;
    if (upPressed)    v -= speed;
    if (downPressed)  v += speed;
  } else if (screenNum == 2) {
    fill(255);
    textAlign(CENTER);
    textFont(tFont, 45);
    if (roundNum == 5) {
      if (!finalScoreCalculated) {
        if (pointsA > pointsB) {
            playerAScore++;
          } else if (pointsB > pointsA) {
            playerBScore++;
          } else {
            playerAScore++;
            playerBScore++;
        }
        finalScoreCalculated = true;
      }
      if (playerAScore > playerBScore) {
        text("Player 1 has won the game!", width / 2, height / 4 - 50);
      } else if (playerBScore > playerAScore) {
        text("Player 2 has won the game!", width / 2, height / 4 - 50);
      }
      text("Congratulations!", width / 2, height / 4);
      text("Final Score: " + playerAScore + " : " + playerBScore, width / 2, height / 4 + 60);
      textFont(font);
      text("Press space bar to return to the main menu.", width / 2, height / 2);
      if (keyCode == KeyEvent.VK_SPACE) {
        spacePressed = true;
        setup();
      }
    } else {
      if (pointsA > pointsB) {
        text("Player 1 Won!", width / 2, height / 4);
      } else if (pointsB > pointsA) {
        text("Player 2 Won!", width / 2, height / 4);
      } else {
        text("Scores are tied!", width / 2, height / 4);
      }
      textFont(font);
      text("Press space bar to continue to the next round.", width / 2, height / 2);
      if (keyCode == KeyEvent.VK_SPACE) {
        allBadSquares.clear();
        roundNum++;
        setUpObjects(41 - roundNum * 4, roundNum + 4);
        if (pointsA > pointsB) {
          playerAScore++;
        } else if (pointsB > pointsA) {
          playerBScore++;
        } else {
          playerAScore++;
          playerBScore++;
        }
        pointsA = pointsB = 0;
        x = 25;
        u = width - 25;
        y = v = height / 2;
        screenNum = 1;
      }
    }
  }
}

void displayMenu() {
  fill(255);
  textFont(tFont);
  text("Collect It!", width / 2, height / 4);
  textFont(font);
  text("Press space bar to play the game.", width / 2, height / 2);
  text("Player 1 Keys: WASD", width / 2, height / 2 + 100);
  text("Player 2 Keys: Up, Down, Left Right", width / 2, height / 2 + 140);
  fill(255, 102, 0);
  rect(width / 4, height - 100, 10, 10);
  textFont(font, 15);
  text("= 1 point", width / 4 + 45, height - 90);
  fill(255, 255, 0);
  rect(width / 4, height - 80, 10, 10);
  text("= 100 points", width / 4 + 56, height - 70);
  fill(255, 0, 255);
  rect(width / 4, height - 60, 10, 10);
  text("= -50 points", width / 4 + 54, height - 50);
}

void displayScore() {
  fill(255);
  textFont(font, 16);
  textAlign(LEFT);
  text("Player 1: " + pointsA, 100, 40);
  textAlign(RIGHT);
  text("Player 2: " + pointsB, width - 100, 40);
  text("Round " + roundNum, width - 10, 20);
  textAlign(CENTER);
  text("Round Score", width / 2, 20);
  text(playerAScore + " : " + playerBScore, width / 2, 40);
}

void setUpObjects(int chance, int chance2) {
  for (int y = 50; y < height - 50; y += 15) {
    for (int x = 50; x < width - 50; x += 15) {
      if (chance > random(0, 200)) {
        allSquares.add(new Square(x, y));
      } else if (chance2 > random(0, 400)) {
        Square nSquare = new Square(x, y);
        nSquare.special2 = true;
        allBadSquares.add(nSquare);
      }
    }
  }
}

void startAndCheckSchedule() {
  if (!isTimeSet) {
    specialTime = millis();
    isTimeSet = true;
  }
  if (specialTime + 5000 <= millis()) {
    if (currentSpecial != null)
      currentSpecial.special = false;
    if (allSquares.size() > 2) {
        currentSpecial = allSquares.get((int) random(0, allSquares.size()));
        currentSpecial.special = true;
    }
    isTimeSet = false;
  }
}

void keyPressed() {
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
}

void keyReleased() {
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
  if (keyCode == KeyEvent.VK_SPACE) spacePressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
}

private class Square {
  int x, y;
  boolean special, special2;

  Square(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  Square(int x, int y, boolean special2) {
    this.x = x;
    this.y = y;
    this.special2 = special2;
  }
  
  boolean show(int objX, int objY, int objX2, int objY2) {
    if (rectRectIntersect(x, y, x + 10, y + 10, objX, objY, objX + 20, objY + 20)) {
      if (special)
        pointsA += 100;
      else if (special2)
        pointsA -= 50;
      else
        pointsA++;
      return true;
    }
    if (rectRectIntersect(x, y, x + 10, y + 10, objX2, objY2, objX2 + 20, objY2 + 20)) {
      if (special)
        pointsB += 100;
      else if (special2)
        pointsB -= 50;
      else
        pointsB++;
      return true;
    }
    fill(255, special ? 255 : (special2 ? 0 : 102), (special2 ? 255 : 0));
    rect(x, y, 10, 10);
    return false;
  }
}

boolean rectRectIntersect(float left, float top, float right, float bottom, float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

