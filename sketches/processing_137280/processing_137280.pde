
float birdX, birdY;
float lineX, lineY;
float line2X, line2Y;
float signal;
float signal2;
float score;
float highScore;
PImage bird;
PImage line;
PImage line2;
PImage Background;
float identity1;
float identity2;
float end;



void setup() {
  frameRate(30);
  size(1000, 600);
  Background = loadImage("Background.jpg");
  bird = loadImage("bird.png");
  line = loadImage("line.png");
  line2 = loadImage("line2.png");
  birdX = 100;
  signal = 1;
  birdY = 200;
  lineX = 1000;
  lineY = 0;
  line2X = 1500;
  line2Y = 0;
  score = 0;
  highScore = 0;
  //identity1 = 1;
  //identity2 = 1;
}

void draw() {
  background(255);
  image(Background, 0, 0);
  image(bird, birdX, birdY);
  image(line, lineX, lineY);
  image(line2, line2X, line2Y);
  lineX = lineX - 9;
  line2X = line2X - 9;
  birdY = birdY + 6;  
  text("Score = " + score, 20, 20); //Score Box
  text("High Score = " +highScore, 200, 20);
  // signal2 = 2;
  if (score > highScore) {
    highScore = score;
  }

  println(identity2);

  if (lineX <= -100) { //Resets Power Lines 
    lineX = 1000;
    signal = random(1, 4); //Randomly Selects Power Lines
    score = score + 1;
  }

  if (signal >= 1 && signal < 2) {
    line = loadImage("line.png");
    identity1 = 1;
  }
  if (signal >= 2 && signal < 3) {
    line = loadImage("line2.png");
    identity1 = 2;
  }
  if (signal >= 3 && signal <= 4) {
    line = loadImage("line3.png");
    identity1 = 3;
  }

  if (line2X <= -100) { //Resets Power Lines 
    line2X = 1000;
    signal2 = random(1, 4); //Randomly Selects Power Lines
    score = score + 1;
  }
  if (signal2 >= 1 && signal2 < 2) {
    line2 = loadImage("line.png");
    identity2 = 1;
  }
  if (signal2 >= 2 && signal2 < 3) {
    line2 = loadImage("line2.png");
    identity2 = 2;
  }
  if (signal2 >= 3 && signal2 <= 4) {
    line2 = loadImage("line3.png");
    identity2 = 3;
  }

  if (birdX <= lineX+100 && birdX >= lineX && (birdY >= 350 || birdY <= 200) && identity1 == 1) {
    println("end");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
   // identity1 = 1;
    //identity2 = 1;
  }
  if (birdX <= lineX+100 && birdX >= lineX && (birdY >= 550 || birdY <= 350) && identity1 == 2) {
    println("end2");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
  //  identity1 = 1;
  //  identity2 = 1;
  }
  if (birdX <= lineX+100 && birdX >= lineX && (birdY >= 250 || birdY <= 100) && identity1 == 3) {
    println("end3");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
   // identity1 = 1;
   // identity2 = 1;
  }
  if (birdX <= line2X+100 && birdX >= line2X && (birdY >= 350 || birdY <= 200) && identity2 == 1) {
    println("enda");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
   // identity1 = 1;
   // identity2 = 1;
  }
  if (birdX <= line2X+100 && birdX >= line2X && (birdY >= 550 || birdY <= 350) && identity2 == 2) {
    println("end2a");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
   // identity1 = 1;
   // identity2 = 1;
  }
  if (birdX <= line2X+100 && birdX >= line2X && (birdY >= 250 || birdY <= 100) && identity2 == 3) {
    println("end3a");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
   // identity1 = 1;
  //  identity2 = 1;
  }

  if (birdY >= 500) {
    println("endb");
    bird = loadImage("bird.png");
    line = loadImage("line.png");
    line2 = loadImage("line2.png");
    birdX = 100;
    signal = 1;
    birdY = 200;
    lineX = 1000;
    lineY = 0;
    line2X = 1500;
    score = 0;
  //  identity1 = 1;
   // identity2 = 1;
  }


  if (birdY <= 0) { // Top Bound
    birdY = 1;
  }
}


void keyPressed() {
  if (keyCode == ENTER) {
    birdY = birdY - 90;
    bird = loadImage("flap.png");
  }
}
void keyReleased() {
  if (keyCode == ENTER) {
    bird = loadImage("bird.png");
  }
}



