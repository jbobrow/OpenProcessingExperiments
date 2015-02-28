
PImage bg;
ArrayList NGenemies = new ArrayList();
ArrayList MGenemies = new ArrayList();
ArrayList SGenemies = new ArrayList();
ArrayList BGenemies = new ArrayList();
int deadCount = 0;
int scoreCount = 0;
NormalGloopie temp1 = new NormalGloopie();
MeltieGloopie temp2 = new MeltieGloopie();
StickyGloopie temp3 = new StickyGloopie();
BiterGloopie temp4 = new BiterGloopie();
Player me;
int score = 0;
int enemiesLeft = 100;
boolean dead = false;

void setup() {
  size(800,600);
  bg = loadImage("bg.jpg");
  background(184, 138, 0);
  frameRate(20);
  me = new Player();
  textSize(24);
}

void draw() {
  image(bg, 0, 0, 800, 600);
  fill(0,0,0);
  text("Score: " + score,650,550);
  
  float gen = random(10);
  if (gen > 9 && enemiesLeft > 0) {
    if(gen > 9.6) {
      NGenemies.add(new NormalGloopie());
    }else if(gen > 9.35) {
      MGenemies.add(new MeltieGloopie());
    }else if(gen > 9.10) {
      SGenemies.add(new StickyGloopie());
    }else if(gen > 9) {
      BGenemies.add(new BiterGloopie());
    }
  }
  
  if(dead == false) {
    me.update();
  }  
  
  for(int i = 0; i < NGenemies.size(); i++) {
    temp1 = (NormalGloopie) NGenemies.get(i);
    temp1.move();
    temp1.display();
  }
  
  for(int i = 0; i < NGenemies.size(); i++) {
    temp1 = (NormalGloopie) NGenemies.get(i);
    if(temp1.getStatus() == false) {
      NGenemies.remove(i);
    }
  }
  
  
  
  
  for(int i = 0; i < MGenemies.size(); i++) {
    temp2 = (MeltieGloopie) MGenemies.get(i);
    temp2.move();
    temp2.display();
  }
  
  for(int i = 0; i < MGenemies.size(); i++) {
    temp2 = (MeltieGloopie) MGenemies.get(i);
    if(temp2.getStatus() == false) {
      MGenemies.remove(i);
    }
  }
  
  for(int i = 0; i < MGenemies.size(); i++) {
    temp2 = (MeltieGloopie) MGenemies.get(i);
    if(temp2.isSliced() == true) {
      if(me.getXPos() > temp2.getXPos()-25 && me.getXPos() < temp2.getXPos()+25 && me.getYPos() > temp2.getYPos()-25 && me.getYPos() < temp2.getYPos()+25) {
        me.kill();
      }
      if(me.getXPos() > temp2.getXPos()-20 && me.getXPos() < temp2.getXPos()+20 && me.getYPos() > temp2.getYPos()-20 && me.getYPos() < temp2.getYPos()+20) {
        me.kill();
      }
    }

  }
  
  
  for(int i = 0; i < SGenemies.size(); i++) {
    temp3 = (StickyGloopie) SGenemies.get(i);
    temp3.move();
    temp3.display();
  }
  
  for(int i = 0; i < SGenemies.size(); i++) {
    temp3 = (StickyGloopie) SGenemies.get(i);
    if(temp3.getStatus() == false) {
      SGenemies.remove(i);
    }
  }
  
  for(int i = 0; i < SGenemies.size(); i++) {
    temp3 = (StickyGloopie) SGenemies.get(i);
    if(temp3.isSliced() == true) {
      if(me.getXPos() > temp3.getXPos()-25 && me.getXPos() < temp3.getXPos()+25 && me.getYPos() > temp3.getYPos()-25 && me.getYPos() < temp3.getYPos()+25) {
        me.slow();
      }
    }
  }
  
  
  
  for(int i = 0; i < BGenemies.size(); i++) {
    temp4 = (BiterGloopie) BGenemies.get(i);
    temp4.move();
    temp4.display();
  }
  
  for(int i = 0; i < BGenemies.size(); i++) {
    temp4 = (BiterGloopie) BGenemies.get(i);
    if(temp4.getStatus() == false) {
      BGenemies.remove(i);
    }
  }
  
  for(int i = 0; i < BGenemies.size(); i++) {
    temp4 = (BiterGloopie) BGenemies.get(i);
    if(me.getXPos() > temp4.getXPos()-20 && me.getXPos() < temp4.getXPos()+20 && me.getYPos() > temp4.getYPos()-20 && me.getYPos() < temp4.getYPos()+20) {
      me.kill();
    }
  }
  
  
  fill(0);
  text("Enemies Left: " + constrain(enemiesLeft, 0, 100), 50, 550);
  
  if(enemiesLeft <= 0) {
    background(0,0,0);
    fill(255,255,255);
    textSize(36);
    textAlign(CENTER,CENTER);
    text("COMPLETE!",400,300);
  }
  
  if(me.getStatus() == false) {
    background(0,0,0);
    fill(255,255,255);
    textSize(36);
    textAlign(CENTER,CENTER);
    text("DEAD",400,300);
    text("SCORE: " + score,400,400);
  }
}


