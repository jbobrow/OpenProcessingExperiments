
//Arryas
DuckLine[] ducks = new DuckLine[0];
DuckLineLeft[] ducks2 = new DuckLineLeft[0];
DuckLineRight[] ducks3 = new DuckLineRight[0];

//Ints
int score = 0;
int level = 1;

int incrementSpeed = 0;

boolean GameOver = false;
boolean seeInstructions = true;

int startTime;
boolean running = false;
int accumTime;
int displayTime;
int limitCounter = 30;
int dSecs;

//images
PImage duck;
PImage ducksmall;
PImage BG;

void setup() {
  size(752, 452);
  //Images
  duck = loadImage ("DuckLeft.png");
  ducksmall = loadImage ("DuckRight.png");
  BG = loadImage ("Lagoon.png");
}

void draw() {
  if (seeInstructions == false) {
    if (!GameOver) {
      image(BG, 0, 0);
  
      //Add a new duck
      if (frameCount%40==0) {
        DuckLine duck = new DuckLine();
        ducks = (DuckLine[]) append(ducks, duck);
      }
  
      if (frameCount%40==0) {
        DuckLineLeft duck2 = new DuckLineLeft();
        ducks2 = (DuckLineLeft[]) append(ducks2, duck2);
      }
  
      if (frameCount%40==0) {
        DuckLineRight duck3 = new DuckLineRight();
        ducks3 = (DuckLineRight[]) append(ducks3, duck3);
      }
  
      //Remove Duck after 30 have been created
      if (ducks.length>150) {
        ducks = (DuckLine[]) subset(ducks, 1);
        ducks2 = (DuckLineLeft[]) subset(ducks2, 1);
        ducks3 = (DuckLineRight[]) subset(ducks3, 1);
      }
  
      //Move Duck
      for (int i = 0; i<ducks.length; i++) {
        if (i%2==0 && i>0) {
          ducks[i].update(false);
        } else {
          ducks[i].update(true);
        }
  
        if (i%4==0) {
          ducks2[i].update(false);
        } else {
          ducks2[i].update(true);
        }
  
        if (i%3==0 && i>0) {
          ducks3[i].update(false);
        } else {
          ducks3[i].update(true);
        }
      }

     timer();

  ///text("\n \n score: " + nf(score, 2), 90, 25);

      if(level == 1 && score == 50){
        level=2;
        incrementSpeed+=2;
      
      }
      
      if(level == 2 && score == 100){
        level=3;
        incrementSpeed+=2;
       
      }      
      
       if(level == 3 && score == 150){
        level=4;
        incrementSpeed+=2;
    
      }
    
          if(level == 4 && score == 200){
        level=5;
        incrementSpeed+=2;
    
      }  
    
    
          if(level == 5 && score == 250){
        level=6;
        incrementSpeed+=2;
    
      }    
      
       if(level == 6 && score == 300){
        level=7;
      fill(255, 0, 0);
      textSize(18);
  
     if (keyPressed == true){
        reset();
      }
      } 
      
    } else {
      
      
      fill(255, 0, 0);
      textSize(18);
  if (score == 300 )
  {
      text("CONGRATULATION", 400, 25);
      frameCount=0;
       
  }else{
      text("GAME OVER", 400, 25);
      frameCount=0;
  }
  
     if (keyPressed == true){
        reset();
      }
 }

    /// Game Over
    if(score == 300 ){
      GameOver=true;
      resetTimer();
    }

    //Score
    textSize(18);
    fill(0);
    
    text("Score: " + score, 180, 25);
    text("Level: " + level, 10, 25);
  } else {
    background(0);

    fill(255);
    rect(width/2-70, height/2+60,150,40);

    fill(255);
    textSize(18);

    text("Instruction:\nThe object is to hunt as\nmany ducks as possible.\n\nYou must use the mouse.", width/2-130, height/2-95);

    fill(0);
    text("Press Start", width/2-40, height/2+86);

    frameCount=0;

    if ((mousePressed == true) && (mouseX > width/2-70) && (mouseX < (width/2-70) + 150) && (mouseY > height/2+60) && (mouseY < (height/2+60) + 40)){
      seeInstructions = false;
      reset();
    }
  }
} // End of Draw
 
