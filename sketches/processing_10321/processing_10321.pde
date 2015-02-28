
boolean yIncrease, yDecrease, xIncrease, xDecrease, rectLeft, rectRight, deflect;
int page = 1;
int x, y, a, instantValue;
float ballX = 10;
float ballY = 10;
float speed = 2;
int directionX = 1;
int directionY = 1;
int radius = 8;
int rectWidth = 35;

PFont font;

Food food = new Food();
You you = new You();

void setup() {
  size(480, 320);
  ellipseMode(RADIUS);
  rectMode(CENTER);
  smooth();
  noStroke();
  x = width/4;
  y = height - 30;
  font = loadFont("Krungthep-28.vlw");
  textFont(font);
  ballX = 10;
  ballY = 10;
  speed = 2;
  directionX = 1;
  directionY = 1;
}

void draw() {
  if(page == 1){
    pageOne();
  }
  else if(page == 2){
    pageTwo();
  }
  else if(page == 4){
    pageFour();
  }
  else if(page == 3){
    fill(22, 26, 41);
    rect(width/4, height/2, width/2, height);
    fill(74, 80, 87);
    rect(width*3/4, height/2, width/2, height);

    //right side
    food.eat();
    food.timer();
    food.display();
    you.update();
    you.display();
    //left side
    if(rectLeft == true && x > rectWidth/2) {
      x = x - 4;
    }
    else if(rectRight == true && x < width/2 - rectWidth/2) {
      x = x + 4;
    }
    a = constrain(x, rectWidth/2, width/2 - rectWidth/2);
    fill(145, 9, 48);
    rect(a, y, rectWidth, 10);
    speed = speed + 0.0007;
    ballX = ballX + speed * directionX;
    ballY = ballY + speed * directionY;
    if(ballX < radius || ballX > width/2 - radius) {
      directionX = directionX * -1;
    }
    if(dist(ballX, ballY, a, y) < 19 && ballY > y - 13) {
      deflect = true;
    } 
    else {
      deflect = false;
    }
    if(ballY < radius) {
      directionY = directionY * -1;
    }
    if(ballY > y - 13 && deflect == true) {
      directionY = directionY * -1;
    }
    if(ballY > y + 40 && deflect == false){
      page = 4;
    }
    fill(234, 107, 47);
    ellipse(ballX, ballY, radius, radius);
  }
}

//right side
class Food {
  float randomValueX = 300;
  float randomValueY = 100;
  int dimension = 20;
  String countDown;
  boolean instantValueBoolean;

  Food() {
  }

  void timer() {
    if(instantValueBoolean == true) {
      instantValue = millis() / 1000;
    }
    int timer = millis() / 1000;
    int count = 5 + instantValue - timer;
    countDown = "" + count;
    if(count < 0) {
      page = 4;
    }
    println(instantValue);
  }


  void randomize() {
    randomValueX = random(width/2 + 10, width - 10);
    randomValueY = random(10, height - 10);
  }

  void eat() {
    if(dist(you.x2, you.y2, food.randomValueX, food.randomValueY) < dimension/2 + you.radius) {
      randomize();
      instantValueBoolean = true;
    }
    else {
      instantValueBoolean = false;
    }
  }

  void display() {
    fill(145, 9, 48);
    rect(randomValueX, randomValueY, dimension, dimension);
    textAlign(CENTER);
    textSize(12);
    fill(234, 212, 172);
    text(countDown, randomValueX, randomValueY + 5);
  }
}

class You {
  int radius = 10;
  int x2 = 300;
  int y2 = 100;
  int xPos, yPos;

  You() {
  }

  void update() {
    if(yIncrease == true && y2 < height - radius) {
      y2 = y2 + 4;
    }
    if(yDecrease == true && y2 > radius) {
      y2 = y2 - 4;
    }
    if(xIncrease == true && x2 < width - radius) {
      x2 = x2 + 4;
    }
    if(xDecrease == true && x2 > width/2 + radius) {
      x2 = x2 - 4;
    }
  }

