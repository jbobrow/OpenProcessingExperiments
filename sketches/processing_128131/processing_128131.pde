
//Snake game
//Ryan Beattie, Ryan Willoughby
 
 
int gameSpeed;
 
boolean [] kDown; 
boolean [] kHit; 
 
int score;
 
int xPickup, yPickup;
 
Snake player1;
 
void setup() {
  size(700, 700);
   
  gameSpeed = 5;
   
  kDown = new boolean[256]; 
  kHit = new boolean[256]; 
   
  for (int i = 0; i < 30; i++) {
    addPickup(int(random((width / 20) - 1)) * 20, int(random((height / 20) - 1)) * 20, 20, 20);
  }
   
  score = 0;
   
  player1 = new Snake(0, 20, 20, 20, 1, "right");
}//setup
 
void keyPressed() {            // Called automatically. Custom keyPressed event.
  int kCode = keyCode;
  kDown[kCode] = true;
}//keyPressed
 
void keyReleased() {          // Called automatically. Custom keyReleased event.
  int kCode = keyCode;
  kDown[kCode] = false;
  kHit[kCode] = false;
}// keyReleased
 
boolean keyDown(int k) {      // Returns True or False when called.
  return kDown[k];
}//keyDown
 
boolean keyHit(int k) {       // Returns True or False when called.
  boolean result;
   
  if (kDown[k] == true && kHit[k] == false) {
    kHit[k] = true;
    result = true;
  }
  else {
    result = false;
  }
   
  return result;
}//keyHit
 
void update() {         
  if (!pickupsExist()) {    //End game if no more pickups exist.
    exit();
  }
   
  for (int i = 0; i < gameSpeed; i++) {
    //Game logic here.
    playerInput();
    player1.update();
  }
}//update
 
void draw() {
  update();
  background(0, 220, 0);
  
   
  fill(255);
  text("Score: " + score, 0, 10);
  drawPickups();
  player1.draw();
  delay(1);
}//draw
 
void playerInput() {
  if (keyHit(UP) && player1.direction != "down") {
    player1.setDirection("up");
  }
   
  if (keyHit(RIGHT) && player1.direction != "left") {
    player1.setDirection("right");
  }
   
  if (keyHit(DOWN) && player1.direction != "up") {
    player1.setDirection("down");
  }
   
  if (keyHit(LEFT) && player1.direction != "right") {
    player1.setDirection("left");
  }
}//playerInput

class Actor {//A general class that can be the template for most objects in the game.
  int x, y;  //Block-coordinates. These update based on the width and height of this class.
  int w, h;  //Size of this class.
  int xTween, yTween;  //These do the catching-up between block-coordinates movement and are the actual coordinates of the graphics.
   
  public Actor(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.xTween = x;
    this.yTween = y;
  }//Actor constructor
}//Actor
 
void removeActor(Actor a) {
   
}

boolean collided(Actor a, Actor b) {
  boolean isCollided = false;
   
  if (a.xTween > (b.xTween - a.w) && a.xTween < (b.xTween + b.w)) {
    if (a.yTween > (b.yTween - a.h) && a.yTween < (b.yTween + b.h)) {
      isCollided = true;
    }
  }
   
  return isCollided;
}

ArrayList pickups;
 
void addPickup(int x, int y, int w, int h) {
  if (pickups == null) {
    pickups = new ArrayList();
  }
   
  pickups.add(new Actor(x, y, w, h));
  return;
}
 
void removePickup(Actor a) {
   
}
 
boolean pickupsExist() {
  boolean exists = true;
   
  if (pickups.size() == 0) {
    exists = false;
  }
   
  return exists;
}
 
void drawPickups() {
  ellipseMode(CORNER);
  stroke(255, 0, 0);
  fill(255, 0, 0);
   
  for (int i = 0; i < pickups.size(); i++) {
    Actor pickup = (Actor) pickups.get(i);
    ellipse(pickup.x, pickup.y, pickup.w, pickup.h);
  }
}

