
monster monster1;
PImage img;
enemy enemy1;
enemy enemy2;
enemy enemy3;
enemy enemy4;
enemy enemy5;
enemy enemy6;

PFont font;
int lives = 5;



void setup() {
  size(1000, 700);
  img = loadImage("Background.jpg");
  monster1 = new monster( width/2, 500,100,70);
  enemy1 = new enemy(random(0, width), random(-20,0), -30, 30, random(6, 8));
  enemy2 = new enemy(random(0, width), random(-20,0), -30, 30, random(6, 8));
  enemy3 = new enemy(random(0, width), random(-20,0), -30, 30, random(6, 8));
  enemy4 = new enemy(random(0, width), random(-20,0), -30, 30, random(6, 8));
  enemy5 = new enemy(random(0, width), random(-20,0), -30, 30, random(6, 8));
  enemy6 = new enemy(random(0, width), random(-20,0), -30, 30, random(6, 8));
  
  font = loadFont("font.vlw");

}

void draw() {
 image(img, 0,0,1000,700);
  monster1.drawMonster();
  monster1.move();
  //collide();
  //collor();
  //move();
 enemy1.drawEnemy();
 enemy1.moveY();
 enemy1.checkY();
  enemy1.collissionEnemy();
 enemy2.drawEnemy();
 enemy2.moveY();
 enemy2.checkY();
  enemy2.collissionEnemy();
 enemy3.drawEnemy();
 enemy3.moveY();
 enemy3.checkY();
  enemy3.collissionEnemy();
 enemy4.drawEnemy();
 enemy4.moveY();
 enemy4.checkY();
  enemy4.collissionEnemy();
 enemy5.drawEnemy();
 enemy5.moveY();
 enemy5.checkY();
  enemy5.collissionEnemy();
 enemy6.drawEnemy();
 enemy6.moveY();
 enemy6.checkY();
  enemy6.collissionEnemy();
 
 
 println(enemy1.collided);
 
 textFont(font);
  fill(255);
  text("Levens: " + lives, 110, 50);


  if (enemy1.collided == true || enemy2.collided == true || enemy3.collided == true || enemy4.collided == true || enemy5.collided == true || enemy6.collided == true) {
    lives = lives - 1;
  }


  if (lives == -1) {
    noLoop();
    textFont(font, 60);
    fill(255);
    textAlign(CENTER);
    text("Geen levens meer", width/2, height/2);
    textFont(font, 30);
    text("Druk op Enter om opnieuw te beginnen", width/2, height/2+100);
  }
}
  void keyPressed() {
  if (keyCode == ENTER) {
    lives = 5;
    loop();
  }
}



class monster{
  float x;
  float y;
  float w;
  float h;
  int speed;
  
  monster(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = 12;
  }


void drawMonster() {
fill(172,220,95);
rect(mouseX-50,600,10,10);
rect(mouseX-50,610,10,10);
rect(mouseX-50,620,10,10);
rect(mouseX-50,630,10,10);
rect(mouseX-40,620,10,10);
rect(mouseX-40,630,10,10);
rect(mouseX-40,640,10,10);
rect(mouseX-40,660,10,10);
rect(mouseX-30,590,10,10);
rect(mouseX-30,610,10,10);
rect(mouseX-30,620,10,10);
rect(mouseX-30,630,10,10);
rect(mouseX-30,640,10,10);
rect(mouseX-30,650,10,10);
rect(mouseX-20,600,10,10);
rect(mouseX-20,610,10,10);
rect(mouseX-20,630,10,10);
rect(mouseX-20,640,10,10);
rect(mouseX-10,610,10,10);
rect(mouseX-10,620,10,10);
rect(mouseX-10,630,10,10);
rect(mouseX-10,640,10,10);
rect(mouseX,610,10,10);
rect(mouseX,620,10,10);
rect(mouseX,630,10,10);
rect(mouseX,640,10,10);
rect(mouseX+10,610,10,10);
rect(mouseX+10,620,10,10);
rect(mouseX+10,630,10,10);
rect(mouseX+10,640,10,10);
rect(mouseX+20,600,10,10);
rect(mouseX+20,610,10,10);
rect(mouseX+20,630,10,10);
rect(mouseX+20,640,10,10);
rect(mouseX+30,590,10,10);
rect(mouseX+30,610,10,10);
rect(mouseX+30,620,10,10);
rect(mouseX+30,630,10,10);
rect(mouseX+30,640,10,10);
rect(mouseX+30,650,10,10);
rect(mouseX+40,620,10,10);
rect(mouseX+40,630,10,10);
rect(mouseX+40,640,10,10);
rect(mouseX+40,660,10,10);
rect(mouseX+50,600,10,10);
rect(mouseX+50,610,10,10);
rect(mouseX+50,620,10,10);
rect(mouseX+50,630,10,10);
}

void move(){
    monster1.x = mouseX;
     y = 700;
  
}
}

class enemy {
  float x;
  float y;
  float w;
  float h;
  float speedY;
  boolean collided;
  PImage img;
  
  enemy(float tempX, float tempY, float tempW, float tempH, float tempSpeedY){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = tempSpeedY;
    img = loadImage("Meteoriet.png");
  }
  void drawEnemy(){
   image(img, x, y, 70, 100);
  }
  
  void moveY() {
    y = y + speedY;
  }

  void checkY() {
    if (y > height) {
      y = - 20;
      x = random(0, width);
      speedY = random(6, 8);
    }
  }
void collissionEnemy() {
    if (monster1.x+monster1.w/2 >= x-w/2 && monster1.x-monster1.w/2 <= x+w/2 && monster1.y+monster1.h/2 >= y-h/2 && monster1.y-monster1.h/2 <= y+h/2) {
      collided = true;
    
      y = 0;
      }
      else {collided = false;
      }

    }
}




