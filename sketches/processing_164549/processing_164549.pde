
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/84478*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs font="cassannet.ttf"; */

float fps = 24;
color bgColor = color(65, 216, 240);
color bgColor2 = color(0, 0, 0, 200);
int recW = 20;
int recH = 20;
int rxPos;
int ryPos;
int skWidth;
int skHeight;
boolean mm = false;

StopWatchTimer sw;

int a = 20;
int b = 20;

int fishSpeed = 10;

Food myFood1;
Food myFood2;
Food myFood3;
Food myFood4;

FishSprite myFishSprite;

Gui myGui;

void setup() {
  skWidth = 1000;
  skHeight = 450;
  size(1000, 450);
  frameRate(fps);
  myFood1 = new Food("foodSprite", 16, 1000, 350, 6);
  myFood2 = new Food("foodSprite", 16, 1000, 50, 4);
  myFood3 = new Food("foodSprite", 16, 1000, 200, 5);
  myFood4 = new Food("foodSprite", 16, 1000, 5, 10);
  myFishSprite = new FishSprite("fishSprite", 11, 50, 50, 10);
  myGui = new Gui("Cassannet.ttf", 30, 0, 0, 10);
  sw = new StopWatchTimer();
  sw.start();
}

void draw() {
  background(bgColor);
  levels();
}










class Gui {
  PFont ourFont;
  String fontStyle;
  int fontSize;
  int score;
  int level;
  int health;


  Gui(String tempFontStyle, int tempFontSize, int tempScore, int tempLevel, int tempHealth) {
    health = tempHealth;
    fontStyle = tempFontStyle;
    fontSize = tempFontSize;
    score = tempScore;
    level = tempLevel;
  }

  void fontLoader() {
    ourFont = loadFont(fontStyle);
    textFont(ourFont, fontSize);
  }

  void scoreUp() {
    fill(bgColor2);
    textAlign(LEFT);
    text("score" + " " + "=" + " " + nf(score, 2), 20, 438);
  }

  void levelDisplay() {
    fill(bgColor2);
    textAlign(LEFT);
    text("level" + " " + "=" + " " + nf(level, 2), 167, 438);
  }

  void healthUp() {
    fill(bgColor2);
    textAlign(LEFT);
    text("health" + " " + "=" + " " + health, 304, 438);
  }

  void timeCount() {
    fill(bgColor2);
    textAlign(LEFT);
    text("time" + " " + "=" + " " + nf(sw.minute(), 1)+":"+nf(sw.second(), 2), 459, 438);
  }

  void mainMenu() {
    fill(bgColor2);
    textAlign(RIGHT);
    text("Menu", 980, 438);
  }
 

  void headerDisplay() {
    smooth();
    rectMode(CORNER);
    fill(0,0,0,80);
    rect(0,407,1000,43);
    fill(bgColor2);
    rect(0, 405, 1000, 2);
  }

  void startMenu() {
    fill(bgColor2);
    textAlign(CENTER);
    text("press start", width/2, height/2);
    if (mouseX >= (width/2 - 70) && mouseX <= (width/2 + 70) && mouseY >= (height/2 - 20) && mouseY <= (height/2 + 20) && mousePressed) {
      level = 1;
    }
  }
}


class FishSprite {
  PImage[] images;
  int imageCount;
  int frame;
  float xpos;
  float ypos;
  float speed;

