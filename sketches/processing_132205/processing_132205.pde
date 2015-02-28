
monster monster1;
PImage img;
enemy enemy1;
enemy enemy2;
enemy enemy3;
enemy enemy4;
enemy enemy5;
enemy enemy6;
enemy enemy7;
PFont font;
int lives = 3;



void setup() {
  size(1000, 500);
  img = loadImage("Background.jpg");
  monster1 = new monster( width/2, 500,60,70);
  enemy1 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  enemy2 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  enemy3 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  enemy4 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  enemy5 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  enemy6 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  enemy7 = new enemy(random(0, width), random(-20,0), 30, 30, random(6, 8));
  
  font = loadFont("font.vlw");

}

void draw() {
 image(img, 0,0,1000,500);
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
 enemy7.drawEnemy();
 enemy7.moveY();
 enemy7.checkY();
  enemy7.collissionEnemy();
 
 println(enemy1.collided);
 
 textFont(font);
  fill(255);
  text("Lives: " + lives, 700, 50);


  if (enemy1.collided == true || enemy2.collided == true || enemy3.collided == true || enemy4.collided == true || enemy5.collided == true || enemy6.collided == true || enemy7.collided == true) {
    lives = lives - 1;
  }


  if (lives == -1) {
    noLoop();
    textFont(font, 100);
    fill(255);
    textAlign(CENTER);
    text("Game Over! ", width/2, height/2);
    textFont(font, 50);
    text("Press Enter to restart", width/2, height/2+100);
  }
}
  void keyPressed() {
  if (keyCode == ENTER) {
    lives = 3;
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
  /* Body */
  fill(0, 255, 0);

  /* Armen*/
  /*Rechts*/
  rect(x+40, y-35, 20, 3);
  rect(x+40, y-40, 20, 3);
  rect(x+40, y-45, 20, 3);
  rect(x+40, y-50, 20, 3);
  /*Links*/
  rect(x-10, y-35, 20, 3);
  rect(x-10, y-40, 20, 3);
  rect(x-10, y-45, 20, 3);
  rect(x-10, y-50, 20, 3);

  /*Benen*/
  rect(x+30, y-25, 10, 10);
  rect(x+10, y-25, 10, 10);



  /*Ext ogen stokken*/
  fill(0, 255, 0);
  rect(x+7, y-130, 5, 20);
  rect(x+38, y-130, 5, 20);

  /*Lichaam*/
  fill(0, 255, 0);
  rect(x+20, y-60, 10, 10);

  /*Hoofd*/
  rect(x, y-110, 50, 50);
  rect(x+10, y-55, 30, 30);

  /*voeten*/
  fill(58, 72, 38);
  ellipse(x+35, y-15, 10, 10);
  ellipse(x+15, y-15, 10, 10);

  /* Handen */
  /*Links*/
  ellipse(x-10, y-48, 10, 3);
  ellipse(x-10, y-43, 10, 3);
  ellipse(x-10, y-38, 10, 3);
  ellipse(x-10, y-33, 10, 3);
  /*Rechts*/
  ellipse(x+60, y-48, 10, 3);
  ellipse(x+60, y-43, 10, 3);
  ellipse(x+60, y-38, 10, 3);
  ellipse(x+60, y-33, 10, 3);


  /*eyes*/
  fill(255);
  ellipse(x+9, y-90, 15, 15);
  ellipse(x+42, y-90, 15, 15);
  ellipse(x+26, y-90, 15, 15);
  /* Ext ogen */
  ellipse(x+9, y-130, 15, 15);
  ellipse(x+41, y-130, 15, 15);

  fill(0);
  ellipse(x+9, y-90, 4, 4);
  ellipse(x+42, y-90, 4, 4);
  ellipse(x+26, y-90, 4, 4);
  /* Ext ogen */
  ellipse(x+9, y-130, 4, 4);
  ellipse(x+41, y-130, 4, 4);

  /* Driekhoeken*/
  fill(255, 0, 0);
  triangle(x, y-110, x+5, y-120, x+10, y-110);
  triangle(x+40, y-110, x+45, y-120, x+50, y-110);
  triangle(x+10, y-110, x+15, y-120, x+20, y-110);
  triangle(x+20, y-110, x+25, y-120, x+30, y-110);
  triangle(x+30, y-110, x+35, y-120, x+40, y-110);


  /*mond*/
  fill(0);
  rect(x+10, y-75, 30, 10);
  fill(255);
  rect(x+14, y-75, 4, 5);
  rect(x+20, y-75, 4, 5);
  rect(x+26, y-75, 4, 5);
  rect(x+32, y-75, 4, 5);
  rect(x+11, y-70, 4, 5);
  rect(x+17, y-70, 4, 5);
  rect(x+23, y-70, 4, 5);
  rect(x+29, y-70, 4, 5);
  rect(x+35, y-70, 4, 5);

  /*Lichaam invulling*/
  fill(39, 139, 10);
  rect(x+15, y-50, 6, 3);
  rect(x+30, y-45, 2, 8);
  rect(x+17, y-37, 5, 7);
}

void move(){
    if (keyPressed) {
      //  if (keyCode == CODED){
      if (keyCode == LEFT) {
        monster1.x -= monster1.speed;
      }
      if (keyCode == RIGHT) {
        monster1.x += monster1.speed;
      }
     y = 500;
  }
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
    img = loadImage("Spaceship.png");
  }
  void drawEnemy(){
   image(img, x, y, 75, 75);
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
    
      y = -20;
      }
      else {collided = false;
      }

    }
}




