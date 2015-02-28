
PImage display;
PFont theFont;

int arrayNumber = 4;
BadGuys[] badGuy = new BadGuys[arrayNumber];

String attempt = "";
int score = 0;
int health = 100;

String[] word = {
  "finger1", "finger2", "finger3", "finger4", "finger5", "finger6", "finger7", "finger8", "finger9", "finger10"
};

boolean shot = false;
int dead = 0;

public String[] guess = new String[4];





void setup() {
  size(600, 650);

  display = loadImage("background.jpg");
  display.resize(600, 650);
  background(display);

  createFont("Ravie-48.vlw", 48);
  theFont = loadFont("Ravie-48.vlw");
  textFont(theFont, 20);

  rectMode(CENTER);
  ellipseMode(CENTER);

  for (int i = 0; i<badGuy.length; i++) {
    badGuy[i] = new BadGuys();
  }
}




void draw() {
  background(display);

  graphicInterface();

  for (int i = 0; i<badGuy.length; i++) {
    badGuy[i].setGuy();
    badGuy[i].moveGuy();
  }
}



class BadGuys {
  public int[] objectX = new int[4];
  public int[] wordX = new int[4];
  public int[] y = new int[4];

  public BadGuys() {
    objectX[0] = 300;
    objectX[1] = 600;
    objectX[2] = 300;
    objectX[3] = 0;

    wordX[0] = 330;
    wordX[1] = 630;
    wordX[2] = 330;
    wordX[3] = 30;

    y[0] = 0;
    y[1] = 300;
    y[2] = 600;
    y[3] = 300;

    for (int i = 0; i<badGuy.length; i++) { 
      guess[i] = word[(int)random(10-1)];
    }
  }

  void setGuy() {
    fill(255);

    for (int i = 0; i<badGuy.length; i++) {
      ellipse(objectX[i], y[i], 30, 30);
      text(guess[i], wordX[i], y[i]);
    }
    if(shot = true){
      guess[dead] = word[(int)random(10-1)];
      ellipse(objectX[dead], y[dead], 30, 30);
      text(guess[dead], wordX[dead], y[dead]);
    }
  }

  void moveGuy() {
    for (int  i = 0; i<badGuy.length; i++) {
      if (y[i]<250) {
        y[i]++;
      }
      if (objectX[i]>350) {
        objectX[i]--;
        wordX[i]--;
      }
      if (y[i]>350) {
        y[i]--;
      }
      if (objectX[i]<250) {
        objectX[i]++;
        wordX[i]++;
      }
    }
  } 
  
  
}



  void graphicInterface() {
    //wee man (you)
    fill(255);
    ellipse(300, 300, 20, 20);


    //player's word
    fill(50);
    rect(50, 625, 100, 50);  
    fill(150);
    rect(200, 625, 200, 50);

    //score
    fill(50);
    rect(337.5, 625, 90, 50);
    fill(150);
    rect(412.5, 625, 75, 50);

    //health
    fill(50);
    rect(487.5, 625, 75, 50);
    fill(150);
    rect(562.5, 625, 75, 50);

    //text
    fill(0);
    text("Type", 5, 635);
    text(attempt, 105, 635);
    text("Score", 300, 635);
    text(score, 380, 635);
    text("HP", 455, 635);
    text(health, 530, 635);
  }




  void keyPressed() {
    attempt+=key;
    if (key == ENTER) {
      for(int i = 0; i<badGuy.length; i++){
        if(attempt == guess[i]){
          score+=10;
          dead = i;
          attempt="";
          badGuy[i].setGuy();
        }else{
          attempt="";
        }
      }
    }
  }


