
Timer droptimer;    //timer for raindrops
Catcher catcher;  //catcher object
Raindrop[] drops;  //array of drops
Game game;  // game class object
Timer colortimer; //color change timer

//Global Vars
int totaldrops = 0;  
int gamedroplimit;  // to know at how many drops you win
int gamedropspeed; // drops fall speed
int gamescore = 10; //default is 10
boolean win;
int gamelevel =1;  //level 0 = main menu;
int endgamelevel = 11; // the final level will be 10
color colbackground = 255;

void setup() {
  size(400, 400);
  smooth();
  game = new Game();
  catcher = new Catcher(32); //default radius = 32
  drops = new Raindrop[400];
  droptimer = new Timer(1000);
  droptimer.start();
  colortimer = new Timer(1000);
  colortimer.start();
}

void draw() {
  background(colbackground);
  game.checkLevel(gamelevel);
}

class Catcher {
  float x;
  float y;
  float r;
  color c;

  Catcher(float tempr) {
    x = 0;
    y = 0;
    r = tempr;
    c = (180);
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(0);
    fill(0, 255, 0);
    ellipse(x, y, r*2, r*2);
  }

  boolean intersect(Raindrop d) {
    //calculate distance
    float distance = dist(x, y, d.x, d.y);
    //compare distance to sum of radius
    if ( distance < r + d.r) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Game {
  int level;
  int score;
  int droplimit;

  Game() {
  }

  void checkLevel(int templevel) {    //check level function
    level = templevel;
    switch(level) {
    case 0:
      //main menu here...
      break;
    case 1:
      level1();  
      break;
    case 2:
      level2();
      break;
    case 3:
      level3();
      break;
    case 4:
      level4();
      break;
    case 5:
      level5();
      break;
    case 6:
      level6();
      break;
    case 7:
      level7();
      break;
    case 8:
      level8();
      break;
    case 9:
      level9();
      break;
    case 10:
      level10();
      break;
    }

    // if it's the final level
    if (level >= endgamelevel) {
      gameended();
    }
  }

  void setBackground(color tempcolor) {
    colbackground = tempcolor;
  }

  color changeBackground() {        //change background function
    if (colortimer.isFinished()) {
      colbackground=color(random(255), random(255), random(255));
      colortimer.start();
    }
    return colbackground;
  }

  void loadBasics(int tempdroplimit) {     //load basic common stuff like catcher, drops, score, level
    droplimit = tempdroplimit;
    if (win == false) {
      //Catcher
      catcher.setLocation(mouseX, mouseY);
      catcher.display();

      //Display Score & level
      game.displayLevel(level);
      game.displayScore(gamescore);

      //DROPS
      //creating drop with timer
      if (droptimer.isFinished()) {
        drops[totaldrops] = new Raindrop();
        //println(totaldrops);
        totaldrops++;

        //if we hit the end of array....
        if (totaldrops >= drops.length-droplimit) {
          totaldrops = 0;
          if (gamescore >= 1) {
            win = true;
          } 
          else {
            win = false;
          }
        }
        droptimer.start();
      }

      //start moving and displaying drops
      for (int i = 0; i < totaldrops; i++) {
        drops[i].move();
        drops[i].display();
        if (catcher.intersect(drops[i])) {
          drops[i].caught();
        } 
        else if (drops[i].reachedBottom()) {
          gamescore -= 1;
          if (gamescore <= 0) {
            gamescore = 0;
          }
        }
      }
    }
  }

  void checkWin(boolean tempwin) {   // check if you win or lose
    win = tempwin;
    textSize(50);
    if (win) {
      String txt = "YOU WIN!";
      fill(0, 255, 0);
      text(txt, width/2-115, height/2);
      totaldrops = 0;
      tryAgain();
    } 
    else {
      if (gamescore <= 0) {
        String txt = "YOU LOSE!";
        fill(255, 0, 0);
        text(txt, width/2-115, height/2);
        tryAgain();
      }
    }
  }


  //display the game level
  void displayLevel(int templevel) {
    level = templevel;
    textSize(20);
    fill(0);
    text("Level " + level, 50, 50);
    fill(0, 180, 180);
    rectMode(CENTER);
    stroke(4);
  }


void displayScore(int tempscore) {     //display the game score
    score = tempscore;
    stroke(5);
    textSize(20);
    fill(0);
    text(score, width-50, 50);
    fill(#0FF084);
    rectMode(CORNER);
    rect(379,103,18,score*-10);  //raindrop bar
    
  }
}

//THIS IS OUT OF THE CLASS FUNCTIONS!
//function to start again or continue with a level when you win or Lose
void tryAgain() {
  for (int i = 0; i < totaldrops; i++) {  //stop raindrops
    drops[i].stop();
  }
  fill(0);
  textSize(15);
  if (gamescore <=0) {
    text("Press 'z' Key to Try Again", width/2-+115, height/2+35);
    if (keyPressed) {
      if (key == 'z') {
        totaldrops =0;
        gamescore = 10;
        gamelevel = 1;
        win = false;
      }
    }
  } 
  else {
    text("Press 'z' Key to Continue to the Next Level", width/2-+115, height/2+35);
    if (keyPressed) {
      if (key == 'z') {
        totaldrops =0;
        gamescore = gamescore;
        gamelevel++;
        win = false;
      }
    }
  }
}
class Raindrop {
  float x;
  float y;
  float speed;
  color c;
  float r; 
  Raindrop() {
    r = 8;  // all raindrops are same size;
    x = random(width);
    y = -r*4;  // start little above window
    speed = random(1, 5);
    c = color(50, 100, 150);
  }

  void move() {
    y += speed;
  }

  void stop() {
    y = -r*5;
  }

  boolean reachedBottom() {
    // if we go little past bottom
    if ( y > height+r*2) {
      y = -1000;   // set loction to somewhere way off-screen
      return true;
    } 
    else {
      return false;
    }
  }

  void caught() {
    speed = 0; // spot it from moving
    y = -1000;  // set loction to somewhere way off-screen
  }

  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++) {
      ellipse(x, y+i*4, i*2, i*2);
    }
  }
}

class Timer {
  int savedTime;  //when timer Started
  int totalTime;  // how long timer should last

