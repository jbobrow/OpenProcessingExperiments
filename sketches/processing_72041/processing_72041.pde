
//Hey Playgramming!
//This is a weird game prototype. 
//Click around the screen to leave an orange blast in your wake. Try to catch the red enemy in the blast to get points.
//It shows how to properly draw a score. The enemy is controlled inside a method called enemy();

PFont font;
int oldY=0, oldX=0, newX=0, newY=0, enemyX=1000, enemyY=600, score=0;
boolean trigger = false;
boolean killed = false;
int grow = 50;

void setup() {
  font = loadFont("Serif-48.vlw"); 
  textFont(font, 32); 
  text("Score", 15, 50);
  size(1000, 600); 
  smooth();
  background(0);
  rectMode(CORNER);
}

void draw() {
  background(255);
  fill(0);
  text("Score: "+score, 15, 50);
  enemy();
  fill(0);
  ellipse(oldX, oldY, 50, 50);
  fill(0, 125, 255);
  ellipse(newX, newY, 50, 50);
  line(oldX, oldY, newX, newY);
  if (trigger==true) {
    fill(255, 125, 0);
    ellipse(oldX, oldY, grow, grow);
    grow+=5;
    if (grow>200) {
      grow=50;
      trigger=false;
    }
  }
}

void mousePressed() {
  trigger=true;
  if (killed==true) {
    enemyX=1000;
    enemyY=600;
    killed=false;
  }
  oldX=newX;
  oldY=newY;
  newX=mouseX;
  newY=mouseY;
}

void enemy() {
  if (trigger==true) {
    if (enemyX<oldX+(grow/2) && enemyY<oldY+(grow/2) ) {
      score+=1;
      killed=true;
    }
  }
  if (killed==false) {
    if (enemyX>newX) {
      enemyX-=5;
    }
    else {
      enemyX+=5;
    }
    if (enemyY>newY) {
      enemyY-=5;
    }
    else {
      enemyY+=5;
    }
    fill(255, 0, 0);
    ellipse(enemyX, enemyY, 50, 50);
  }
}