class Snake {
  Actor head;
  ArrayList segments;
  String direction;
 
  public Snake(int x, int y, int segW, int segH, int tailLength, String direction) {
    this.direction = direction;
 
    head = new Actor(x, y, segW, segH);
    segments = new ArrayList();
 
    for (int i = 0; i < tailLength; i++) {
      segments.add(new Actor(x, y, segW, segH));
    }
  }//Snake constructor
 
  void setDirection(String direction) {
    this.direction = direction;
  }//setDirection
   
  void update() {
    //Make the head chase its own block movements.
    tween(head);
 
    for (int i = 0; i < segments.size(); i++) {//Make the tail parts chase their own block movements.
      Actor segment = (Actor) segments.get(i);
      tween(segment);
    }
 
    if (tweened(head)) {//If the head is lined-up with its own block movement then block-move every part.
      move();
    }
 
    for (int i = 0; i < pickups.size(); i++) {//Munch pickups.
      Actor pickup = (Actor) pickups.get(i);
 
      if (collided(head, pickup)) {
        score += 10;
         
        pickups.remove(i);
         
        Actor segment = (Actor) segments.get(segments.size() - 1);
        segments.add(new Actor(segment.x, segment.y, segment.w, segment.h));
      }
    }
     
    for (int i = 1; i < segments.size() - 1; i++) {//Kill self if you munch on your own tail.
      Actor segment = (Actor) segments.get(i);
       
      if (collided(head, segment)) {
        exit();
      }
    }
  }//update
 
  void move() {//Moves the parts of the snake in blocks.
    //Record the current block-coordinates of the head.
    int oldX = head.x;
    int oldY = head.y;
 
    //Block-move the head according to it's current direction.
    if (this.direction == "up") {
      head.y = head.y - head.h;
    }
 
    //And again.
    if (this.direction == "right") {
      head.x = head.x + head.w;
    }
 
    //And again.
    if (this.direction == "down") {
      head.y = head.y + head.h;
    }
 
    //And again.
    if (this.direction == "left") {
      head.x = head.x - head.w;
    }
 
    for (int i = 0; i < segments.size(); i++) {//Do-do-doOOoooo Come-on and do the conga. This is the bit where each segment chases the one in front of it.
      //Reference the current segment.
      Actor segment = (Actor) segments.get(i);
 
      //Make sure the actual coordinates obey the recorded block-coordinates, every time this method is called.
      segment.xTween = segment.x;
      segment.yTween = segment.y;
 
      //Record the current coordinates of the current segment.
      int currentX = segment.x;
      int currentY = segment.y;
 
      //Block-move the current segment to the coordinates of the previous segment or head, where applicable.
      segment.x = oldX;
      segment.y = oldY;
 
      //Store the current segment's coordinates which were recorded before it was block-moved.
      oldX = currentX;
      oldY = currentY;
    }
  }//move
 
  void tween(Actor a) {//Move part of the snake a tweenie little bit at a time, if it's not lined-up with its block-coordinates.
    if (a.y < a.yTween) {
      a.yTween--;
    }
 
    if (a.x > a.xTween) {
      a.xTween++;
    }
 
    if (a.y > a.yTween) {
      a.yTween++;
    }
 
    if (a.x < a.xTween) {
      a.xTween--;
    }
  }//tween
 
  boolean tweened(Actor a) {//Check if a part is lined-up with its block-coordinates.
    boolean isTweened = false;
 
    if (a.x == a.xTween && a.y == a.yTween) {
      isTweened = true;
    }
 
    return isTweened;
  }//tweened
 
    void draw() {
    ellipseMode(CORNER);
    stroke(0, 0, 100);
    fill(0, 0, 50);
 
    for (int i = segments.size() - 1; i >= 0; i--) {
      Actor segment = (Actor) segments.get(i);
      ellipse(segment.xTween, segment.yTween, segment.w, segment.h);
    }
 
    ellipseMode(CORNER);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(head.xTween, head.yTween, head.w, head.h);
  }//draw
}//Snake



