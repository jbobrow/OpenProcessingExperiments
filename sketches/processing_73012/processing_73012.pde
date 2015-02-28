
//Katherine(Kathy) Lee
//Homework#7 60-257
//Copyright 2012

/*
I N S T R U C T I O N S
- Try to move the cursor around so that it WON'T hit the car.
- The longer you stay alive the higher your score!
- The speed of the car is different(random) every game.


C R E D I T S
- Some basic elements are from Jim's GameDemo example (as well as the idea of making "gamePhase")
- Car image is from google.
*/


int count;
int time;
int gameTime, startTime;
int gamePhase;
float x, y, dia;
float eX = random(0,width);
float eY = random(0,height);
float eXSpeed = random(15, 20);
float eYSpeed = random(15, 20);
float mouseDia = 10;


void setup() {
  size(400, 400);
  count = 0;
  gameTime = 30000;
  startTime = 0;
  ellipseMode(CENTER);
  smooth();
}


void draw() {
  PImage img;
  img = loadImage("background.jpg");
  background(img);
  {
    if(gamePhase == 0){
    instructions();
    }
    else if(gamePhase ==1){
    playGame();
    }
    else {
    score();
    }
}
}

void score() {
  time = millis();
  fill(255, 0, 0);
  text("G A M E O V E R", width/2, 200);
//  text("Y O U R S C O R E : ", width/2, 240); //how do i show score?
  showScore();
  noLoop();
}

void checkTime() {
  fill(230, 200, 0);
  text("T I M E R E M A I N I N G : " + (gameTime/1000 - ((millis( ))/1000)), width/2, 20);
  if((millis( )) > gameTime)
  {
  gamePhase = 2;
  }
}

void showScore() {
  fill(255);
  text("S C O R E : " + (time / 500), width/9, height*.1);
}

void drawEnemy() {
  
  //float eX = 100;
  //float eY = 100;
  float eDia = 20;
  PImage img;
  img = loadImage("car.png");
  image(img, eX, eY);
//  ellipse(eX, eY, eDia, eDia);
  eX = eX + eXSpeed;
  eY = eY + eYSpeed;
  
  if(eX > width) {
    eX = 0;
  }
  
  if(eX < 0) {
    eX = width;
  }
  
  if(eY > height) {
    eY = 0;
  }
  
  if(eY < 0) {
    eY = height;
  }
}

void mouse() {
  fill(230, 0, 140);
  PImage img;
  img = loadImage("me.png");
  image(img, mouseX, mouseY);
  imageMode(CENTER);
//  ellipse(mouseX, mouseY, mouseDia, mouseDia);
  noCursor();
}


void bam() {
  fill(255, 0, 0);
  rect(0, 0, width, height);
}

void collide() {
  float eDia = 20;
  float d = dist(eX, eY, mouseX, mouseY);
  if (d < eDia/2+mouseDia) {
    bam();
    gamePhase = 2;
  }
}

void playGame() {
  drawEnemy();
  checkTime();
  collide();
  mouse();
}

//void drawTarget()

  
  
void instructions() {
  text("c l i c k . t o . s t a r t !", width/2, height/2);
  text("try to avoid crashing into the car by ", width*.08, height*.6);
  text("moving your cursor around", width*.08, height*.63);
}

void mousePressed() {
  if (gamePhase == 0) {
    gamePhase = 1;
    startTime = millis();
  }
}