  FishSprite(String imagePrefix, int count, float tempXpos, float tempYpos, float tempSpeed) {
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
    imageMode(CENTER);
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
    if(xpos > 1000){
      xpos = 0;
    }
    else if (xpos < 0){
    xpos = 1000;
    }
    else if(ypos < 0){
      ypos = 450;
    }
    else if(ypos > 450){
      ypos = 0;
    }
  }
  
  
 void keyEvents() {
  if (keyPressed) {
    if (key == 'd') {
      xpos += speed ;
    }
    if (key == 'a') {
      xpos -= speed;
    }
    if (key == 's') {
      ypos += speed;
    }
    if (key == 'w') {
      ypos -= speed;
    }
  }
}

void collide(){
  int sense = 20;
  if(xpos >= (myFood1.xpos - sense) && xpos <= (myFood1.xpos + sense) && ypos <= (myFood1.ypos + sense) && ypos >= (myFood1.ypos - sense) && mm == false){
    myFood1.xpos = width;
    myFood1.ypos = random(height);
    myFood1.xspeed = random(15);
    myGui.score += 1;
  }
  else if(xpos >= (myFood2.xpos - sense) && xpos <= (myFood2.xpos + sense) && ypos <= (myFood2.ypos + sense) && ypos >= (myFood2.ypos - sense) && mm == false){
    myFood2.xpos = width;
    myFood2.ypos = random(height);
    myFood2.xspeed = random(15);
    myGui.score += 1;
  }
  else if(xpos >= (myFood3.xpos - sense) && xpos <= (myFood3.xpos + sense) && ypos <= (myFood3.ypos + sense) && ypos >= (myFood3.ypos - sense) && mm == false){
    myFood3.xpos = width;
    myFood3.ypos = random(height);
    myFood3.xspeed = random(15);
    myGui.score += 1;
  }
  else if(xpos >= (myFood4.xpos - sense) && xpos <= (myFood4.xpos + sense) && ypos <= (myFood4.ypos + sense) && ypos >= (myFood4.ypos - sense) && mm == false){
    myFood4.xpos = width;
    myFood4.ypos = random(height);
    myFood4.xspeed = random(15);
    myGui.score += 1;
  }
  else {
    collided = false;
  }
}
  
  int getWidth() {
    return images[0].width;
  }
  
}


//declare class
class Food {
  float xpos;
  float ypos;
  float xspeed;
  PImage[] images;
  int imageCount;
  int frame;

  //Constructor
  Food(String imagePrefix, int count, float tempXpos, float tempYpos, float tempXspeed) {
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
    imageMode(CENTER);
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
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

void levels() {
  if(mm == true){
    smooth();
    fill(0,0,0,100);
    rectMode(CENTER);
    rect(width/2,height/2,500,200);
    myGui.fontLoader(); 
  }
  if (myGui.level == 0) {
    myGui.fontLoader();
    myGui.startMenu();
  }

  if (myGui.level == 1) {
  levelGui();
  if (myGui.score == 3) {
      myGui.level = 2;
    }
  }
  
  if(myGui.level == 2){
    levelGui();
  }
}

void levelGui(){
  myFishSprite.display();
    myFishSprite.keyEvents();
    myFishSprite.collide();
    myFood1.exist();
    myFood1.drift();
    myFood2.exist();
    myFood2.drift();
    myFood3.exist();
    myFood3.drift();
    myFood4.exist();
    myFood4.drift();
    myGui.fontLoader();
    myGui.headerDisplay();
    myGui.levelDisplay();
    myGui.scoreUp();
    myGui.mainMenu();
    myGui.healthUp();
    myGui.timeCount();
    
}

 void mouseReleased(){
    if (mouseX > 917 && mouseX < 980 && mouseY > 408 && mouseY < 438 && mm == false){
      mm = true;
    }
    else if (mouseX > 917 && mouseX < 980 && mouseY > 408 && mouseY < 438 && mm == true){
      mm = false;
    }
    
    }

    // =================================================
    // classes
    class StopWatchTimer {
      int startTime = 0, stopTime = 0;
      boolean running = false;
      void start() {
        startTime = millis();
        running = true;
      }
      void stop() {
        stopTime = millis();
        running = false;
      }
      
   
    
      int getElapsedTime() {
        int elapsed;
        if (running) {
          elapsed = (millis() - startTime);
        }
        else {
          elapsed = (stopTime - startTime);
        }
        return elapsed;
      }
      int second() {
        return (getElapsedTime() / 1000) % 60;
      }
      int minute() {
        return (getElapsedTime() / (1000*60)) % 60;
      }
      int hour() {
        return (getElapsedTime() / (1000*60*60)) % 24;
      }
    }
    // ====================================================


