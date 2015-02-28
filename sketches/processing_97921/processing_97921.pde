

//import ddf.minim.*;

//Minim minim;
//AudioPlayer player;
PImage bgImage;
float fps = 24;
color bgColor = color(160, 208, 122);
int recW = 20;
int recH = 20;
int rxPos;
int ryPos;
int skWidth;
int skHeight;

int a = 20;
int b = 20;

int carSpeed = 100;

Caveman myCaveman;

Obstacle myObstacle1;
Obstacle myObstacle2;
Obstacle myObstacle3;
Obstacle myObstacle4;
Score myScore1;
Score myScore2;
Score myScore3;
Score myScore4;

Gui myGui;

void setup() {
    // we pass this to Minim so that it can load files from the data directory
//  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
//  player = minim.loadFile("hb.mp3");
  
  // play the file
//  player.play();
  skWidth = 1000;
  skHeight = 800;
  size(800, 800);
  frameRate(fps);
  bgImage = loadImage("desert.jpg");
  myScore1 = new Score("meat", 16, 0, 5, 5);
  myScore2 = new Score("strawberry", 1, 0, 5, 5);
  myScore3 = new Score("banana", 1, 0, 5, 5);
  myScore4 = new Score("apple", 1, 0, 5, 5);
  myObstacle1 = new Obstacle("burger", 1, 0, 25, 6);
  myObstacle2 = new Obstacle("coke", 1, 0, 30, 10);
  myObstacle3 = new Obstacle("potatoe", 1, 0, 25, 6);
  myObstacle4 = new Obstacle("cookie", 1, 0, 30, 10);
  myCaveman = new Caveman("customSprite", 4, 100, 400, 25);
  myGui = new Gui("BadaBoomBB-12.vlw", 32, 0, 0, 100);
  

}

void draw() {
  background(bgImage);
  levels();
}

void levels() {
  if (myGui.level == 0) {
    myGui.fontLoader();
    myGui.startMenu();
  }
  if (myGui.level == 1) {
    myCaveman.display();
    myCaveman.keyEvents();
    myCaveman.collide();
    myScore1.exist();
    myScore1.drift();
    myObstacle1.exist();
    myObstacle1.drift();
    myGui.levelDisplay();
    myGui.score();
    myGui.healthBar();
  }
    if (myGui.level == 2) {
    myCaveman.display();
    myCaveman.keyEvents();
    myCaveman.collide();
    myScore1.exist();
    myScore1.drift();
    myScore2.exist();
    myScore2.drift();
    myObstacle1.exist();
    myObstacle1.drift();
    myObstacle2.exist();
    myObstacle2.drift();
    myGui.levelDisplay();
    myGui.score();
    myGui.healthBar();
  }
    if (myGui.level == 3) {
    myCaveman.display();
    myCaveman.keyEvents();
    myCaveman.collide();
    myScore1.exist();
    myScore1.drift();
    myScore2.exist();
    myScore2.drift();
    myScore3.exist();
    myScore3.drift();
    myObstacle1.exist();
    myObstacle1.drift();
    myObstacle2.exist();
    myObstacle2.drift();
    myObstacle3.exist();
    myObstacle3.drift();
    myGui.levelDisplay();
    myGui.score();
    myGui.healthBar();
  }
    if (myGui.level == 4) {
    myCaveman.display();
    myCaveman.keyEvents();
    myCaveman.collide();
    myScore1.exist();
    myScore1.drift();
    myScore2.exist();
    myScore2.drift();
    myScore3.exist();
    myScore3.drift();
    myScore4.exist();
    myScore4.drift();
    myObstacle1.exist();
    myObstacle1.drift();
    myObstacle2.exist();
    myObstacle2.drift();
    myObstacle3.exist();
    myObstacle3.drift();
    myObstacle4.exist();
    myObstacle4.drift();
    myGui.levelDisplay();
    myGui.score();
    myGui.healthBar();
  }
  if (myGui.level == 5) {
    myGui.gameOver();
  }
}

class Caveman {
  PImage[] images;
  int imageCount;
  int frame;
  float xpos;
  float ypos;
  float speed;
  
  int selectedImage;
  