void mousePressed() {
  for (int i = 0; i<ducks.length; i++) {
    DuckLine duck = ducks[i];

    if ((mouseX>duck.x) && (mouseX<duck.x + duck.w) && (mouseY>duck.y) && (mouseY<duck.y+duck.h)) {
      duck.alive = false;
      score+=5;
    }
  }

  for (int i = 0; i<ducks2.length; i++) {
    DuckLineLeft duck2 = ducks2[i];

    if ((mouseX>duck2.x) && (mouseX<duck2.x + duck2.w) && (mouseY>duck2.y) && (mouseY<duck2.y+duck2.h)) {
      duck2.alive = false;
       score+=5;
    }
  }

  for (int i = 0; i<ducks3.length; i++) {
    DuckLineRight duck3 = ducks3[i];

    if ((mouseX>duck3.x) && (mouseX<duck3.x + duck3.w) && (mouseY>duck3.y) && (mouseY<duck3.y+duck3.h)) {
      duck3.alive = false;
       score+=5;
    }
  }
}

class DuckLine {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float speed;
  boolean alive;

  DuckLine() {
    y = 285;
    w = 86;
    x = width+30;
    h = 41;
    velX = -2-incrementSpeed;
    velY = 0;
    alive = true;
    speed=1;
  }

  void update(boolean hide) {
    x+=velX;
    y+=velY*speed;
  
    if(alive) {
      fill(255, 0, 0);
      stroke(255); 
    } else {
      fill(0,0,0);
      noStroke();

      /* velY-=1;
      velX=0;
      x=-1000; */
      y=height*2;
    }

    float posY = y-20;
    if (hide == true) {
      posY = height + 100;
    }

    image(ducksmall, x, posY);
  }
}

class DuckLineLeft {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float speed;
  boolean alive;

  DuckLineLeft() {
    y = 349;
    w = 86;
    x = width+30;
    h = 41;
    velX = -2-incrementSpeed;
    velY = 0;
    alive = true;
    speed=1;
  }

  void update(boolean hide) {
    x+=velX;
    y+=velY*speed;
  
    if(alive) {
      fill(255, 0, 0);
      stroke(255); 
    } else {
      fill(0,0,0);
      noStroke();

      /* velY-=1;
      velX=0;
      x=-1000; */
      y=height*2;
    }

    float posY = y-20;
    if (hide == true) {
      posY = height + 100;
    }

    image(ducksmall, x, posY);
  }
}

class DuckLineRight {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float speed;
  boolean alive;

  DuckLineRight() {
    y = 419;
    w = 86;
    x = width+30;
    h = 41;
    velX = -2-incrementSpeed;
    velY = 0;
    alive = true;
    speed=1;
  }

  void update(boolean hide) {
    x+=velX;
    y+=velY*speed;
  
    if(alive) {
      fill(255, 0, 0);
      stroke(255); 
    } else {
      fill(0,0,0);
      noStroke();

      /* velY-=1;
      velX=0;
      x=-1000; */
      y=height*2;
    }

    float posY = y-20;
    if (hide == true) {
      posY = height + 100;
    }

    image(ducksmall, x, posY);
  }
} 
 
void reset(){
  level=1;
  score=0;
  incrementSpeed=0;

  GameOver = false;
  
  ducks = (DuckLine[]) new DuckLine[0];
  ducks2 = (DuckLineLeft[]) new DuckLineLeft[0];
  ducks3 = (DuckLineRight[]) new DuckLineRight[0];
}

void resetTimer(){
  startTime=0;
  running = false;
  accumTime=0;
  displayTime=0;
  limitCounter=60;
  dSecs= -1;
}

void timer(){
  if (running == false) {
    startTime = millis();
    running = true;
  }

  if (running == true) {
    displayTime = accumTime + millis() - startTime;
  }
 
  dSecs = limitCounter - ((displayTime / 1000) % 60);
 // text("Time: " + nf(dSecs, 2), 90, 25);
}


