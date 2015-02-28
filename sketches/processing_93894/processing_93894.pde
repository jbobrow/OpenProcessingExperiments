
//HW 7 Cristina Shin cshin1 Copyright Cristina Shin 2013
float x1, y1, x2, y2, x3, y3, c, hit;
float xSteps, ySteps;
int phase, startTime, gameTime, score;
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
  x2 = random(width);
  y2 = height;
  c = 100;
  xSteps = random(3, 4);
  ySteps = random(3, 4);

   
  phase = 0;
  startTime = 0;
  gameTime = 20000;
  score = 0;
}
 
void draw() {
  background(162, 205, 247);
  fill( 77, 170, 80 );
  noStroke( );
  ellipse( 200, 400, 600, 100);
  if (phase == 0) {
    instructions();
  } 
  else if (phase == 1) {
    playGame();
  } 
  else {
    score();
  }
}
 
void instructions() {
   fill(242, 59, 86, 230);
   textSize( 20 );
   text("CATCH AS MANY CIRCLES.", width/6, height*.1 );
   text("MOVE MOUSE LEFT AND RIGHT.", width/8, height*.2 );
   text("CLICK MOUSE TO BEGIN.", width/5, height*.3 );
}
 
void mouseClicked() {
   if (phase == 0) {
     phase = 1;
     startTime = millis( );
   };
}
 
void playGame() {
  circles( );
  bounce();
  basket();
  caught();
  finalScore();
  timeLeft();
}
   
void circles( ) {
  noStroke();
  fill(255);
  ellipse(x2, y2, c/4, c/4);

}
 
void bounce() {
  x2 = x2 + xSteps;
  y2 = y2 + ySteps;
  if (x2 > width) {
    xSteps = -xSteps;
  } else if (x2 < 0) {
    xSteps = -xSteps;
  };
  if (y2 > height) {
    y2 = 0;
    x2 = random(0, 400);

  } 
  }

 
void basket() {
  x3 = mouseX;
  y3 = 350;
  
  noStroke( );
  fill( 116,100,75 );
  rect(x3, y3, width*0.08, height/10);
}

 
   
 
void caught() {
  hit = dist(x2, y2, x3, y3);
  if (hit < c/4) {
    score++;
    x2 = random(width);
    y2 = random(height);
    xSteps = random(6, 8);
    ySteps = random(3, 5);

  }
}
 
 
void timeLeft() {
  
  fill(242, 59, 86);
  textSize(25);
  text((millis()/1000), width/1.1222, height*.1);

  if (millis() > gameTime) 
  {
    phase = 2;
  }
}
 
 void finalScore() 
 {
  fill(242, 59, 86);
  textSize( 16 );
  text("Circles in Basket: " + score, width*0.05, height*.1);
}
 
void score() {
  fill(242, 59, 86);
  textSize(22);
  text("You caught " + score + " " + "circles!", width/5, height*.1);
}