  Caveman(String imagePrefix, int count, float tempXpos, float tempYpos, float tempSpeed ) {
    xpos = tempXpos;
    ypos = tempYpos;
    speed = tempSpeed;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png"; 
      images[i] = loadImage(filename);
    }
  }
  
    void display() {
//    imageMode(CENTER);
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
    void keyEvents() {
    if (keyPressed) {
      {
        if (key == CODED)
        {
          if (keyCode == LEFT)
          {
            xpos -= speed;
            selectedImage = 1;
          }
          else if (keyCode == RIGHT)
          {
            xpos += speed ;
            selectedImage = 0;
          }
          else if (keyCode == UP)
          {
            ypos -= speed;
            selectedImage = 3;
          }
          else if (keyCode == DOWN)
          {
            ypos += speed;
            selectedImage = 2;
          }
        }
      }
    }
  }
   int getWidth() {
    return images[0].width;
  }
  
    void collide() {
    float distanceOfMeat = dist(myCaveman.xpos, myCaveman.ypos, myScore1.xpos, myScore1.ypos);  // using the dist() function to create collision
    float distanceOfStrawberry = dist(myCaveman.xpos, myCaveman.ypos, myScore2.xpos, myScore2.ypos);  // using the dist() function to create collision
    float distanceOfBanana = dist(myCaveman.xpos, myCaveman.ypos, myScore3.xpos, myScore3.ypos);  // using the dist() function to create collision
    float distanceOfApple = dist(myCaveman.xpos, myCaveman.ypos, myScore4.xpos, myScore4.ypos);  // using the dist() function to create collision
    float distanceBad = dist(myCaveman.xpos, myCaveman.ypos, myObstacle1.xpos, myObstacle1.ypos);  // using the dist() function to create collision
    float distanceBad2 = dist(myCaveman.xpos, myCaveman.ypos, myObstacle2.xpos, myObstacle2.ypos);  // using the dist() function to create collision
    float distanceBad3 = dist(myCaveman.xpos, myCaveman.ypos, myObstacle3.xpos, myObstacle3.ypos);  // using the dist() function to create collision
    float distanceBad4 = dist(myCaveman.xpos, myCaveman.ypos, myObstacle4.xpos, myObstacle4.ypos);  // using the dist() function to create collision
    if(distanceOfMeat < 100){
      myScore1.xpos = width;
      myScore1.ypos = random(height);
      myScore1.xspeed = random(15);
      myGui.score += 100;
    }
    else if (distanceOfStrawberry < 100){
      myScore2.xpos = width;
      myScore2.ypos = random(height);
      myScore2.xspeed = random(15);
      myGui.score += 100;
    }
    else if (distanceOfBanana < 100){
      myScore3.xpos = width;
      myScore3.ypos = random(height);
      myScore3.xspeed = random(15);
      myGui.score += 100;
    }
    else if (distanceOfApple < 100){
      myScore4.xpos = width;
      myScore4.ypos = random(height);
      myScore4.xspeed = random(15);
      myGui.score += 100;
    }
    else if (distanceBad < 100){
      myObstacle1.xpos = width;
      myObstacle1.ypos = random(height);
      myObstacle1.xspeed = random(15);
      myGui.health -= 5;
    }
    else if (distanceBad2 < 100){
      myObstacle2.xpos = width;
      myObstacle2.ypos = random(height);
      myObstacle2.xspeed = random(15);
      myGui.health -= 5;
    }
    else if (distanceBad3 < 100){
      myObstacle3.xpos = width;
      myObstacle3.ypos = random(height);
      myObstacle3.xspeed = random(15);
      myGui.health -= 5;
    }
    else if (distanceBad4 < 100){
      myObstacle4.xpos = width;
      myObstacle4.ypos = random(height);
      myObstacle4.xspeed = random(15);
      myGui.health -= 5;
    }
  }
}

class Gui {
  PFont newFont;
  String fontStyle;
  int fontSize;
  int score;
  int level;
  int health;
  
  Gui(String tempFontStyle, int tempFontSize, int tempScore, int tempLevel, int tempHealth) {
    fontStyle = tempFontStyle;
    fontSize = tempFontSize;
    score = tempScore;
    level = tempLevel;
    health = tempHealth;
  }
  
  void fontLoader() {
    newFont = loadFont(fontStyle);
    textFont(newFont, fontSize);
  }
  
    void startMenu() {
    background(255, 255, 255);
    fill(0, 0, 0, 235);
    textAlign(CENTER);
    text("avoid the junk food!!!", width/2, height/2-200,0);
    text("use arrow keys to move your caveman", width/2, height/2-30);
    text("eat as many Paleo food items as possible", width/2, height/2);
    text("(click anywhere to start)", width/2, height/2+30);
//    if (mouseX >= (width/2-120) && mouseX <= (width/2+120) && mouseY >= (height/2-120) && mouseY <= (height/2+120) && mousePressed) {
    if ( mousePressed) {
      level = 1;
    }
  }
  
  void score() {
    fill(0, 0, 0);
    textAlign(LEFT);
    text("Points" + "" + ":" + " " + score, 35, 120);
    
    if (score == 500) {
      level = 2;
    }
    if (score == 1000) {
      level = 3;
    }
    if (score == 2000) {
      level = 4;
    }
    if (score == 4000) {
      level = 5;
    }
  }
  
  void levelDisplay() {
    fill(0, 0, 0);
    text("LEVEL" + "" + ":" + " " + level, 35, 170);
  }
  
  void gameOver() {
    background(0, 0, 0);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    if (mouseX >= (width/2-70) && mouseX <= (width/2+70) && mouseY >= (height/2-20) && mouseY <= (height/2+20) && mousePressed) {
      level = 0;
      score = 0;
      health = 100;
    }
  }
  
  void healthBar() {
    fill(0, 0, 0);
    text("HEALTH" + "" + ":" + " " + health, 35, 70);
    if (health == 0) {
      level = 5;
    }
  }

}


class Obstacle {
  float xpos;
  float ypos;
  float xspeed;
  PImage[] images;
  int imageCount;
  int frame;
  
  Obstacle(String imagePrefix, int count, float tempXpos, float tempYpos, float tempXspeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    
    imageCount = count;
    images = new PImage[imageCount];
    
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }
  
  void exist() {
    frame = (frame=1) % imageCount;
    image(images[frame], xpos,  ypos);
  }
  
  void drift() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
      ypos = random(height);
      xspeed = random(15);
    }
  }
}



class Score {
  float xpos;
  float ypos;
  float xspeed;
  PImage[] images;
  int imageCount;
  int frame;
  
  Score(String imagePrefix, int count, float tempXpos, float tempYpos, float tempXspeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    
    imageCount = count;
    images = new PImage[imageCount];
    
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }
  
  void exist() {
    frame = (frame=1) % imageCount;
    image(images[frame], xpos,  ypos);
  }
  
  void drift() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
      ypos = random(height);
      xspeed = random(15);
    }
  }
}



