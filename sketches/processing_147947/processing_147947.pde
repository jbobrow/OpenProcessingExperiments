
PImage target;
PImage target2;
PFont font;
boolean scorePossible; // when false, clicking does not give points.
boolean targetSwitch;
boolean gameFlow = true;

int score = 0;

void setup() {
  size(400, 400);
  noStroke();
  smooth();

  target = loadImage("target.png");
  target2 = loadImage("target2.png");
  font = loadFont("RemachineScript.ttf");
  textFont(font, 30);
}

void draw() {
  if (gameFlow == true) {
    float time = millis()/1000;
    imageMode(CENTER);
    image(target, 200, 200);
    if ((time >= 2 && time <= 3) || (time >= 6 && time <= 7)) {
      targetSwitch = true;
      scorePossible = false;
      image(target2, 200, 200);
    }
    else {
      targetSwitch = false;
      scorePossible = true;
    }
  }
  if (time >= 10) {
    endGame();
  }
}

void mouseClicked() {
  float time = millis()/1000;
  if ((mouseX > 136 && mouseX < 261) && (
  mouseY > 136 && mouseY < 261)) {
    if (targetSwitch == false) { 
      if (scorePossible == true) { 
        score++;
        println(score);
      }
    }
    else {
      endGame();
    }
  }
}

void endGame() {
  scorePossible = false;
  gameFlow = false;
  background(204);
  fill(0, 0, 255);
  text("Game over!", 120, 170);
  text("Score: " + score, 135, 210);
}



