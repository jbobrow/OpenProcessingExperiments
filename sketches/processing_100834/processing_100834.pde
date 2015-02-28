
/*

 -------------------------------------------------------
 -                                                     -
 -         -SSSSS  IIIII  M   M  OOOOO  N   N-         - 
 -        --S        I    MM MM  O   O  NN  N--        -
 -      ----SSSSS    I    M M M  O   O  N N N----      -
 -  --------    S    I    M   M  O   O  N  NN--------  -
 -      ----SSSSS  IIIII  M   M  OOOOO  N   N----      -
 -                                                     -
 -                --       BY:       --                -
 -                                                     -
 -         -----      -------------      -----         -
 -                                                     -
 -                                                     -
 -    Game :                                           -
 -        -remember the sequence                       -
 -        -click the according buttons in order        -
 -        -sound recommended, helps with repeating     -
 -                                                     -
 -------------------------------------------------------
 
 */



Button[] button = new Button[4];
int[] pathToTake = new int[1000];
int level = 3;
int highScore;
PrintWriter saveHighScore;
BufferedReader reader;
int lives = 3;
int buttonToPress;
int buttonPressed;
boolean currentRound, dead, pathShown, zeroLives;
int _i = 0;  //  What the for loop starts at, causes screen to update
int a;
int lsa;  //  lose screen animation

import ddf.minim.*;

Minim minim;
AudioPlayer[] b = new AudioPlayer[5];

void setup() { 
  size(400, 400);
  colorMode(HSB);
  noStroke();
  smooth();

  for (int i = 0; i < pathToTake.length; i++) {
    pathToTake[i] = (int)random(4);
  }

  for (int i = 0; i < button.length; i++) {
    if (i % 2 == 0) {
      button[i] = new Button(i*80+120, 120, i*50, i);
    } else {
      button[i] = new Button((i-1)*80+120, 280, i*50, i);
    }
  }
  
  minim = new Minim(this);
  for (int i = 0; i < 5; i++) {
    b[i] = minim.loadFile("tone"+(i+1)+".wav");
  }
  loadHighScore();
  getHighScore();
  pathShown = true;
  currentRound = true;

  buttonPressed = pathToTake[buttonToPress];
}

void draw() {
  if (currentRound) {
    drawBackground();
    showStats();
    for (int i = 0; i < button.length; i++) {
      button[i].make();
    }
    if (pathShown) {
      showPathToTake();
    } else {
      followingPath();
    }
  } else {
    if (dead) {
      deathScreen();
    }
  }
}

void drawBackground() {
  background(100);
  fill(255);
  ellipse(width/2, height/2, width-20, height-20);
  fill(100);
  triangle(width/2, height*7/8-25, width/2+100, height*7/8+75, width/2-100, height*7/8+75);
  triangle(width/2, height/8+25, width/2+100, height/8-75, width/2-100, height/8-75);
  triangle(width*7/8-25, height/2, width*7/8+75, height/2-100, width*7/8+75, height/2+100);
  triangle(width/8+25, height/2, width/8-75, height/2-100, width/8-75, height/2+100);
  quad(width/2-50, height/2, width/2, height/2-50, width/2+50, height/2, width/2, height/2+50);
}

void showStats() {
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("level", width/2, height/30);
  text("lives", width/2, height*29/30);
  text("best", width*14/15, height*9/20);
  textSize(35);
  text(level, width/2, height/10);
  text(lives, width/2, height*9/10);
  text(highScore, width*14/15, height*21/40);
}

void showPathToTake() {
  for (int i = _i; i < level; i++) {
    for (int j = 0; j < button.length; j++) {
      button[j].make();
    }

    textSize(20);
    textAlign(CENTER, CENTER);
    fill(100);
    quad(width/2-50, height/2, width/2, height/2-50, 
    width/2+50, height/2, width/2, height/2+50);
    fill(255);
    text("WATCH", width/2, height/2-2.5);

    button[pathToTake[i]].lightUp();
    button[pathToTake[i]].make();
    if (_i != pathToTake.length) {
      _i++;
    }
    break;
  }
}

void followingPath() {
  textSize(30);
  textAlign(CENTER, CENTER);
  fill(255);
  text("GO", width/2, height/2-5);
  if (mousePressed) {
    for (int i = 0; i < button.length; i++) {
      button[i].check();
      button[i].make();
    }
  }
  if (zeroLives) {
    currentRound = false;
    dead = true;
  }
}

