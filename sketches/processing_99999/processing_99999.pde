
/*
TO DO
 -------
 1. Modify collision
 a. make circles change color after triangle touches them
 
 2. Fix end screen and pause screen
 a. move rectangle
 b. check parameters to click START OVER
 i. clicked --> start a new game 
 
 3. After certain time, circles eventually stop runnning for a long time
 
 4. MAKE END SCREEN POP UP WHEN YOU HAVE 0 LIVES
 =================================================================================================
 DONE
 ----------
 1. Keep track of points
 a. as circles move offscreen to the left, increase points by 2(?)
 b. show points counter
 
 2. Make a pause screen
 a. Show this instead of start screen when paused
 */
boolean startGame = false;
boolean endGame = false;
boolean restartGame = false; 
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Triangle playerTriangle;
int tspeed = 10;
int lives = 5;
int points = 0;

void setup() {
  smooth();
  size(800, 300);
  background(0, 150, 0);
  //three coordinates for making the triangle
  int x1 = 0;
  int y1 = 140;
  int x2 = 0;
  int y2 = 162;
  int x3 = 50;
  int y3 = 150;
  playerTriangle = new Triangle(x1, y1, x2, y2, x3, y3);
  for (int i = 0; i < 80; i++) {
    Obstacle a = new Obstacle((int)(random(810, 2300)), (int)(random(0, 800)), 20, 20);
    obstacles.add(a);
  }
}
void draw() {
  if (lives == 0) {

    background(152, 251, 152 );
    textSize(40);
    fill(0, 0, 0);
    text("Oh no! You lost!", 240, 140);
    fill(255, 255, 255); 
    rect(343.0, 190.0, 200.0, 40.0);
    textSize(30);
    fill(255, 0, 0);
    text("START OVER", 350, 220);
    System.out.println("" + mouseX);
    System.out.println("" + mouseY); 
    if (mouseX <= 543 && mouseX >= 343 && mouseY <= 240 && mouseY >= 190) {
      if (mousePressed && mouseButton == LEFT) {
        System.out.println("try to restart"); 
        startGame = true;
        lives = 5; 
        points = 0;
        playerTriangle.x1 = 0; 
        playerTriangle.y1 = 140;
        playerTriangle.x2 = 0; 
        playerTriangle.y2 = 162;
        playerTriangle.x3 = 50; 
        playerTriangle.y3 = 150;
        obstacles = new ArrayList<Obstacle>(); 
        for (int i = 0; i < 80; i++) {
          Obstacle a = new Obstacle((int)(random(810, 2300)), (int)(random(0, 800)), 20, 20);
          obstacles.add(a);
        }
      }
    }
    //endGame = true;

    //System.out.println("game over"); 
    return;
  }

  //start screen
  if (!startGame) {
    background(255, 255, 0);
    textSize(50);
    fill(0, 0, 0);
    text("Mandatory CS Final", 150, 110);
    textSize(30);
    fill(0, 0, 0);
    text("Click play to start", 250, 150);
    fill(255, 255, 255);
    rect(310.0, 180.0, 150.0, 60.0);
    textSize(30);
    fill(255, 0, 0);
    text("PLAY", 350, 220);
    if (mouseX >= 310 && mouseX <= 460 && mouseY >= 180 && mouseY <= 240) {
      if (mousePressed && mouseButton == LEFT) {
        startGame = true;
      }
    }
    return ;
  }
  //game is running!
  else if (lives > 0) {
    background(0, 150, 0);
    fill(255, 255, 255);
    fill(255, 255, 0);
    textSize(25);
    fill(255, 255, 0);
    textSize(25);
    text("Lives: " + lives, 20, 280);
    fill(255, 255, 0);
    textSize(25);
    text("Points: " + points, 300, 280);
    //check if the triangle collided with a circle
    for (int i = 0; i < obstacles.size(); i++) {
      Obstacle o1 = obstacles.get(i);
      if (o1.isCollision(o1.posX, o1.posY, playerTriangle.x3, playerTriangle.y3, 20) == true) {
        lives--;
        //counts lives
        fill(255, 255, 0);
        textSize(25);
        text("Lives: " + lives, 20, 280);
        //figure out a way to change the color when hit instead of remove
        obstacles.remove(o1);
      }
    }
    //increase points as circles go off screen
    for (int i = 0; i < obstacles.size(); i++) {
      Obstacle away = obstacles.get(i);
      if (away.posX < 0) {
        System.out.println("plus points");
        points += 2;
        fill(255, 255, 0);
        textSize(25);
        text("Points: " + points, 300, 280);
      }
    }
  }

  //makes yellow triangle at left egde of screen
  fill(255, 255, 0);
  playerTriangle.display();
  for (int i = 0; i < obstacles.size() ; i++) {
    if (obstacles.get(i).posX > 0) {
      obstacles.get(i).display();
    }
    else if (obstacles.get(i).posX < 0) {
      obstacles.remove(i);
      //must add new obstacle(s)!
      Obstacle a = new Obstacle((int)(random(900, 2300)), (int)(random(0, 800)), 20, 20);
      obstacles.add(a);
    }
  }
  if (endGame) {
    startGame = true;
  }
}
void keyPressed() {
  if (key == CODED) {
    //right arrow key pressed
    if (keyCode == RIGHT) {
      playerTriangle.shiftRight();
    }
    //left arrow key pressed and cannot go off screen
    else if (keyCode == LEFT) {
      playerTriangle.shiftLeft();
    }
    //up arrow key pressed and cannot go off screen
    else if (keyCode == UP) {
      playerTriangle.shiftUp();
    }
    //down arrow key pressed and cannot go off screen
    else if (keyCode == DOWN) {
      playerTriangle.shiftDown();
    }
  }
}
public class Triangle {
  float x1, y1, x2, y2, x3, y3;
  public Triangle() {
  }
  public void render() {                                                                 
    fill(255, 0, 0);
    beginShape();
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    endShape();
  }
  Triangle(int a1, int b1, int a2, int b2, int a3, int b3) {
    x1 = a1;
    y1 = b1;
    x2 = a2;
    y2 = b2;
    x3 = a3;
    y3 = b3;
  }
  void display() {
    triangle(x1, y1, x2, y2, x3, y3);
  }
  public void shiftRight() {
    if (x3 < 800) {
      x1 += tspeed;
      x2 += tspeed;
      x3 += tspeed;
    }
  }
  public void shiftLeft() {
    if (x1 > 0 && x2 > 0) {
      x1 -= tspeed;
      x2 -= tspeed;
      x3 -= tspeed;
    }
  }
  public void shiftUp() {
    if (y1 > 10) {
      y1 -= tspeed;
      y2 -= tspeed;
      y3 -= tspeed;
    }
  }
  public void shiftDown() {
    if (y2 < height - 10) {
      y2 += tspeed;
      y1 += tspeed;
      y3 += tspeed;
    }
  }
}
public class Obstacle {
  int posX;
  int posY;
  int radius1 = 20;
  int radius2 = 20;
  int speed = 4;
  Obstacle(int x, int y, int r1, int r2) {
    posX = x;
    posY = y;
    radius1 = r1;
    radius2 = r2;
  }
  void move() {
    posX -= speed;
  }
  void display() {
    move();
    ellipseMode(CENTER);
    fill(0, 0, 255);
    ellipse(posX, posY, radius1, radius2);
  }
  public int getRadius1() {
    return radius1;
  }
  public int getRadius2() {
    return radius2;
  }
  /*from Tyler Kong's circle_collision boolean
   START
   */
  boolean isCollision(float ptx3, float pty3, float cx, float cy, float rad1) {
    if (dist(ptx3, pty3, cx, cy) <= rad1) {
      return true;
    }
    return false;
  }
  /* from Tyler Kong's circle_collision boolean
   END
   */
}


