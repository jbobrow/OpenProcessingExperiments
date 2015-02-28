
//MovingCircle circle;
//Box obstacles;
int speed;
float time = 0;
int Timer;
int screenNumber;
float i = 0;
int x, y;
boolean upwards, downwards;
Box[] a;


void setup() {
  size(600, 600);
  x = width/3;
  y = height/4;
  frameRate(60);


  screenNumber = 0;

  //circle = new MovingCircle(20, 30, 50);
}
void draw() {
  fill( 0, 0, 0); //shapes will have a color inside of them, this color
  background(200); //black background
  //stroke(0); //outlines and lines will be white
  smooth();
  textSize(45);

  //need objects such as new Box(???);

  if (screenNumber == 0) {
    startMenu();
    a = new Box[100];
    for (int b = 0; b < a.length; b++) {
      a[b] = new Box();
    }
  }
  else if (screenNumber == 1) {
    showScores();
    drawCharacter();
    moveCharacter();
    for(int b = 0; b < a.length; b++) {
    a[b].makeBox();
    }
    //if hit go to next screen number
  }
  else if (screenNumber == 2) {
    endGameMenu();
  }
}
void keyPressed() {
  //System.out.println(keyCode);
  if ( keyCode == 87) {
    upwards = true;
  }
  if (keyCode == 83) {
    downwards = true;
  }
}
void keyReleased() {
  if (keyCode == 87) {
    upwards = false;
  }
  if (keyCode == 83) {
    downwards = false;
  }
}

void drawCharacter() {
  ellipse(x, y, 25, 25);
}
void moveCharacter() {
  speed = 5;
  if (upwards) {
    y -= speed;
  }
  if (downwards) {
    y += speed;
  }
}
class Box {

  void makeBox() {
    fill(0);
    rect(20, 20, 20, 20);//need to have random locations
    //need to make variables that equal random.
  }
}

void startMenu() {
  fill(255, 140, 0);
  text("Evade", 0, 50);
  fill( 0, 0, 205);
  text("Press space to start", 0, 300);
  if (keyCode == ' ')
  {
    screenNumber = 1;
    Timer = Timer + 40;
  }
}
void endGameMenu() {
  //if hit. stop the timer and print the score
  text("Your score is " + Timer, 0, 400);
}

void showScores()
{
  textSize(30);
  Timer = Timer + 40;//40
  text("Score: " + Timer, 0, 600);
}
public boolean collide() {
  return false;
}
//also need a restart method



/*
  PVector moveVector = new PVector(0, 0);
 switch (key) {
 case 'w':
 case('W'):
 System.out.println(keyCode);//87 is key number
 y = y + 100;
 moveVector.y = -MOVE_INCREMENT;
 break;
 case 's':
 case('S'):
 y = y - 100;
 System.out.println(keyCode); //83 is key number
 moveVector.y = MOVE_INCREMENT;
 break;
 }
 circle.move(moveVector);
 }
 class MovingCircle {
 PVector loc;
 float radius;
 
 public MovingCircle(int r, int x, int y) {
 radius = r;
 loc = new PVector(x, y);
 }
 public void move(PVector moveVector) {
 loc.add(moveVector);
 
 if (collide() ) {
 screenNumber = 2;
 }
 }
 }
 
 //void lose() {
 
 //}
 //need to know where the box lives
 //and how the box need to know there location
/*
 void boundary() {
 // xpos = xpos + ( xspeed * xdirection ); 
 //ypos = ypos + ( yspeed * ydirection );
 }
 void move() {
 }
 void start() {
 }
 */

