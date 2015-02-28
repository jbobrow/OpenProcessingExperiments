
//images
PImage s1_background;
PImage s2_background;
PImage s3_background;
PImage s4_background;
//image arrays
Features[] Mouth = new Features[9];
Features[] Eyes = new Features[9];
Player mark;
int lastGame; //in milliseconds (1000 = 1 sec)
int STATE;

void setup () {
  size(400, 800);
  //images
  s1_background = loadImage("1_background.jpg");
  s2_background = loadImage("2_background.jpg");
  s3_background = loadImage("3_background.jpg");
  s4_background = loadImage("4_background.jpg");

  //load features
  for (int i = 1; i < Mouth.length; i++) {
    Mouth[i] = new Features(i, random(10, width-10), random(-600, 0), random(2, 5));
    Eyes[i] = new Features(i, random(10, width-10), random(-600, 0), random(2, 5));
  }
  //load player
  mark = new Player (width/2, height-100);
  //start screen
  STATE = 1;
}

void draw () {  
  imageMode(CENTER);
  //START SCREEN
  if (STATE == 1) {
    STATE = 1;
    background(s1_background);
    fill(255);
    //player
    mark = new Player (width/2, height-100);
    
    if (keyPressed) {
      if (key == ENTER) {
        STATE = 2;
      }
    }
  }

  //START GAME
  else if (STATE == 2) {
    //timer
    if (millis() > 20000 + lastGame) {
      lastGame = millis();
      STATE = 3;
    }

    //
    background(s2_background);

    //PLAYER
    mark.display();
    mark.move();
    //FEATURES move down
    //mouth
    for (int i = 1; i < Mouth.length; i++) {
      //INTERACT
      if (dist(mark.playerX, mark.playerY, Mouth[i].circleX, 
      Mouth[i].circleY) < 30) {
        fill(255, 255, 0);
        Mouth[i].featSize=0;
        Mouth[i].captured = true;
      } 
      else {
        fill(255);
      }
      if (Mouth[i].captured == false) {
        Mouth[i].displayMouth();
        Mouth[i].moveMouth();
      }
      //if feature Y greater than 1000, restart at top, random X
      if (Mouth[i].circleY > 1000) {
        Mouth[i].circleY = 0;
        Mouth[i].circleX = random(10, width-10);
      }
    }

    //eyes
    for (int i = 1; i < Eyes.length; i++) {
      //INTERACT
      if (dist(mark.playerX, mark.playerY, Eyes[i].circleX, 
      Eyes[i].circleY) < 30) {
        fill(255, 255, 0);
        Eyes[i].featSize=0;
        Eyes[i].captured = true;
      } 
      else {
        fill(255);
      }
      if (Eyes[i].captured == false) {
        Eyes[i].displayEyes();
        Eyes[i].moveEyes();
      }
      //if feature Y greater than 1000, restart at top, random X
      if (Eyes[i].circleY > 1000) {
        Eyes[i].circleY = 0;
        Eyes[i].circleX = random(10, width-10);
      }
    }
  }

  //END SCREEN
  else if (STATE == 3) {
    background(s3_background);
    fill(255);
    textMode(MODEL);
    text("REFRESH to restart", width/2-40, 240);
    text("Press SPACE for Credits", width/2-60, 270);
    if (keyPressed) {
      if (key == ' ') {
        STATE = 4;
      }
    }
    for (int i = 1; i < 9; i++) {
      if (Mouth[i].captured == true) {
        Mouth[i].showMouth(260, 520);
      }
      if (Eyes[i].captured == true) {
        Eyes[i].showEyes(260, 450);
      }
    }
  }
  else if (STATE == 4) {
    fill(255);
    background(s4_background);
    textMode(MODEL);
    int textHeight = 300;
    int hShift = -100;
    text("Based on original boardgame by", width/2+hShift, textHeight);
    text("Janet Chan", width/2+hShift, textHeight+20);
    text("Dana Li", width/2+hShift, textHeight+35);
    text("Antonietta Gianfrancesco", width/2+hShift, textHeight+50);
    text("Raffles Tao", width/2+hShift, textHeight+65);
    text("Kacey Chang", width/2+hShift, textHeight+80);
    text("Lab Art & Science Spring 2013", width/2+hShift, textHeight+95);
    text("Processing game by", width/2+hShift, textHeight+120);
    text("Janet Chan", width/2+hShift, textHeight+140);
    text("Creative Computing Fall 2013", width/2+hShift, textHeight+155);
    
    fill(236, 0, 140);
    text("Press ENTER to return", width/2+hShift, textHeight+200);
    
    if (keyPressed) {
      if (key == ENTER) {
        STATE = 3;
      }
    }
  }
}

class Features {
  int maxImages = 9; //Total # of images

  //images
  //mouth
  PImage[] mouth_s2 = new PImage[maxImages]; 
  PImage[] mouth_s3 = new PImage[maxImages]; 

  //eyes
  PImage[] eyes_s2 = new PImage[maxImages]; 
  PImage[] eyes_s3 = new PImage[maxImages]; 

  float circleX;
  float circleY;
  float speed;
  float featSize;
  int imageIndex;
  boolean captured = false;


  Features (int tempI, float tempX, float tempY, float tempS) {
    circleX = tempX;
    circleY = tempY;
    speed = tempS;
    imageIndex = tempI;
    featSize = 10;

    //Images
    //STATE 2 mouth
    for (int i = 1; i < mouth_s2.length; i ++ ) {
      mouth_s2[i] = loadImage( "2_mouths-0" + i + ".png" );
    }
    //STATE 3 mouth
    for (int i = 1; i < mouth_s3.length; i ++ ) {
      mouth_s3[i] = loadImage( "3_mouths-0" + i + ".png" );
    }

    //STATE 2 eyes
    for (int i = 1; i < mouth_s2.length; i ++ ) {
      eyes_s2[i] = loadImage( "2_eyes-0" + i + ".png" );
    }
    //STATE 3 eyes
    for (int i = 1; i < mouth_s3.length; i ++ ) {
      eyes_s3[i] = loadImage( "3_eyes-0" + i + ".png" );
    }
  }


  //MOUTH
  void displayMouth() {
    imageMode(CENTER);
    image(mouth_s2[imageIndex], circleX, circleY);
  }
  //STATE 3 images
  void showMouth(int X, int Y) {
    image(mouth_s3[imageIndex], X, Y);
  }
  void moveMouth() {
    circleY = circleY + speed;
  }

  //EYES
  void displayEyes() {
    imageMode(CENTER);
    image(eyes_s2[imageIndex], circleX, circleY);
  }
  //STATE 3 images
  void showEyes(int X, int Y) {
    image(eyes_s3[imageIndex], X, Y);
  }
  void moveEyes() {
    circleY = circleY + speed;
  }
}

class Player {
  //image
  PImage alien;

  float playerX;
  float playerY;
  float speed;
  float playSize;

  Player (float tempX, float tempY) {
    playerX = tempX;
    playerY = tempY;
    alien = loadImage("2_player.png");
    playSize = 30; //player size
  }

  void display() {
    image(alien, playerX, playerY);
  }

  void move() {
    playerX = mouseX;
  }
}



