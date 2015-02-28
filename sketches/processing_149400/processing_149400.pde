
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/149289*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int score = 0;
int lives = 3;
PImage tomato;
//PImage tomato2;
PImage catcher1;
PImage bg;
PImage heart;
PImage drumstick;
PImage endHippo;
PImage gameOver;
PImage heart2;
PImage powerUp;
PImage bigHippo;
int numObjects = 3;
FallingObjects[] objects = new FallingObjects[numObjects];
float velocity = 7;
Catcher c1 = new Catcher();
boolean gameStart = false;
boolean endGame = false;
boolean startup = true;
boolean poweredUp = false;
FallingObjects2 bonus;
int nextLevel = 20;
FallingLife extraLife;
FallingPowerUp powerUp1;
PowerCatcher c2;

void setup() {
  frameRate(30);
  ellipseMode(CENTER);
  tomato = loadImage("tomatesinvAA.gif");
  //tomato2 = loadImage("tomatesinvCC.gif");
  catcher1 = loadImage("newHippo.gif");
  bg = loadImage("forestsm.png");
  heart = loadImage("heart.gif");
  drumstick = loadImage("meat.gif");
  endHippo = loadImage("endgamehippo.gif");
  gameOver = loadImage("gameover.png");
  heart2 = loadImage("life.gif");
  powerUp = loadImage("present.gif");
  bigHippo = loadImage("biggerHippo.gif");
  size(600, 600);
  smooth();
  for (int i = 0; i < objects.length; i++) {
    objects[i] = new FallingObjects();
    //f1 = new FallingObjects();
  }
  bonus = new FallingObjects2();
  extraLife = new FallingLife();
  powerUp1 = new FallingPowerUp();
  c2 = new PowerCatcher();
}    

void draw() {
  if (gameStart) {
    startGame();
  }
  else if (endGame) {
    endScreen();
  }  
  else if (startup) {
    startupScreen();
  }
  println(velocity);
}

class Catcher {
  //float x;
  float y;
  private float radius = 20;

  Catcher() {
    //x = mouseX;
    y = 575;
  }

  void render() {
    fill(200);
    //x = mouseX;
    //ellipse(x, y, radius * 2, radius * 2);
    image(catcher1, mouseX-30, y-55);
  }    
  float getRadius() {
    return radius;
  }

  void setRadius(float n) {
    radius = n;
  }
}

class PowerCatcher {
  //float x;
  float y;
  private float radius = 45;

  PowerCatcher() {
    //x = mouseX;
    y = 575;
  }

  void render() {
    fill(200);
    //x = mouseX;

    image(bigHippo, mouseX-30, y-80);
  }    
  float getRadius() {
    return radius;
  }
}    


class FallingObjects {

  float x, y;
  private float radius = 15;

  FallingObjects() {
    x = random(width);
    y = random(-height);
  }

  void fall() {
    y = y + velocity;
    image(tomato, x-17, y-17);  

    //ellipse(r, y, radius * 2, radius * 2);     


    if (collision(x, y, radius)) {
      score++;
      x = random(width);
      y = random(-height);
    }
    else if (y>=height-25) {
      lives--;
      if (lives==0) {
        gameStart = false;
        endGame = true;
        x = random(width);
        y = random(-height);
      }  
      x = random(width);
      y = random(-height);
    }
  }
}

class FallingObjects2 {

  float x, y;
  private float radius = 15;

  FallingObjects2() {
    x = random(width);
    y = random(-height);
  }
  void fall() {
    y = y + 10;
    image(drumstick, x-17, y-17);     

    if (collision(x, y, radius)) {
      score = score + 3;
      x = random(width);
      y = random(-2000);
    }
    else if (y>=height-25) {  
      x = random(width);
      y = random(-2000);
    }
  }
}

class FallingLife {

  float x, y;
  private float radius = 15;

  FallingLife() {
    x = random(width);
    y = random(-height);
  }
  void fall() {
    y = y + 12;
    image(heart2, x-17, y-17);     

    if (collision(x, y, radius)) {
      lives++;
      x = random(width);
      y = random(-5000);
    }
    else if (y>=height-25) {  
      x = random(width);
      y = random(-5000);
    }
  }
}

class FallingPowerUp {

  float x, y;
  private float radius = 16;

  FallingPowerUp() {
    x = random(width);
    y = random(-10000);
  }
  void fall() {
    y = y + 13;
    image(powerUp, x-17, y-17);     
    if (!poweredUp) {  
      if (collision(x, y, radius)) {
        poweredUp = true;
        x = random(width);
        y = 700;
        
      }
      else if (y>=height-25 && !poweredUp) {  
        x = random(width);
        y = random(-10000);
      }
    }
  }
}

boolean collision(float o, float p, float r) {
  float d = dist(mouseX, 550, o, p);
  if (d <= c1.getRadius() + r) {
    return true;
  }
  else {
    return false;
  }
}        
void increaseDifficulty() {
  if (score>= nextLevel) {
    velocity += 1.5;
    nextLevel += 15;
  }
}
void startupScreen() {
  size(600, 600);
  fill(81, 147, 111);
  rect(150, 450, 300, 80, 7);
  textSize(60);
  fill(random(255), random(255), random(255));
  text("HUNGRY", 180, 150);
  text("HIPPO", 220, 260);
  textSize(30);
  text("2", 450, 115);
  fill(0); 
  textSize(60);
  text("START", 210, 510);
  mousePressed();
  reset();
}

void startGame() {
  background(bg,0,0);
  stroke(10);
  //fill(random(255), random(255), random(255));
  fill(0);
  textSize(60);
  text((int)(score), 50, 70);
  image(heart, 500, 20);
  textSize(45);
  text(lives, 525, 67);
  increaseDifficulty();
  //c1.x = mouseX;
  if (poweredUp) {
    c2.render();
  }  
  if (!poweredUp) {
    c1.render();
  }
  for (int i = 0; i < objects.length; i++) {
    objects[i].fall();
  } 
  if (score > 15) {    
    bonus.fall();
  }
  if (score > 40) {
    extraLife.fall();
  }
  if(score > 20){
    powerUp1.fall();
  }  
}
void endScreen() {
  background(bg,0,0);
  image(gameOver, 100, 50);
  image(endHippo, 400, 350);
  textSize(55);
  fill(0);
  text("SCORE:", 50, 430);
  text(score, 270, 430);
  text("PLAY AGAIN", 45, 530);
  if (mouseX >= 50 && mouseX <= 400 && mouseY >= 500 && mouseY <= 555) {
    textSize(55);
    fill(0);
    text("PLAY AGAIN", 45, 530);
    fill(random(255), random(255), random(255));
    text("PLAY AGAIN", 50, 530);

    if (mousePressed == true) {
      endGame = false;
      reset();
      for (int i = 0; i < objects.length; i++) {
        objects[i].x = random(width);
        objects[i].y = random(-height);
      } 
      gameStart = true;
    }
  }
}


void mousePressed() {
  if (mouseX >= 150 && mouseX <= 450 && mouseY >= 450 && mouseY <= 530 && startup) {
    fill(31, 221, 110);
    textSize(60);
    text("START", 215, 510);
    if (mousePressed == true) {
      startup = false;
      gameStart = true;
      reset();
    }
  }
} 

void reset() {
  velocity = 7;
  lives = 3;
  score = 0;
  poweredUp = false;
}  
