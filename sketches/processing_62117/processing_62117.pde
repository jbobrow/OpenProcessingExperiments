
int score, level, lives, xCor, yCor, number;
boolean play;
Circle[][] circles = new Circle[2][5];

void setup() {
  size(400, 170);
  background(255);
  frameRate(.5);
  smooth();
  number = 0;
  score = 0;
  level = 1;
  lives = 5;
  fill(0, 255, 100);
  textSize(40);
  text("Whack a Circle!", 90, 40);
  fill(136, 50, 215);
  textSize(20);
  text("Hit them! You know what to do! :)", 30, 80);
  textSize(30);
  text("START!", 125, 110);
  textSize(20);
  text("by pressing ENTER", 100, 145);
}

void keyPressed() {
  if (keyCode == ENTER) {
    keyCode = ESC;
    background(255);
    play = true;
    fillStart();
    for (int a = 0 ; a <= 5 ; a++) 
      insertCircle();
  }
}

void mousePressed() {
  xCor = mouseX;
  yCor = mouseY;
  //println(xCor + " " + yCor);
}

void draw() {
  if (lives <= 0) {
    play = false;
    gameover();
  }

  if (play) {
    background(255);

    //setting levels
    if (score >= 0 && score <= 7)
      level = 1;
    else if (score > 7 && score <= 14)
      level = 2;
    else if (score > 14)
      level = 3;

    //changing level framerates
    if (level == 1)
      frameRate(.5);
    else if (level == 2)
      frameRate(1);
    else if (level == 3)
      frameRate(3);

    while (number<5) {
      insertCircle();
    }
    
    //println("drawing circles");
    for (int i = 0 ; i < circles.length ; i++) {
      for (int j = 0 ; j < circles[0].length ; j++) {
        if (circles[i][j].present) {
          circles[i][j].drawCircle();
        }
      }
    }

    fill(0);
    textSize(20);
    text("Level: " + level, 10, 30);
    text("Score: " + score, 150, 30);
    text("Lives: " + lives, (width/2) + 110, 30);
    
    //println("checking for whack successes");
    for (int i = 0 ; i < circles.length ; i++) {
      for (int j = 0 ; j < circles[0].length ; j++) {
        if (circles[i][j].present) {     
          if (circles[i][j].whackSuccess()) {
            score++;
            circles[i][j].present = false;
            //println("score + " + score);
            number -= 1;
            while (number<5) {
              insertCircle();
            }
            //println(number);
          }
        }
      }
    }
    //check all circles for their lifespan, if = 0 then lives--
    for (int i = 0 ; i < circles.length ; i++) {
      for (int j = 0 ; j < circles[0].length ; j++) {
        if (circles[i][j].present) {
          circles[i][j].lifespan -= 1;
          if (circles[i][j].lifespan <= 0) {
            circles[i][j].present = false;
            number -= 1;
            lives--;
          }
        }
      }
    }
  }
}


void fillStart() {
  for (int i = 0 ; i < circles.length ; i++) 
    for (int j = 0 ; j < circles[0].length ; j++) 
      circles[i][j] = new Circle();
}

boolean insertCircle() {
  int a = (int)random(circles.length);
  int b = (int)random(circles[0].length);
  if (!circles[a][b].present) {
    circles[a][b].present = true;
    circles[a][b].cirX = a;
    circles[a][b].cirY = b;
    circles[a][b].lifespan = 4;
    number+=1;
    //println("inserted");
    return true;
  }
  return false;
}

void gameover() {
  //println("FFFFFFFFFFFFFFFFFFFFF");
  background(255);
  fill(0);
  textSize(30);
  text("Your total score: " + score, 60, 100);
  textSize(15);
  text("Game over!! Click ENTER to play again!", 60, 140);
  number = 0;
  score = 0;
  level = 1;
  lives = 5;
  keyPressed();
}


//------------------------------------------


class Circle {
  int lifespan, cirX, cirY;
  boolean present;
  int x1, x2, y1, y2;
  int a = (int)random(256), b = (int)random(256), c = (int)random(256);

  boolean whackSuccess() {
    //check each present circle to see if the clicked coordinates are within any range of those circles
      //println("coordinates: " + xCor + " " + yCor);
      if ( xCor >= x1 && xCor <= x2 && yCor >= y1 && yCor <= y2) {
      // println("aaaaaaaaaaaaaaaaa");
      xCor = 0;
      yCor = 0;
      //println("coordinates: " + xCor + " " + yCor);
      return true;
    }
    return false;
  }

  void drawCircle() {
    fill(a, b, c);
    stroke(3);
    ellipse((cirY+1)*70, (cirX+1)*50, 40, 40);
    y1 = (cirX+1)*50 - 20;
    y2 = (cirX+1)*50 + 20;
    x1 = (cirY+1)*70 - 20;
    x2 = (cirY+1)*70 + 20;
  }
}


