
int speed;
int time = 0;
int Timer;
int screenNumber;
int x, y;
boolean upwards, downwards;
PVector moveLeft;
int blocks;
ArrayList<Box> obstacles;
int numFrames = 0;
 
void setup() {
  size(600, 600);
  x = width/5;
  y = height/4;
  frameRate(30);
  screenNumber = 0;
  obstacles = new ArrayList<Box>();
  
}
void draw() {
  fill( 0, 0, 0);
  background(200);
  smooth();
  textSize(45);
  numFrames += 15;
  if (numFrames % 30 == 0) {
    obstacles.add(new Box());
  }
  if (screenNumber == 0) {
    //http://www.openprocessing.org/visuals/?visualID=15771
    //Used Michael L, who wrote go,dodge stuffs which helped me
    //with screen changes
    startMenu();
  }
  else if (screenNumber == 1) {
    showScores();
    drawCharacter();
    moveCharacter();
    boundary();
    if (collision()) {
      screenNumber = 2;
      return;
    }
    for ( Box b : obstacles) {
      b.render();
    }
    //http://www.openprocessing.org/visuals/?visualID=29263
    //Used Ellen Wee's for loop to help me remove blocks after they exit from the screen.
    for (int a = 0; a < obstacles.size(); a++) {
      Box get = obstacles.get(a);
      if (get.x < 0) {
        obstacles.remove(a);
      }
    }
  }
  else if (screenNumber == 2) {
    endGameMenu();
  }
}
void keyPressed() {
  if ( keyCode == 87) {
    upwards = true;
  }
  if (keyCode == 83) {
    downwards = true;
  }
}
void keyReleased() {
  if (keyCode == 87) {
    upwards = false;
  }
  if (keyCode == 83) {
    downwards = false;
  }
}
void drawCharacter() {
  ellipseMode(CENTER);
  ellipse(x, y, 25, 25);
}
void moveCharacter() {
  speed = 10;
  if (upwards) {
    y -= speed;
  }
  if (downwards) {
    y += speed;
  }
}

class Box {
  float x, y;
  int boxHeight = 20;
  Box() {
    x = width;
    y = random(height) - boxHeight;
  }
  void render() {
    rectMode(CENTER);
    rect(x, y, boxHeight, boxHeight);
    x -= 10;
    if (Timer > 15000) {
      x -= 2;
    }
    if (Timer > 30000) {
      x -= 4;
    }
    if (Timer > 45000) {
      x -= 6;
    }
    if (Timer > 60000) {
      x -= 8;
    }
    if (Timer > 100000) {
      x -= 10;
    }
  }
}

void startMenu() {
  fill(255, 140, 0);
  text("Evade", 0, 50);
  fill( 0, 0, 205);
  text("Press space to start", 0, 300);
  if (keyCode == ' ')
  {
    Timer += 40;
    screenNumber = 1;
  }
}
void endGameMenu() {
  fill(0, 0, 205);
  text("Your score is " + Timer, 0, 400);
  fill(255, 140, 0);

}
void showScores()
{
  textSize(30);
  Timer = Timer + 40;
  text("Score: " + Timer, 0, 600);
}
void boundary() {
  if ( y <= 13) {
    y = 13;
  }
  else if (y >= height - 13) {
    y = height - 13;
  }
}
boolean collision() {
  for (Box b: obstacles) {
    float distance = dist(b.x, b.y, x, y);
    if (distance <= 25 ) {
      return true;
    }
  }
  return false;
}


