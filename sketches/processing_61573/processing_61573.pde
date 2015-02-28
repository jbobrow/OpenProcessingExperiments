
int score, level, lives, xCor, yCor, i;
boolean play;
Circle[][] circles = new Circle[1][4];

void setup() {
  size(400, 200);
  background(255);
  frameRate(3);
  smooth();
  score = 0;
  level = 1;
  lives = 5;
  fill(0,255,100);
  textSize(20);
  text("Whack them! You know what to do! :)" , 30, 80);
  textSize(40);
  text("START!", 125, 140);
  textSize(20);
  text("by pressing ENTER", 100, 170);
}

void keyPressed() {
  if (keyCode == ENTER) {
    keyCode = ESC;
    background(255);
    play = true;
    fillStart();
    for (int i = 0 ; i <= 5 ; i++) 
      insertCircle();
    //drawCircle(int(random(0,1.1)), int(random(0,4.1)));
  }
}

void mousePressed() {
  xCor = mouseX;
  yCor = mouseY;
}

void draw() {
  if (lives == 0) {
    play = false;
    gameover();
  }
  
    
  if (play) {
    //lives--;
    //score++;
    //for (int i = 0 ; i < circles.length ; i++) {
     //for (int j = 0 ; j < circles[0].length ; j++) {
        //if (circles[i][j].isPresent())
          
      //}
    //}
  
    background(255);
    fill(0);
    textSize(20);
    text("Level: " + level, 10, 30);
    text("Score: " + score, 150, 30);
    text("Lives: " + lives, (width/2) + 110, 30);
    fill(255,0,0);
    textSize(15);
    text("Left click on the center of the circle to whack it ", 50, 60);
    drawCircle(200,100);
    
    if (whackSuccess()) {
      score++;
      background(255);
    }
      //background(255);
      //drawCircle(int(random(0,1.1)),int(random(0,4.1)));
    else 
      i++;
    if (i == 3) {
      //background(255);
      lives--;
      drawCircle(100,150);
      i = 0;
    }
  }
}

void fillStart() {
  for (int i = 0 ; i < circles.length ; i++) {
    for (int j = 0 ; j < circles[0].length ; j++) 
      circles[i][j] = new Circle();
  }
}

void insertCircle() {
  int a = (int)(Math.random() * circles.length);
  int b = (int)(Math.random() * circles[0].length);
    if (!circles[a][b].isPresent()) {
      circles[a][b].setPresent();
    }
}

void drawCircle(int a, int b) {
  fill(0,0,255);
  stroke(5);
  ellipse(a,b,50,50);
}

boolean whackSuccess() {
  if( xCor != 0 && yCor != 0 ) {
    if (xCor <= 220 && xCor >= 180 && yCor <= 120 && yCor >= 80) {
      xCor = 0;
      yCor = 0;
      return true;
    }
  }
  return false;
}

void gameover() {
  background(255);
  fill(0);
  textSize(30);
  text("Your total score: " + score, 60, 100);
  textSize(15);
  text("Game over!! Click ENTER to play again!", 60, 140);
  if (keyCode == ENTER) {
    keyCode = ESC;
    play = true;
    background(255);
    score = 0;
    lives = 5;
    fillStart();
    for (int i = 0 ; i <= 5 ; i++) 
      insertCircle();
  }
}

class Circle {
  int lifespan, cirX, cirY;
  boolean whacked, present;
  
  boolean isWhacked() {
    return whacked;
  }
  void whack() {
    whacked = true;
  }
  boolean isPresent() {
    return present;
  }
  void setPresent() {
    present = true;
  }
}