void mouseClicked() {
  me.swing();
  for(int i = 0; i < NGenemies.size(); i++) {
    temp1 = (NormalGloopie) NGenemies.get(i);
    float distance = sqrt(sq(me.getXPos() - temp1.getXPos()) + sq(me.getYPos() - temp1.getYPos()));
    if (distance < 150) {
      temp1.kill();
      deadCount = deadCount + 1;
      scoreCount = scoreCount + temp1.getPoints();
    }
  }
  for(int i = 0; i < MGenemies.size(); i++) {
    temp2 = (MeltieGloopie) MGenemies.get(i);
    float distance = sqrt(sq(me.getXPos() - temp2.getXPos()) + sq(me.getYPos() - temp2.getYPos()));
    if (distance < 150) {
      temp2.kill();
      deadCount = deadCount + 1;
      scoreCount = scoreCount + temp2.getPoints();
    }
  }
  for(int i = 0; i < SGenemies.size(); i++) {
    temp3 = (StickyGloopie) SGenemies.get(i);
    float distance = sqrt(sq(me.getXPos() - temp3.getXPos()) + sq(me.getYPos() - temp3.getYPos()));
    if (distance < 150) {
      temp3.kill();
      deadCount = deadCount + 1;
      scoreCount = scoreCount + temp3.getPoints();
    }
  }
  for(int i = 0; i < BGenemies.size(); i++) {
    temp4 = (BiterGloopie) BGenemies.get(i);
    float distance = sqrt(sq(me.getXPos() - temp4.getXPos()) + sq(me.getYPos() - temp4.getYPos()));
    if (distance < 150) {
      temp4.kill();
      deadCount = deadCount + 1;
      scoreCount = scoreCount + temp4.getPoints();
    }
  }
  score = score + deadCount*scoreCount;
  enemiesLeft = enemiesLeft - deadCount;
  scoreCount = 0;
  deadCount = 0;
}

class Player {
  
  boolean alive = true;
  float xPos = 0;
  float yPos = 0;;
  float easing = 0.06;
  boolean slow = false;
  int slowCounter = 100;
  
  Player() {
    xPos = width/2;
    yPos = height/2;
  }
  
  void update() {
    if(slow == true) {
      easing = .03;
      slowCounter = slowCounter - 1;
    }
    if(slowCounter == 0) {
      slow = false;
      slowCounter = 100;
      easing = .06;
    }
    float targetX = mouseX;
    float dx = targetX - xPos;
    if(abs(dx) > 1) {
      xPos += dx * easing;
    }
    
    float targetY = mouseY;
    float dy = targetY - yPos;
    if(abs(dy) > 1) {
      yPos += dy * easing;
    }
    fill(0,0,0);
    stroke(0,0,0);
    ellipse(xPos, yPos, 30, 30);
    pushMatrix();
    translate(xPos,yPos);
    rotate(atan((mouseY-yPos) / (mouseX-xPos)) + .9);
    fill(180);
    if(mouseX - xPos > 0) {
      rect(0,0,150,20);
    }else{
      rect(0,0,-150,20);
    }
    popMatrix();
  }
  
  void swing() {
    pushMatrix();
    translate(xPos,yPos);
    rotate(atan((mouseY-yPos) / (mouseX-xPos)) + .9);
    fill(255,0,0);
    if(mouseX - xPos > 0) {
      rect(0,0,150,20);
      arc(0,0,300,300,PI+PI/6,2*PI,PIE);
    }else{
      rect(0,0,-150,20);
      arc(0,0,300,300,PI/6,PI,PIE);
    }
    popMatrix();
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;
  }
  
  void kill() {
    alive = false;
  }
  
  void slow() {
    slow = true;
  }
  
  boolean getStatus() {
    return alive;
  }
}





class NormalGloopie {
  
  boolean alive = true;
  float xPos = 0;
  float yPos = 0;
  float xSpeed = 0;
  float ySpeed = 0;
  int pointValue = 1;
  
  NormalGloopie() {
    float temp = random(2);
    float speedGen = random(7);
    if(temp > 1.5) {
      xPos = random(width);
      yPos = 0;
      ySpeed = speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > 1) {
      xPos = random(width);
      yPos = height;
      ySpeed = -speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > .5) {
      xPos = 0;
      yPos = random(height);
      xSpeed = speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }else {
      xPos = width;
      yPos = random(height);
      xSpeed = -speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }
  }
  
