
int p1;
int p2;
int p1y;
int p2y;
int ballx;
int bally;
int ballSpeedx;
int ballSpeedy;
int radius;
boolean start;
PFont Roman;
int score1;
int score2;
PImage nick;

void setup() {

  size (600, 400);
  p1= 10;
  p2= 590;
  p1y = 300;
  p2y= 300;
  start = true;
  radius= 10;
  ballx = int(random(0, 600));
  bally = int(random(0, 400));
  ballSpeedx = 7;
  ballSpeedy = 4;
  fill(50);
  strokeWeight(4);
  Roman = loadFont("Delicious-Roman-48.vlw");
  textFont(Roman, 32);
  rectMode(CENTER);
  score1 = 0;
  score2 = 0;
  nick = loadImage("nick.jpg");
}



void draw() {

  background(244);
  textAlign(CENTER);
  fill(0);
  text("Score", width/2, 30);

  text(score1, width*3/4, 30);
  text(score2, width/4, 30 );

  strokeWeight(4);
  line (300, 50, 300, 400);
  strokeWeight (1);
  ellipse (ballx, bally, radius, radius);
  //create ball to bounce off all 4 walls

    if (start == true) {
    ballx= ballx +ballSpeedx;
    bally= bally + ballSpeedy;
  }


  if (ballx >= width- radius/2) {
    score2 ++;
    ballx =300;
    bally =200;
    start = false;
  }


  if (mousePressed && start == false) { 
    start = true;
  }

  //    start = true;
  //  }
  if (ballx <= 10 - radius/2) {
    score1 ++;
    ballx =300;
    bally =200;
    start = false;
    //  if (mousePressed) { 
    //    ballx =300;
    //    bally =200;
    //    start = true;
    //  }
  }

  //ballx= ballSpeedx - 7;
  //bally = ballSpeedy - 4;

  // bally

  if (bally >= height- radius/2) {
    ballSpeedy = -ballSpeedy;
  }
  if (bally <= 10 - radius/2) {
    ballSpeedy = -ballSpeedy;
    //question about why i have to add 10px to avoid going off the screen
  }
  //create the barriers

  rect(p1, p1y, 5, 60);
  if (p1y <0) {
    p1y = 0;
  }
  if (p1y >height) {
    p1y = height;
  }
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode == UP) {
        p1y-=10;
      }
      if (keyPressed) {
        if (key==CODED) {
          if (keyCode == DOWN) {
            p1y+=10;
          }
        }
      }
    }

    if (key == 'q' || key == 'Q') {
      p1y-=10;
    }
    if (keyPressed) {

      if (key == 'a' || key == 'A') {
        p1y+=10;
      }
    }
  }
  rect(p2, mouseY, 5, 60);
  //create panels which bounce off ball

  //if (bally == p1) {
  //  ballSpeedy = -ballSpeedy;
  // }

  if (ballx >= 578.5 && ballx <= 588.5 && 
    bally >= mouseY-30 && bally < mouseY + 30 ) {
    ballSpeedx =-ballSpeedx;
  }

  if (ballx >= 5 && ballx <= 15 && 
    bally >= p1y- 30 && bally < p1y +30 ) {
    ballSpeedx =-ballSpeedx;
  }



  //bally, ballx = dist(p1, p1y, 5, 60)) {
  //ballSpeedy = -ballSpeedy;

  // (bally = rect- radius/2) {
  //ballSpeedy = -ballSpeedy;
  imageMode(CENTER);
  fill(255, 0,0);
  if (score1 >=10) { 
    image(nick, width/2, height/2);
    
    
    text("WINNER, PLAYER 2", width/2, height/2);
    }
    if (score2 >=10) { 
      image(nick, width/2, height/2);
      text("WINNER, PLAYER 1", width/2, height/2);
      }
  }