void mouseReleased() {
  if (sqrt(sq(mouseX-button[0].xpos)+sq(mouseY-button[0].ypos))
    <= 62.5 ||
    sqrt(sq(mouseX-button[1].xpos)+sq(mouseY-button[1].ypos))
    <= 62.5 ||
    sqrt(sq(mouseX-button[2].xpos)+sq(mouseY-button[2].ypos))
    <= 62.5 ||
    sqrt(sq(mouseX-button[3].xpos)+sq(mouseY-button[3].ypos))
    <= 62.5) {
    if (pathShown == false) {
      if (buttonPressed == pathToTake[buttonToPress]) {
        buttonToPress++;
      } else {
        b[4].play(1);
        fill(100);
        quad(width/2-50, height/2, width/2, height/2-50, 
        width/2+50, height/2, width/2, height/2+50);
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(25);
        text("OOPS", width/2, height/2-2.5);

        lives--;
        if (lives == 0) {
          zeroLives = true;
        } else {
          zeroLives = false;
        }
        if (zeroLives == false) {
          pathShown = true;
          buttonToPress = 0;
          _i = 0;
          a = 0;
        }
      }
      if (buttonToPress == level) {
        for (int i = 0; i < button.length; i++) {
          button[i].make();
        }

        level++;
        getHighScore();
        buttonToPress = 0;
        _i = 0;
        a = 0;
        pathShown = true;
        showPathToTake();
      }
    }
  }
}

void deathScreen() {
  background(0);
  drawBackground();
  for (int i = 0; i < button.length; i++) {
    button[i].make();
  }
  fill(100);
  quad(width/2-lsa-40, height/2, width/2, height/2-lsa-40, 
  width/2+lsa+40, height/2, width/2, height/2+lsa+40);

  textSize(lsa/4+1);
  textAlign(CENTER, CENTER);
  fill(200);
  rect(0, 0, width, lsa/2);
  rect(0, height-lsa/2, width, lsa/2); 
  fill(50);
  text("GAME OVER", width/2, height/2-25);
  textSize(lsa/14+1);
  text("- PRESS SPACE TO TRY AGAIN -", width/2, height/2+25);
  textSize(lsa/4);
  text("LEVEL : "+level, width/2, lsa/4);
  textSize(lsa/6);
  text("HIGHSCORE : "+highScore, width/2, height-lsa/4);
  if (lsa < 250) {
    lsa+=5;
  }

  restart();
}

void restart() {
  if (keyPressed) {
    if (key == ' ') {

      for (int i = 0; i < pathToTake.length; i++) {
        pathToTake[i] = (int)random(4);
      }

      pathShown = true;
      currentRound = true;
      dead = false;

      buttonPressed = pathToTake[buttonToPress];

      drawBackground();
      for (int i = 0; i < button.length; i++) {
        button[i].make();
      }

      zeroLives = false;
      buttonToPress = 0;
      _i = 0;
      a = 0;
      lsa = 0;
      level = 3;
      lives = 3;
      showPathToTake();
    }
  }
}

void getHighScore() {
  if (level > highScore) {
    highScore = level;
    saveHighScore();
  }
}

void saveHighScore() {
  saveHighScore = createWriter("highScoreFile.txt");
  saveHighScore.println(highScore);
  saveHighScore.close();
}

void loadHighScore() {
  reader = createReader("highScoreFile.txt");
  if (reader == null) {
    getHighScore();
    return;
  }
  String line;
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highScore = int(line);
  }
  try {
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void pause(int amount) {
  int currentTime = millis();
  while (millis ()-currentTime < amount) {
  }
}

public class Button {

  float xpos, ypos, c;
  boolean isLit;
  int me;

  public Button(float _x, float _y, float _c, int _me) {
    xpos = _x;
    ypos = _y;
    c = _c;
    isLit = false;
    me = _me;
  }

  public void make() {
    if (isLit) {
      for (int i = 0; i < 50; i++) {
        fill(c, 200, 200+i);
        ellipse(xpos, ypos, 125-i*2.5, 125-i*2.5);
      }
      b[me].play(1);
    } else {
      for (int i = 0; i < 50; i++) {
        fill(c, 200, 200-i*3);
        ellipse(xpos, ypos, 125-i*2.5, 125-i*2.5);
      }
    }
    isLit = false;
    if (pathShown) {
      a++;
      pause(100);
      if (a == 10*(level + 1)) {
        pathShown = false;
      }
    }
  }

  public void check() {
    if (mousePressed) {
      if (sqrt(sq(mouseX-xpos)+sq(mouseY-ypos)) <= 62.5) {
        isLit = true;
        buttonPressed = me;
        if (buttonToPress == pathToTake.length) {
          pathShown = true;
        }
      }
    }
  }

  public void lightUp() {
    isLit = true;
  }
}



