
import ddf.minim.*;

Minim minim;
AudioSample bounce;
AudioSample hit;
AudioPlayer bgsound;

float x = 100, y = 100;
float xSpeed = random(2,4);
float ySpeed = random(2,4);

//top level bricks
float brickX = 20, brickY = 40;
float brickX2 = 70, brickY2 = 40;
float brickX3 = 120, brickY3 = 40;
float brickX4 = 170, brickY4 = 40;
float brickX5 = 220, brickY5 = 40;

//second level bricks
float brickX6 = 20, brickY6 = 50;
float brickX7 = 70, brickY7 = 50;
float brickX8 = 120, brickY8 = 50;
float brickX9 = 170, brickY9 = 50;
float brickX10 = 220, brickY10 = 50;
int score = 0;
PFont font;
PImage img;

void setup() {

  size(300, 300);
  noStroke();
  noCursor();
  font = loadFont("HoboStd-25.vlw");
  img = loadImage("woodland.png");  
  
  minim = new Minim(this);
  bounce = minim.loadSample("beep-2.mp3");
  hit = minim.loadSample("beep-10.mp3");
  bgsound = minim.loadFile("ukulele.mp3");
  bgsound.loop();
}


void draw() {

  background(0);
  image(img,0,0);
  
  //show score
  fill(95,93,91);
  text("Score:" + score, 10,20);

  fill(95,93,91);
  rect(mouseX-25,height-40,50,5);
  fill(random(255), random(255), random(255));
  ellipse(x, y, 10, 10);
  
  //bricks
  fill(31,255,171);
  rect(brickX, brickY,50,10);
  fill(255,0,0);
  rect(brickX2, brickY2,50,10);
  fill(254,255,8);
  rect(brickX3, brickY3,50,10);
  fill(208,39,242);
  rect(brickX4, brickY4,50,10);
  fill(138,255,121);
  rect(brickX5, brickY5,50,10);
  
  fill(31,255,171);
  rect(brickX6, brickY6,50,10);
  fill(255,0,0);
  rect(brickX7, brickY7,50,10);
  fill(254,255,8);
  rect(brickX8, brickY8,50,10);
  fill(208,39,242);
  rect(brickX9, brickY9,50,10);
  fill(138,255,121);
  rect(brickX10, brickY10,50,10);


  x = x + xSpeed;
  y = y + ySpeed;
  
  //if hit left or right wall
  if (x > width-5 || x < 5) {
    xSpeed = -xSpeed;
  }
  
  //if hit the top wall
  if (y < 5) {
    ySpeed = -ySpeed;
  }
  
  if (y > height-5) {
    image(img,0,0);
    fill(0);
    text("Game Over",90,150);
    
  
  }
    
  if (y > height-40 && (mouseX-25 <x && mouseX+25>x)) {
    hit.trigger();
    ySpeed = -ySpeed;
  }
  
  //when hit the bricks 
  if (ySpeed <0 && x>= brickX && x<= brickX+50 && y> brickY && y< brickY+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX = -1000;
    score = score+1;
  }
  
   if (ySpeed <0 && x>= brickX2 && x<= brickX2+50 && y> brickY2 && y< brickY2+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX2 = -1000;
    score = score+1;
  }
  
   if (ySpeed <0 && x>= brickX3 && x<= brickX3+50 && y> brickY3 && y< brickY3+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX3 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX4 && x<= brickX4+50 && y> brickY4 && y< brickY4+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX4 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX5 && x<= brickX5+50 && y> brickY5 && y< brickY5+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX5 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX6 && x<= brickX6+50 && y> brickY6 && y< brickY6+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX6 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX7 && x<= brickX7+50 && y> brickY7 && y< brickY7+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX7 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX8 && x<= brickX8+50 && y> brickY8 && y< brickY8+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX8 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX9 && x<= brickX9+50 && y> brickY9 && y< brickY9+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX9 = -1000;
    score = score+1;
  }
  
  if (ySpeed <0 && x>= brickX10 && x<= brickX10+50 && y> brickY10 && y< brickY10+10){
    bounce.trigger();
    ySpeed = -ySpeed;
    brickX10 = -1000;
    score = score+1;
  }
}

