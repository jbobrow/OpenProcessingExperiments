
int DirX = 1;//the boundaries of the board
int DirY = 1;
int rad = 10; //radius of the ball
int p1score = 0;
int p2score = 0;
float posX, posY;
float speedX = 2; //speed of the moving ball
float speedY = 2;
PFont font;
PVector rightpaddle = new PVector(10, 100);
PVector leftpaddle = new PVector(590, 100);

void setup() {
  size(600, 400);
  background(0);
  font = createFont("Calibri", 16, true);
  smooth();
  posX = width/2;
  posY = height/2;
}

void draw() {

  //line in the middle
  background(255);
  strokeWeight(5);
  line(width/2, 0, width/2, height);

  if ( posX >= 590) {
    posX = width/2;
    posY = height/2;
    p2score= p2score + 1;
  }

  if ( posX <= 10) {
    posX = width/2;
    posY = height/2;
    p1score= p1score + 1;
  }

  //Score of player 1 and player 2
  background(255);
  textFont(font);
  fill(0);
  textAlign(LEFT);
  text("Player 2 score: " + p2score, width/5, 30);
  textAlign(RIGHT);
  text("Player 1 score: " + p1score, width-100, 30);

  //paddle 2
  stroke(140, 0, 180);
  strokeWeight(2);
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(leftpaddle.x, leftpaddle.y, 20, 70);

  float paddle_y = constrain(leftpaddle.y, 20, height - 70);
  float py = width - 20 - rad;
  if ( posX == py && posY > paddle_y - 70 - rad
    && posY < paddle_y + 70 + rad ) {
    DirX *= -1;
  } 
  //paddle 1
  stroke(140, 0, 180);
  strokeWeight(2);
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(rightpaddle.x, rightpaddle.y, 20, 70);

  if ( posX > rightpaddle.x && posX < rightpaddle.x + 20 && posY > rightpaddle.y
    && posY < rightpaddle.y + 70) {
    DirX *= -1;
  }
  //line in the middle
  strokeWeight(5);
  line(width/2, 0, width/2, height);

  //moving ball
  ellipseMode(RADIUS);
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(posX, posY, rad, rad);
  posX = posX + ( speedX * DirX );
  posY = posY + ( speedY * DirY );

  if (posX > width - rad || posX < rad) {
    DirX *= -1;
  }

  if (posY > height - rad || posY < rad) {
    DirY *= -1;
  }
}  

void keyPressed() {
  if (key == 'w' || key == 'W') {
    if ( rightpaddle.y >= 40) 
      rightpaddle.y -= 10;
  }
  if (key == 's' || key == 'S') {
    if ( rightpaddle.y <= height - 40)
      rightpaddle.y += 10;
  }
  if (keyCode == UP) {
    if (leftpaddle.y >= 40)
      leftpaddle.y -= 10;
  }
  if (keyCode == DOWN) {
    if (leftpaddle.y <= height - 40)
      leftpaddle.y += 10;
  }
}