  void display() {
    fill(234, 107, 47);
    xPos = constrain(x2, width/2 + radius, width - radius);
    yPos = constrain(y2, radius, height - radius);
    ellipse(xPos, yPos, radius, radius);
  }

}

void keyPressed() {
  if(page == 3){
    if(keyCode == UP) {
      yDecrease = true;
    }
    if(keyCode == DOWN) {
      yIncrease = true;
    }
    if(keyCode == RIGHT) {
      xIncrease = true;
    }
    if(keyCode == LEFT) {
      xDecrease = true;
    }
    //left side
    if(key == 'a' && x > rectWidth/2) {
      rectLeft = true;
    } 
    if(key == 'd' && x < width/2 - rectWidth/2) {
      rectRight = true;
    }
  }
  else if(page == 1 && key == ' '){
    page = 2;
  }
  else if(page == 4 || page == 2 && key == ' '){
    page = 3;
    instantValue = millis() / 1000;
    setup();
  }

}

void keyReleased() {
  //right side
  if(keyCode == UP) {
    yDecrease = false;
  }
  if(keyCode == DOWN) {
    yIncrease = false;
  }
  if(keyCode == RIGHT) {
    xIncrease = false;
  }
  if(keyCode == LEFT) {
    xDecrease = false;
  }
  //left side
  if(key == 'a') {
    rectLeft = false;
  }
  else if(key == 'd') {
    rectRight = false;
  }
}

void pageFour(){
  fill(234, 212, 172);
  rect(240, 160, 480, 320);
  fill(39, 47, 77);
  textSize(28);
  text("GAME OVER.", 240, 160);
  textSize(12);
  text("HIT THE SPACEBAR TO TRY AGAIN", 240, 200);
}

void pageOne(){
  background(234, 212, 172);
  fill(39, 47, 77);
  noStroke();
  textSize(18);
  text("THE OBJECT OF THE GAME", 200, 40);
  text("IS TO MULTITASK.", 200, 60);
  text("THE LEFT SCREEN IS TASK", 200, 100);
  text("ONE. USE KEYS 'A' AND 'D'", 200, 120);
  text("TO SLIDE THE BAR AND KEEP", 200, 140);
  text("THE BALL IN THE FRAME.", 200, 160);
  text("THE BALL WILL SLOWLY GAIN", 200, 180);
  text("SPEED AS THE GAME GOES ON.", 200, 200);
  textSize(12);
  text("HIT THE SPACEBAR TO CONTINUE", 200, 300);
  text("BALL", 85, 105);
  text("YOU", 95, 180);
  fill(234, 107, 47);
  ellipse(70, 100, radius, radius);
  fill(145, 9, 48);
  rect(70, 175, rectWidth, 10);

}

void pageTwo(){
  background(234, 212, 172);
  fill(39, 47, 77);
  noStroke();
  textSize(18);
  text("ON THE RIGHT SIDE", 200, 40);
  text("IS TASK TWO.", 200, 60);
  text("USE THE ARROW KEYS", 200, 100);
  text("TO MOVE AROUND AND EAT", 200, 120);
  text("THE PINK SQUARES", 200, 140);
  text("BEFORE THE TIMER RUNS OUT.", 200, 160);
  text("EACH SQAURE HAS 5 SECONDS.", 200, 180);
  text("IF YOU LOSE THE BALL", 200, 200);
  text("OR DON'T EAT THE SQUARE", 200, 220);
  text("IT'S GAME OVER.", 200, 260);
  textSize(12);
  text("HIT THE SPACEBAR TO START", 200, 300);
  text("FOOD", 90, 105);
  text("YOU", 90, 185);
  fill(145, 9, 48);
  rect(70, 100, 20, 20);
  fill(234, 212, 172);
  text("5", 67, 105);
  fill(234, 107, 47);
  ellipse(70, 180, 10, 10);
}



