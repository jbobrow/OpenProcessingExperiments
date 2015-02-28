
import ddf.minim.*;

Minim minim;
AudioSample bounce;
AudioSample paddle;
AudioPlayer bgsound;

float x = 100, y = 100;
float xSpeed = random(2, 4);
float ySpeed = random(2, 4);
int score = 0;
boolean hit = false;
PImage sun;
PImage stars;

void setup() {

  size(300, 300);
   minim = new Minim(this);
  bounce = minim.loadSample("laser.mp3");
  paddle = minim.loadSample("laser2.mp3");
  bgsound = minim.loadFile("loop.mp3");
  bgsound.loop();

  noStroke();
  sun = loadImage("sun.png");
  stars = loadImage("stars.png");
  noCursor();
}

void draw() {
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  background(0, 17, 62);
  image(sun,10,1);
  image(stars,0,0);
  fill(150, 191, 255);
  textSize(14);
  text("Score: " +score, (mouseX*mouseY)/300, 10);
  textSize(11);
  text("Hit the ball!", mouseX/g+100, 30);
  textSize(9);
  text("Press any key to restart", 180, 290);
  stroke(126, 161, 255);
  fill(r, g, b);
  rect(mouseX, width-40, 40, 5);
  stroke(126, 161, 255);
  fill(0, 25, 90);
  ellipse(x, y, 10, 10);
  fill(r, 161, b);
  ellipse(x, y, 7, 7);

  x = x + xSpeed;
  y = y + ySpeed;

  //if x hits the right or left border
  if (x > width-5 || x < 5) { 
    bounce.trigger();
    xSpeed = -xSpeed;
  }
  //if y hits the right or left border  
  if (y > width-5 || y < 5) {
    bounce.trigger();
    ySpeed = -ySpeed;
  }
  //if the ball lands on the x-axis of the paddle 
  if ((y < width-40) && (y > width-45)) {
    //if the ball is within the width of the paddle
    if ((x > mouseX) && (x < mouseX+40)) {
      ySpeed = -ySpeed;
      hit = true;
    }
  }
  else {
    hit = false;
  }

  if (hit == true) {
    score += 1;
    paddle.trigger();
  }
  else {
    hit = false;
  }

  if (score>=1&&score<4) {
    textSize(14);
    text("You're doing great!", mouseY/g, 40);
  }
  else if (score>=4&&score<6) {
    textSize(14);
    text("You're too good, mate.", mouseY/g+100, 40);
  }  
  else if (score>=6) {
    textSize(14);
    text("You must have an IQ of 200.", mouseY/g+100, 40);
  }
}

  void keyPressed() {
  score=0;
  }