  Timer(int temptotalTime) {
    totalTime = temptotalTime;
  }

  void start() {
    savedTime = millis();
  }

  void changeTime(int temptotalTime) {
    totalTime = temptotalTime;
  }

  boolean isFinished() {
    //check how much time is passed
    int passedTime = millis() - savedTime;
    if ( passedTime > totalTime) {
      return true;
    }  
    else {
      return false;
    }
  }
}


void level1() {
  color col = color(124, 219, 245);  //light blue
  int lim = 380;  //400-380 = 20 drops
  int speed = 700; //a drops falls every 700ms
  loadLevel(col, lim, speed);
}

void level2() {
  color col = color(255, 124, 124);   //watermelon color 
  int lim = 370;  // 30 drops
  int speed = 650; //600ms
  loadLevel(col, lim, speed);
}

void level3() {  
  color col = color(#9BF536); //green
  int lim = 360;  // 40 drops
  int speed = 550; 
  loadLevel(col, lim, speed);
}

void level4() {  
  color col = color(#F5E314);  //yellow 
  int lim = 350;  // 50 drops
  int speed = 450; 
  loadLevel(col, lim, speed);
}

void level5() {
  color col = color(124, 100, 255);   //purple
  int lim = 350;  //50 drops
  int speed = 400; 
  loadLevel(col, lim, speed);
}

void level6() {
  color col = color(#FC17C4);   //pink?
  int lim = 350;  //50 drops
  int speed = 300; 
  loadLevel(col, lim, speed);
}

void level7() {
  color col =  game.changeBackground();  //change background color every n seconds;  
  colortimer.changeTime(2000);  // 2 seconds
  int lim = 340;  //60 drops
  int speed = 300; 
  loadLevel(col, lim, speed);
}

void level8() {
  color col =  game.changeBackground();  //change background color every n seconds;  
  colortimer.changeTime(1000);  // 1 second
  int lim = 330;  //70 drops
  int speed = 300; 
  loadLevel(col, lim, speed);
}

void level9() {
  color col =  game.changeBackground();  //change background color every n seconds;  
  colortimer.changeTime(800);  // 800ms
  int lim = 330;  //70 drops
  int speed = 300; 
  loadLevel(col, lim, speed);
}

void level10() {
  color col =  game.changeBackground();  //change background color every n seconds;  
  colortimer.changeTime(600);  // 800ms
  int lim = 320;  //80 drops
  int speed = 280; 
  loadLevel(col, lim, speed);
}




// to make some DRY in the file
void loadLevel(color c, int dlim, int dspeed) {  
  game.setBackground(c);  //blue sky color
  gamedroplimit = dlim; // you win with 20 drops
  gamedropspeed = dspeed; // a drop will fall every 700 ms
  droptimer.changeTime(gamedropspeed); //change time of fall for every drop
  game.loadBasics(gamedroplimit);  
  game.checkWin(win);
}
void gameended() {
  for (int i = 0; i < totaldrops; i++) {  //stop raindrops
    drops[i].stop();
  }

  //background
  color col = color(124, 219, 245);
  game.setBackground(col);

  //text
  fill(250, 255, 255);
  textSize(30);
  text("You are a Champ!", width/2-125, height/2-40);
  fill(250, 255, 0);
  text("Thanks for Play!", width/2-115, height/2);
}