  void display() {
    fill(0,255,0);
    stroke(0,0,0);
    ellipse(xPos, yPos, 30, 30);
  }
  
  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;
  }
  
  int getPoints() {
    return pointValue;
  }
  
  void kill() {
    alive = false;
  }
  
  boolean getStatus() {
    return alive;
  }
}

class MeltieGloopie {
  
  boolean alive = true;
  boolean sliced = false;
  float xPos = 0;
  float yPos = 0;
  float xSpeed = 0;
  float ySpeed = 0;
  int pointValue = 10;
  int counter = 100;
  
  MeltieGloopie() {
    float temp = random(2);
    float speedGen = random(7);
    if(temp > 1.5) {
      xPos = random(width);
      yPos = 0;
      ySpeed = speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > 1) {
      xPos = random(width);
      yPos = height;
      ySpeed = -speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > .5) {
      xPos = 0;
      yPos = random(height);
      xSpeed = speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }else {
      xPos = width;
      yPos = random(height);
      xSpeed = -speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }
  }
  
  void display() {
    if(sliced == false) {
      fill(255,200,0);
      stroke(0,0,0);
      ellipse(xPos, yPos, 30, 30);
    }else{
      fill(255,200,0,150);
      stroke(0,0,0);
      ellipse(xPos, yPos, 50, 50);
    }
  }
  
  void move() {
    if(sliced == false) {
      xPos = xPos + xSpeed;
      yPos = yPos + ySpeed;
    }
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;
  }
  
  int getPoints() {
    return pointValue;
  }
    
  void kill() {
    sliced = true;
  }
  
  boolean isSliced() {
    return sliced;
  }
  
  boolean getStatus() {
    if(sliced == true) {
      counter--;
    }
    if(counter == 0) {
      alive = false;
    }
    return alive;
  }
}


class StickyGloopie {
  
  boolean alive = true;
  boolean sliced = false;
  float xPos = 0;
  float yPos = 0;
  float xSpeed = 0;
  float ySpeed = 0;
  int pointValue = 10;
  int counter = 100;
  
  StickyGloopie() {
    float temp = random(2);
    float speedGen = random(7);
    if(temp > 1.5) {
      xPos = random(width);
      yPos = 0;
      ySpeed = speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > 1) {
      xPos = random(width);
      yPos = height;
      ySpeed = -speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > .5) {
      xPos = 0;
      yPos = random(height);
      xSpeed = speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }else {
      xPos = width;
      yPos = random(height);
      xSpeed = -speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }
  }
  
  void display() {
    if(sliced == false) {
      fill(255,255,0);
      stroke(0,0,0);
      ellipse(xPos, yPos, 30, 30);
    }else{
      fill(255,255,0,150);
      stroke(0,0,0);
      ellipse(xPos, yPos, 50, 50);
    }
  }
  
  void move() {
    if(sliced == false) {
      xPos = xPos + xSpeed;
      yPos = yPos + ySpeed;
    }
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;
  }
  
  int getPoints() {
    return pointValue;
  }
    
  void kill() {
    sliced = true;
  }
  
  boolean isSliced() {
    return sliced;
  }
  
  boolean getStatus() {
    if(sliced == true) {
      counter--;
    }
    if(counter == 0) {
      alive = false;
    }
    return alive;
  }
}


class BiterGloopie {
  
  boolean alive = true;
  float xPos = 0;
  float yPos = 0;
  float xSpeed = 0;
  float ySpeed = 0;
  int pointValue = 8;
  
  BiterGloopie() {
    float temp = random(2);
    float speedGen = random(7);
    if(temp > 1.5) {
      xPos = random(width);
      yPos = 0;
      ySpeed = speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > 1) {
      xPos = random(width);
      yPos = height;
      ySpeed = -speedGen;
      xSpeed = sqrt(49 - sq(ySpeed));
      if(random(2)>1) {
        xSpeed = xSpeed*-1;
      }
    }else if (temp > .5) {
      xPos = 0;
      yPos = random(height);
      xSpeed = speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }else {
      xPos = width;
      yPos = random(height);
      xSpeed = -speedGen;
      ySpeed = sqrt(49 - sq(xSpeed));
      if(random(2)>1) {
        ySpeed = ySpeed*-1;
      }
    }
  }
  
  void display() {
    fill(0,0,255);
    stroke(0,0,0);
    ellipse(xPos, yPos, 30, 30);
  }
  
  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
  }
  
  float getXPos() {
    return xPos;
  }
  
  float getYPos() {
    return yPos;
  }
  
  int getPoints() {
    return pointValue;
  }
  
  void kill() {
    alive = false;
  }
  
  boolean getStatus() {
    return alive;
  }
}



