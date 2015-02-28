
int x = 0;
int y = 10;
int x2 = 50;
int y2 = 50;
int b5;
int b4;
int b3;
int b2;
int b1;
int dx = 0;
int dy = 15;
float xRand;
float yRand;
int ball_radius;
snake[] Snake = new snake[100];
int numSnakes = 3;
PImage Snakefood;
PImage SnakePic;
boolean paused = false;
void setup() {

  size(300, 300);
  frameRate(10);
  smooth();

  Snake[0] = new snake(150, 150);
  Snake[1] = new snake(134, 150);
  Snake[2] = new snake(118, 150); 

  xRand = random(width);
  yRand = random (height);

  ball_radius = 10;
  Snakefood = loadImage("imgres.jpeg");
  SnakePic = loadImage("Snake.jpeg");
}

void draw() {
  if (paused == false) {
    background(255);
    // Snake.moveSnake();
    //fill(0);
    //ellipse(xRand, yRand, ball_radius, ball_radius);

// if (Snake[0].xs = Snake[1].xs && Snake[0].ys = Snake[1].ys) {
    if (keyPressed==true && keyCode == DOWN && dy != -15) {
      dx = 0;
      dy = 15;
      println("Down");
    }
    if (keyPressed==true && keyCode == UP && dy != 15) {
      dx = 0;
      dy = -15;
      println("Up");
    }
    if (keyPressed==true && keyCode == LEFT && dx !=15) {
      dx = -15;
      dy = 0;
      println("Left");
    }
    if (keyPressed==true && keyCode == RIGHT && dx !=-15) {
      dx = 15;
      dy = 0;
      println("Right");
    }
    if (key == ' ') {
      dx = 0;
      dy = 0;
      println("Stop");
    }
    image(Snakefood, xRand, yRand, 10, 10);
    for (int i = numSnakes - 1; i>=0; i--) {
      Snake[i].moveSnake(i);
    }
    for (int i = numSnakes - 1; i > 0; i--) {
      //if (Snake[0].xs > Snake[i].xs + 1 && Snake[0].xs > Snake[i].xs - 1 ){
      if ((Snake[0].xs > Snake[i].xs - 14 && Snake[0].xs < Snake[i].xs + 14) && (Snake[0].ys > Snake[i].ys - 14 && Snake[0].ys < Snake[i].ys+14)) {      
        textSize(32);
        fill(0);
        text("You Lose D:", 75, 150);
        println("You Lose");
        textSize(16);
        fill(0);
        text("Click to Restart", 100, 175);
        paused = true;
      }
      if (numSnakes == 30) {
        textSize(32);
        fill(0);
        text("Congratulations!", 25, 150);
        println("CONGRATULATIONS! YOU WIN!!!");
        textSize(32);
        fill(0);
        text("You Win!!!", 75, 180);
        textSize(16);
        fill(0);
        text("Click to Restart", 100, 200);
        paused = true;
      }
    }
  }
  if (mousePressed) {
    paused = false;
    numSnakes = 3;
  }
}
class snake {
  int xs;
  int ys;
  float distance;

  snake(int xsIn, int ysIn) {
    xs = xsIn;
    ys = ysIn;
  }
  void moveSnake(int index) {
    
      if ((Snake[0].xs > xRand-15 && Snake[0].xs < xRand+10) && (Snake[0].ys > yRand-15 && Snake[0].ys< yRand+10)) {
        xRand = random(width);
        yRand = random (height);
        Snake[numSnakes] = new snake(xs, ys) ;
        numSnakes++;
      }

      if (index == 0) {
        xs = xs + dx;
        ys = ys + dy;
      } else {
        xs = Snake[index-1].xs;
        ys = Snake[index-1].ys;
      }
      image(SnakePic, xs, ys, 15, 15);
      if (Snake[0].xs < 0) {
        Snake[0].xs = 300;
      }
      if (Snake[0].xs > 300) {
        Snake[0].xs = 0;
      }
      if (Snake[0].ys < 0) {
        Snake[0].ys = 300;
      }
      if (Snake[0].ys > 300) {
        Snake[0].ys = 0;
      }
      //  fill(225, 225, 225);
      //ellipse(xs, ys, 15, 15);
    }
  
}
/*class Obstacles {
 void obstacles() {
 fill(0);
 rect(0, 200, 200, 30);
 fill(0)
 rect(0,400, */


