
Paddle paddle1;
Paddle paddle2;
int elements = 100 ;
Ball ballarray[] = new Ball[elements];
int score1 = 0;
int score2 = 0;
int speed = 5;
 
void someone_scored (Ball myball) {
  myball.x = width / 2;
  myball.y = height / 2;
  myball.deltax = 0;
  myball.deltay = 0;
}
 
void player_one_scored (Ball myball) {
  score1 += 1;
  someone_scored (myball);
}
 
void player_two_scored (Ball myball) {
  score2 += 1;
  someone_scored (myball);
}
 
 
void setup() {
  size(400, 400);
 
  paddle1 = new Paddle (20, height /2 );
  paddle2 = new Paddle (width - 20, height /2);
  
    
  for (int i = 0; i < elements ; i++ )
    ballarray[i] = new Ball(width / 2, height / 2, cos(i), sin(i)); 
 
  PFont myFont;
  myFont = createFont ("Courier", 40);
  textFont(myFont);
}
class Paddle {
  float x = 0;
  float y = 0;
  float pwidth = 10;
  float pheight = 40;
  int direction = 0;
 
  Paddle( float givenx, float giveny ) {
    x = givenx;
    y = giveny;
  }
  void draw() {
    noStroke();
    rectMode(CENTER);
    rect(x, y, pwidth, pheight);
  }
  void move() {
    y = y + direction;
    if (y < 40) {
      y = y - direction;
    }
    else if ( y > height-40) {
      y = y - direction;
    }
  }
}
 
 
class Ball {
 
  float x = 0, y = 0;
  float bwidth = 6, bheight = 6;
  float deltax = random(-3, 3);
  float deltay = random(-3, 3);
 
  Ball(float givenx, float giveny, float dx, float dy) {
    x = givenx;
    y = giveny;
    deltax = dx;
    deltay = dy;
  }
 
  void draw() {
    noStroke();
    rectMode(CENTER);
    rect(x, y, bwidth, bheight);
  }
 
  void move() {
 
    if ( y <= 0 || y >= height )
      deltay = 0 - deltay; // or deltay *= -1;
 
    if ( x <= 0)
      player_two_scored(this);
 
    if ( x >= width)
      player_one_scored(this);
 
    if ( x - bwidth <= (paddle1.x + paddle1.pwidth/2) ) {
      if ( y <= paddle1.y + paddle1.pheight/2  && y >= paddle1.y - paddle1.pheight/2 )
      {     
        deltax = 0 - deltax;
      }
    }
     
    if ( x + bwidth >= (paddle2.x - paddle2.pwidth/2) ) {
      if ( y <= paddle2.y + paddle2.pheight/2  && y >= paddle2.y - paddle2.pheight/2 )
      {     
        deltax = 0 - deltax;
      }
    }
     
     
    x = x + deltax;
    y = y + deltay;
  }
}
 
void keyPressed() {
 
  if ( key == 'w' ) {
    println("player 1 up");
    paddle1.direction = 0 - speed;
  }
  else if (key == 's') {
    println ("player 1 down");
    paddle1.direction = speed;
  }
  else if (key == '5' ) {
    println("player 2 up");
    paddle2.direction = 0 - speed;
  }
  else if (key == '2') {
    println("player 2 down");
    paddle2.direction = speed;
  }
}
 
void keyReleased() {
 
  if ( key == 'w' ) {
    println("player 1 stop");
  }
  else if (key == 's') {
    println ("player 1 stop");
  }
  else if (key == '5' ) {
    println("player 2 stop");
  }
  else if (key == '2') {
    println("player 2 stop");
  }
}
 
void drawNet() {
  for (int i = 0; i < height; i += 10) {
    rect(width/2, i, 1, 5);
  }
}
 
void drawScore() {
  textSize(80);
  textAlign(CENTER);
  text(score1, width/4, 80);
  text(score2, width*3/4, 80);
}
 
void draw() {
  background(0);
  
  

    
  paddle1.draw();
  paddle1.move();
  paddle2.draw();
  paddle2.move();

 
 
  for ( int i = 0; i < elements; i ++ )
  {
    ballarray[i].draw();
    ballarray[i].move();
  }
 
  //draw net
  drawNet();
  drawScore();
}

