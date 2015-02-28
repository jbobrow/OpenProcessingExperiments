
///ball
float xPos=random(0, width);
float yPos=random(0, height);
//change the ball's direction of X and Y scale.
float speedX=5;
float speedY=5; 
float radius;

//paddleL
float xPos2;
float yPos2;
float wide;
float high;

//paddleR
float xPos3;
float yPos3;
float wide2;
float high2;

//Score
int scoreL=0;
int scoreR=0;

void setup() {
  size(800, 400);
  background(0);

  //ball's
  xPos=width/2;
  yPos=random(0, height);  
  radius=20;
  fill(150);
  ellipse(width/2, height/2, radius, radius);

  //paddleL's
  xPos2=50;
  yPos2=height/2;
  wide=10;
  high=100;

  //paddleR's
  xPos3=750;
  yPos3=height/2;
  wide2=10;
  high2=100;
}

void draw() {
  background(0);
  stroke(255);
  line(width/2, 0, width/2, height);
  bounce();
  pressL();
  pressR();
  score();
  
  radius=20;  
  ball(xPos, yPos, radius);
  paddleL(xPos2, yPos2, wide, high);
  paddleR(xPos3, yPos3, wide2, high2);
  fill(255);
  textAlign(LEFT);
  text(scoreL, 50, 15);
  textAlign(RIGHT);
  text(scoreR, width-50, 15);
}

void score() {
  if (xPos >= width+radius/2 || xPos <= 0-radius/2 ) {
    // count 
    if ( xPos >= width+radius/2 ) {
      scoreR ++;
    }
    else {
      scoreL ++;
    }
  }
}

void pressL() {
  if (keyPressed) {
    if (key == 'Q'|| key == 'q') {   
      background(0);
      stroke(255);
      line(width/2, 0, width/2, height);
      yPos2-=5;
    }
    if (key == 'A'|| key == 'a') {
      background(0);
      stroke(255);
      line(width/2, 0, width/2, height);
      yPos2+=5;
    }
  }
}

void pressR() {
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==UP) {   
        background(0);
        stroke(255);
        line(width/2, 0, width/2, height);
        yPos3-=5;
      }
      if (keyCode==DOWN) {
        background(0);
        stroke(255);
        line(width/2, 0, width/2, height);
        yPos3+=5;
      }
    }
  }
}

void bounce() {
  // add speed to xPos and yPos
  xPos+=speedX; 
  yPos+=speedY;  

  if (xPos>width+radius/2 || xPos<0-radius/2) {
    //reset the ball
    xPos=width/2;
    yPos=random(0, height);
    // change the direction of ball to right or left side(next time)
    speedX=speedX*-1;
    speedY=speedY*-1;
    //println("off the screen");
  }
  //ball off top and bottom
  if (yPos>height-radius/2 || yPos<radius/2) {
    speedY=speedY*-1;
  }

  //interact with paddleL
  if (xPos-radius/2<=xPos2+wide && xPos>xPos2) {
    if (yPos>=yPos2 && yPos<yPos2+high) {
      speedX=speedX*-1;
      speedY=speedY*-1;
      //println("left paddle");
    }
  }

  //interact with paddleR
  if (xPos+radius/2>=xPos3 && xPos>xPos3) {
    if (yPos>=yPos3 && yPos<yPos3+high) {
      speedX=speedX*-1;
      speedY=speedY*-1;
      //println("right paddle");
    }
  }
}

void ball(float x, float y, float size) {
  smooth();
  stroke(255);
  fill(random(0, 255));
  ellipse(x, y, size, size);
}

void paddleL(float x, float y, float wide, float high) {
  smooth();
  noStroke();
  fill(255);
  rect(x, y, wide, high);
}

void paddleR(float x, float y, float wide, float high) {
  smooth();
  noStroke();
  fill(255);
  rect(x, y, wide, high);
}
