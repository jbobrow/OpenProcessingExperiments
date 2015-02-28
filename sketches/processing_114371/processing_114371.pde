
PImage girl_1;
PImage pinkworm;


Girl girl = new Girl();
JellyDrop[] jelly = new JellyDrop[50];

void setup() {
  textAlign(CENTER);
  smooth();
  size(480, 640);
  //array of jellies
  for (int i=0; i<jelly.length; i++) {
    jelly[i] = new JellyDrop();
  }
}

int jelliesMissed = 0;
int jelliesCaught = 0;
int gameState = 1;

void draw() {
  background(255);
  
  girl_1 = loadImage("girl.png");
  pinkworm = loadImage("pinkworm.png");
  imageMode(CENTER);

  girl.display();
  //jelly array
  for (int i=0; i<jelly.length;i++) {
    if (millis()/1000 == jelly[i].timeToDisplay) {
      jelly[i].makeJelly();
    }
  }

  //keep making jelly and falling
  for (int i=0; i<jelly.length; i++) {
    if (jelly[i].falling) {
      jelly[i].display();
      jelly[i].fall();
    }

    //if the girl is under the jelly, call it a catch otherwise miss
    if (abs(jelly[i].locationY-girl.locationY+35)<=5
      &&abs(jelly[i].locationX - girl.locationX)<=35) {
      jelly[i].caught();
      jelliesCaught ++;
    }
    if (jelly[i].locationY>680) {
      jelly[i].miss();
      jelliesMissed++;
    }
  }

  fill(0);
  text("Jellies Caught:" + jelliesCaught, 200, 15);
  //gameover
  if (jelliesMissed + jelliesCaught == 50) {
    gameState = 2;
  }


//end of game
 if (gameState == 2) {
    text("Congratulations! You ate " +jelliesCaught+ " jellies!", 200, 100);
    if (jelliesCaught >=jelliesMissed) {
      text("WIN!", 200, 200);
    }
    else text("LOSE!", 200, 200);
  }
}


class Girl {
  int locationX;
  int locationY;

  Girl() {
    locationX = 240;
    locationY = 600;
  }
  void display() {
    fill(0);
    image(girl_1, mouseX, 520);
  }
}
class JellyDrop {
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;

  JellyDrop() {
    locationY = 0;
    locationX = (int)random(5, 600);
    //girl shouldnt fall
    falling = false;
    timeToDisplay = (int)random(2, 60);
    fallingSpeed = (int)random(2, 5);
  }

  void display() {
    image(pinkworm, locationX, locationY);
  }

  void fall() {
    locationY += fallingSpeed;
  }

  void makeJelly() {
    falling = true;
  }

  void caught() {
    fallingSpeed = 0;
    locationX = 999;
  }

  void miss() {
    fallingSpeed = 0;
    locationY = -100;
  }
}



