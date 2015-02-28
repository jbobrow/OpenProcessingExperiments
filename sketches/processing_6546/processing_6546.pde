
// candyland abstraction 1
// by david kanaga
// dec 13, 2009

color[] cardColor = new color[7];

color p1Color;
color p2Color;
color recentColor;

int p1Pos = 0; // player 1 position
int p2Pos = 0; // player 2 position
int timeSize = 375;
int nowSize = 1;

int time1;
int time2;
int tempo;
int tempo2;
int qCounter = 0;

boolean p1Turn = true; // keeps track of whose turn it is
boolean gameOver = true; // keeps track of if the game is still going
boolean winScreen = false;
boolean showMenu = true;

PImage menu;
PImage p1win;
PImage p2win;
PImage noone;

void setup(){
  size(800, 400);
  //colorMode(HSB, 360, 100, 100);
  menu = loadImage("candyland1.jpg");
  p1win = loadImage("p1wins.png");
  p2win = loadImage("p2wins.png");
  noone = loadImage("noone.png");
  smooth();
  
  cardColor[0] = color(255, 0, 0); // red
  cardColor[1]  = color(170, 23, 193); // purple
  cardColor[2] = color(255, 255, 0); // yellow
  cardColor[3] = color(50, 50, 255); // blue
  cardColor[4] = color(255, 128, 0); // orange
  cardColor[5] = color(14, 193, 2); // green
  cardColor[6] = color(250, 154, 212); // pink
  
  p1Color = cardColor[6];
  p2Color = cardColor[6];
  recentColor = cardColor[6];
}

void draw(){
  background(255, 255, 255);
  
  // menu
  if(showMenu == true){
    imageMode(CENTER);
    image(menu, width/2+2, height/2+50);
  }
 
  
  // sliders
  stroke(130, 130, 130);
  fill(255, 255, 255);
  rectMode(CORNER);
  // left slider pole
  rect(100, 50, 10, 300);
  // right slider pole
  rect(690, 50, 10, 300);
  
  // lines
  if(gameOver == false){
    // player-to-grower
    if(p1Turn == true){
      line(120, 365 - p1Pos, width/2 - nowSize/2, height/2 + nowSize/2);
      line(120, 335 - p1Pos, width/2 - nowSize/2, height/2 - nowSize/2);
    } else if(p1Turn == false){
      line(680, 365 - p2Pos, width/2 + nowSize/2, height/2 + nowSize/2);
      line(680, 335 - p2Pos, width/2 + nowSize/2, height/2 - nowSize/2);
    }
    // slider-to-boundary
    line(110, 50, width/2 - timeSize/2, height/2 - timeSize/2);
    line(110, 350, width/2 - timeSize/2, height/2 + timeSize/2);
    line(690, 50, width/2 + timeSize/2, height/2 - timeSize/2);
    line(690, 350, width/2 + timeSize/2, height/2 + timeSize/2);
  }
  
  rectMode(CENTER);
  // player 1
  fill(p1Color);
  rect(105, 350 - p1Pos, 30, 30);
  // player 2
  fill(p2Color);
  rect(695, 350 - p2Pos, 30, 30);
  
  // time-keeper boundary
  noFill();
  rect(width/2, height/2, timeSize, timeSize);
  
  // time-keeper grower
  fill(recentColor);
  rect(width/2, height/2, nowSize, nowSize);
  if(gameOver == false){
    nowSize+=2;
  }
  
  // turn-keeper arrows
  fill(255, 235, 93);
  if(gameOver == false){
    if(p1Turn == true){
      triangle(55, 350 - p1Pos, 45, (350-p1Pos)+10, 45, (350-p1Pos)-10);
    } else if(p1Turn == false){
      triangle(745, 350 - p2Pos, 755, (350-p2Pos)+10, 755, (350-p2Pos)-10);
    }
  }
  
  // has too much time passed?
  if(nowSize >= timeSize){
    gameOver = true;
    image(noone, width/2, height/2);
    winScreen = true;
  }
  
  // win conditions
  if(p1Pos >= 300){
    image(p1win, width/2, height/2);
    gameOver = true;
    winScreen = true;
  } else if(p2Pos >= 300){
    image(p2win, width/2, height/2);
    gameOver = true;
    winScreen = true;
  }
  
}

void keyPressed(){
  if(gameOver == true){
    if(winScreen == true){
      reset();
      winScreen = false;
    } else {
      begin();
    }
  } else {
    if(key == 'q' || key == 'Q'){
      if(p1Turn == true){
        if(p1Pos <= 300){
          int move = int(random(10, 30));
          p1Pos = p1Pos + move;
          int col = int(random(0, 6));
          p1Color = cardColor[col];
          recentColor = p2Color;
          p1Turn = false;
          nowSize = 0;
          if(qCounter > 1){
            time1 = millis();
            tempo2 = tempo;
            tempo = time1 - time2;
            if(tempo2 < tempo){
              timeSize+=40;
            } else if(tempo2 >= tempo){
              timeSize-=60;
            }
          }
          qCounter++;
        }
      }
    }
    if(key == 'p' || key == 'P'){
      if(p1Turn == false){
        if(p2Pos <= 300){
          int move = int(random(10, 30));
          p2Pos = p2Pos + move;
          int col = int(random(0, 6));
          p2Color = cardColor[col];
          recentColor = p1Color;
          p1Turn = true;
          nowSize = 0;
          time2 = millis();
          tempo2 = tempo;
          tempo = time2 - time1;
          if(tempo2 < tempo){
            timeSize+=40;
          } else if(tempo2 >= tempo){
            timeSize-=60;
          }
        }
      }
    }
    if(key == BACKSPACE){
      gameOver = true;
      reset();
    }
  }
}


// function to reset the game (go to the "menu")
void reset(){
  showMenu = true;
  p1Color = cardColor[6];
  p2Color = cardColor[6];
  recentColor = cardColor[6];
  p1Pos = 0;
  p2Pos = 0;
  p1Turn = true;
  timeSize = 375;
  nowSize = 1;
  qCounter = 0;
}

// function to start the game
void begin(){
  showMenu = false;
  gameOver = false; 
}


