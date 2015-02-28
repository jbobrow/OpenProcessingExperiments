
/*

Project 3: Point, Click, Drag, Drop
Chip Dong Lim, 17th May 2013
This is a game that allows players to choose either husky 
or kitten as their character, eat doughnuts as food and 
shoot laser to eliminate the enemy snake.

*/

import ddf.minim.*; //import audio library

// Image of players
PImage husky;
PImage kitten;
PImage huskysmall;
PImage kittensmall;
// Image of clouds
PImage cloud1;
PImage cloud2;
// Image of flying food
PImage doughnut;
// Image of flying enemy
PImage snake;
// Font used
PFont font;
// Image for Game Over
PImage dead;
PImage replay;
// Game indication counter
PImage live;
PImage kill;
PImage food;

//variables for choosing player
boolean husky_chosen = false;
boolean kitten_chosen = false;
int kittenX = 650;
int kittenY = 200;
int huskyX = 350;
int huskyY = 200;
int welcomeScreenW = 100;
int welcomeScreenH = 100;

boolean welcomeScreen = true;


//variables player
int playerX = 40;//start value
int playerY = 300;//start value
int playerWidth = 70;
int playerHeight = 50;

//variables objects
//for the randoms
int speed_random_high = 6;//upper speed limit
int speed_random_low = 2;//lower speed limit
int random_y_pos_low =70;
int random_y_pos_high =375;

//cloud objects size
int cloud1_object_width = 149;
int cloud1_object_height = 64;
int cloud2_object_width = 201;
int cloud2_object_height = 86;

//The cloud1 object
//position and speed cloud one, start value
int cloud1_object_x=700;
int cloud1_object_y=280;
int cloud1_object_speed=1;
//position and speed cloud 2, start value
int cloud2_object_x=700;
int cloud2_object_y=350;
int cloud2_object_speed=1;

//doughnut object size
int doughnut_object_width = 50;
int doughnut_object_height = 50;
int doughnut_object_x=700;
int doughnut_object_y=350;

int doughnut2_object_x=700;
int doughnut2_object_y=250;

int doughnut3_object_x=700;
int doughnut3_object_y=50;

int laser_object_x=50;
int laser_object_y=mouseY;
int laser_object_width = 50;
int laser_object_height = 50;
int laser_object_speed = 3;

int doughnut_object_speed = 3;

//snake object size
int snake_object_width = 65;
int snake_object_height = 43;

//The snake objects
//position and speed object one, start value
int snake_object_x=740;
int snake_object_y=300;
int snake_object_speed=2;
//position and speed object 2, start value
int snake_object_x2=700;
int snake_object_y2=350;
int snake_object_speed2=3;
//position and speed object 3, start value
int snake_object_x3=700;
int snake_object_y3=380;
int snake_object_speed3=3;
//position and speed object 4, start value
int snake_object_x4=700;
int snake_object_y4=380;
int snake_object_speed4=3;
//position and speed object 5, start value
int snake_object_x5=700;
int snake_object_y5=380;
int snake_object_speed5=3;
//position and speed object 6, start value
int snake_object_x6=700;
int snake_object_y6=380;
int snake_object_speed6=3;
//position and speed object 7, start value
int snake_object_x7=700;
int snake_object_y7=380;
int snake_object_speed7=3;
//position and speed object 8, start value
int snake_object_x8=700;
int snake_object_y8=380;
int snake_object_speed8=3;
//position and speed object 9, start value
int snake_object_x9=700;
int snake_object_y9=380;
int snake_object_speed9=3;


// doughnut hit count
int doughnutHit = 0;

// count for killing enemy snake
int killCount = 0;

// count for player live left
int liveCount = 3;

boolean fire = false;

// explode animation
import gifAnimation.*;

PImage[] animation;
Gif nonLoopingGif;
boolean pause = false;
boolean strike = false;
int savedX;
int savedY;

//AudioPlayer object -- does all the audio
AudioPlayer player1; 
AudioPlayer player2;  
AudioPlayer player3;  
AudioPlayer player4;  

void setup(){
  imageMode(CENTER);
  size(1000, 400);
  fill(#bce5eb);
  rect(0, 0, 1000, 400);
  rectMode(CENTER);
  
  husky = loadImage("husky.png");
  kitten = loadImage("kitten.png");
  huskysmall = loadImage("husky-small.png");
  kittensmall = loadImage("kitten-small.png");

  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");

  doughnut = loadImage("doughnut.png");
  smooth();
  snake = loadImage("snake.png");

  dead = loadImage("gameover.png");
  replay = loadImage("replay.png");

  live = loadImage("live.png");
  kill = loadImage("snakesmall.png");
  food = loadImage("doughnutsmall.png");

  //initialize audio player. do this in setup -- it only needs to happen once
  Minim minim = new Minim(this);
  player1 = minim.loadFile("explode.wav");  //load sound. audio file is in data directory.
  player2 = minim.loadFile("laser.wav");
  player3 = minim.loadFile("nyandog.mp3");
  player4 = minim.loadFile("nyancat.mp3");
  
  font = loadFont("Dialog-12.vlw");

  frameRate(30); 
  nonLoopingGif = new Gif(this, "explosion.gif");
  nonLoopingGif.play();
}

void draw(){
  clouds();
  if (welcomeScreen == true) {
    smooth();
    image(kitten, kittenX, kittenY, 250, 178);
    image(husky, huskyX, huskyY, 250, 178);
    //check void mouseClicked for choosing the player
  }
  textFont(font, 12); 
  if (welcomeScreen == false) { // start game
    flying_food();
    snake();
    eatFood();
    snakeEaten();
    if (fire) {
      cannon(mouseY);
      fire = false;
    }

    //counters
    fill(#333333);
    textSize(15);
    //text("Live:", width/10*8 - 50, 25);
    image(live, width/10*9 - 50, 25);
    text(liveCount, width/10*9 - 30, 30);

    //text("Doughnuts:", width/10*9 - 90, 25);
    image(kill, width/10*9, 25);
    text(killCount, width/10*9 + 20, 30);

    //text("Kill:", width/10*9 + 20, 25);
    image(food, width/10*9 + 50, 25);
    text(doughnutHit, width/10*9 + 70, 30);

    gameOver(); //activates game over
  }

  if (husky_chosen == true) {
    //Draws the player(husky), the photo
    fill(#bce5eb);
    image(huskysmall, playerX, playerY, playerWidth, playerHeight);
    player3.play();
  }

  if (kitten_chosen == true) {
    //Draws the player(kitten), the photo
    fill(#bce5eb);
    image(kittensmall, playerX, playerY, playerWidth, playerHeight);
    player4.play();
  }

  playerY = mouseY;

  //keeps player within the playing field
  if (playerY > 375) {
    playerY = 375;
  }
  if (playerY < 25) {
    playerY = 25;
  }
  if (strike == true) {
    image(nonLoopingGif, savedX, savedY);
  }
}

void clouds() {
  //cloud 1
  image(cloud1, cloud1_object_x, cloud1_object_y, cloud1_object_width, cloud1_object_height);
  cloud1_object_x = cloud1_object_x - cloud1_object_speed;
  if (cloud1_object_x <= -cloud1_object_width) {
    cloud1_object_x = width + cloud1_object_width;
    cloud1_object_y = int(random(25, 375));//gives random position
    cloud1_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //cloud 2
  image(cloud2, cloud2_object_x, cloud2_object_y, cloud2_object_width, cloud2_object_height);
  cloud2_object_x = cloud2_object_x - cloud2_object_speed;
  if (cloud2_object_x <= -cloud2_object_width) {
    cloud2_object_x = width + cloud2_object_width;
    cloud2_object_y = int(random(25, 375));//gives random position
    cloud2_object_speed = int(random(1, 3));//gives random speed
  }

  //cloud 3
  image(cloud2, cloud2_object_x - 40, cloud2_object_y + 40, cloud2_object_width*1.5, cloud2_object_height*1.5);
  cloud2_object_x = cloud2_object_x - cloud2_object_speed;
  if (cloud2_object_x <= -cloud2_object_width) {
    cloud2_object_x = width + cloud2_object_width;
    cloud2_object_y = int(random(25, 375));//gives random position
    cloud2_object_speed = int(random(1, 3));//gives random speed
  }
  
  //cloud 4
  image(cloud1, cloud1_object_x, cloud1_object_y - 150, cloud1_object_width, cloud1_object_height);
  cloud1_object_x = cloud1_object_x - cloud1_object_speed - 2;
  if (cloud1_object_x <= -cloud1_object_width) {
    cloud1_object_x = width + cloud1_object_width;
    cloud1_object_y = int(random(75, 375));//gives random position
    cloud1_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }
}

void flying_food() {
  // doughnut
  image(doughnut, doughnut_object_x, doughnut_object_y, doughnut_object_width, doughnut_object_height);
  doughnut_object_x = doughnut_object_x - doughnut_object_speed;
  if (doughnut_object_x <= -doughnut_object_width) {
    doughnut_object_x = width + doughnut_object_width;
    doughnut_object_y = int(random(25, 375));//gives random position
    doughnut_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  // doughnut 2
  image(doughnut, doughnut2_object_x, doughnut2_object_y, doughnut_object_width, doughnut_object_height);
  doughnut2_object_x = doughnut2_object_x - doughnut_object_speed;
  if (doughnut2_object_x <= -doughnut_object_width) {
    doughnut2_object_x = width + doughnut_object_width;
    doughnut2_object_y = int(random(55, 375));//gives random position
    doughnut_object_speed = int(random(speed_random_low+5, speed_random_high));//gives random speed
  }

  // doughnut 3
  image(doughnut, doughnut3_object_x, doughnut3_object_y, doughnut_object_width, doughnut_object_height);
  doughnut3_object_x = doughnut3_object_x - doughnut_object_speed;
  if (doughnut3_object_x <= -doughnut_object_width) {
    doughnut3_object_x = width + doughnut_object_width;
    doughnut3_object_y = int(random(25, 375));//gives random position
    doughnut_object_speed = int(random(speed_random_low+2, speed_random_high));//gives random speed
  }
}

void eatFood() {
  //doughnut_hit
  //doughnut 1
  if (playerY>= doughnut_object_y - doughnut_object_height/2 && playerY<= doughnut_object_y + doughnut_object_height/2 && playerX <= doughnut_object_x + doughnut_object_width/2 && playerX >= doughnut_object_x - doughnut_object_width/2 ) {
    println("CRAZY");
    doughnutHit = doughnutHit+1;
    doughnut_object_x = width + doughnut_object_width;//when a doughnut is hit the doughnut jumps back to starting position
    doughnut_object_y = int(random(25, 375));//gives random position
    doughnut_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }


  //doughnut 2
  if (playerY>= doughnut2_object_y - doughnut_object_height/2 && playerY<= doughnut2_object_y + doughnut_object_height/2 && playerX <= doughnut2_object_x + doughnut_object_width/2 && playerX >= doughnut2_object_x - doughnut_object_width/2 ) {
    println("CRAZY");
    doughnutHit = doughnutHit+1;
    doughnut2_object_x = width + doughnut_object_width;//when a doughnut is hit the doughnut jumps back to starting position
    doughnut2_object_y = int(random(25, 375));//gives random position
    doughnut_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //doughnut 3
  if (playerY>= doughnut3_object_y - doughnut_object_height/2 && playerY<= doughnut3_object_y + doughnut_object_height/2 && playerX <= doughnut3_object_x + doughnut_object_width/2 && playerX >= doughnut3_object_x - doughnut_object_width/2 ) {
    println("CRAZY");
    doughnutHit = doughnutHit+1;
    doughnut3_object_x = width + doughnut_object_width;//when a doughnut is hit the doughnut jumps back to starting position
    doughnut3_object_y = int(random(25, 375));//gives random position
    doughnut_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }
}

void snakeEaten() {
  //snake hit
  //snake hit one
  if (playerY>= snake_object_y - snake_object_height/2 && playerY<= snake_object_y + snake_object_height/2 && playerX <= snake_object_x + snake_object_width/2 && playerX >= snake_object_x - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y = int(random(25, 375));//gives random position
    snake_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //snake hit 2
  if (playerY>= snake_object_y2 - snake_object_height/2 && playerY<= snake_object_y2 + snake_object_height/2 && playerX <= snake_object_x2 + snake_object_width/2 && playerX >= snake_object_x2 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x2 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y2 = int(random(25, 375));//gives random position
    snake_object_speed2 = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  //snake hit 3
  if (playerY>= snake_object_y3 - snake_object_height/2 && playerY<= snake_object_y3 + snake_object_height/2 && playerX <= snake_object_x3 + snake_object_width/2 && playerX >= snake_object_x3 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x3 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y3 = int(random(25, 375));//gives random position
    snake_object_speed3 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake hit 4
  if (playerY>= snake_object_y4 - snake_object_height/2 && playerY<= snake_object_y4 + snake_object_height/2 && playerX <= snake_object_x4 + snake_object_width/2 && playerX >= snake_object_x4 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x4 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y4 = int(random(25, 375));//gives random position
    snake_object_speed4 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake hit 5
  if (playerY>= snake_object_y5 - snake_object_height/2 && playerY<= snake_object_y5 + snake_object_height/2 && playerX <= snake_object_x5 + snake_object_width/2 && playerX >= snake_object_x5 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x5 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y5 = int(random(25, 375));//gives random position
    snake_object_speed5 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake hit 6
  if (playerY>= snake_object_y6 - snake_object_height/2 && playerY<= snake_object_y6 + snake_object_height/2 && playerX <= snake_object_x6 + snake_object_width/2 && playerX >= snake_object_x6 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x6 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y6 = int(random(25, 375));//gives random position
    snake_object_speed6 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake hit 7
  if (playerY>= snake_object_y7 - snake_object_height/2 && playerY<= snake_object_y7 + snake_object_height/2 && playerX <= snake_object_x7 + snake_object_width/2 && playerX >= snake_object_x7 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x7 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y7 = int(random(25, 375));//gives random position
    snake_object_speed7 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake hit 8
  if (playerY>= snake_object_y8 - snake_object_height/2 && playerY<= snake_object_y8 + snake_object_height/2 && playerX <= snake_object_x8 + snake_object_width/2 && playerX >= snake_object_x8 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x8 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y8 = int(random(25, 375));//gives random position
    snake_object_speed8 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake hit 9
  if (playerY>= snake_object_y9 - snake_object_height/2 && playerY<= snake_object_y9 + snake_object_height/2 && playerX <= snake_object_x9 + snake_object_width/2 && playerX >= snake_object_x9 - snake_object_width/2 ) {
    println("CRAZY");
    liveCount -= 1;
    snake_object_x9 = width + snake_object_width;//when a snake is hit the like jumps back to starting position
    snake_object_y9 = int(random(25, 375));//gives random position
    snake_object_speed9 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
}

void snake() {
  //snake 1
  image(snake, snake_object_x, snake_object_y, snake_object_width, snake_object_height);
  snake_object_x = snake_object_x - snake_object_speed;
  if (snake_object_x <= -snake_object_width) {
    snake_object_x = width + snake_object_width;
    snake_object_y = int(random(25, 375));//gives random position
    snake_object_speed = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake 2
  image(snake, snake_object_x2, snake_object_y2, snake_object_width, snake_object_height);
  snake_object_x2 = snake_object_x2 - snake_object_speed2;
  if (snake_object_x2 <= -snake_object_width) {
    snake_object_x2 = width + snake_object_width;
    snake_object_y2 = int(random(25, 375));//gives random position
    snake_object_speed2 = int(random(speed_random_low, speed_random_high));//gives random speed
  }
  //snake 3
  image(snake, snake_object_x3, snake_object_y3, snake_object_width, snake_object_height);
  snake_object_x3 = snake_object_x3 - snake_object_speed3;
  if (snake_object_x3 <= -snake_object_width) {
    snake_object_x3 = width + snake_object_width;
    snake_object_y3 = int(random(25, 375));//gives random position
    snake_object_speed3 = int(random(speed_random_low, speed_random_high));//gives random speed
  }

  if (doughnutHit > 10 || killCount > 5) { //increase the number of objects aka difficulty when doughnuts eaten increases
    speed_random_low = 4;
    println("Killed 5!");
    frameRate(40);

    //snake 4
    image(snake, snake_object_x4, snake_object_y4, snake_object_width, snake_object_height);
    snake_object_x4 = snake_object_x4 - snake_object_speed4;
    if (snake_object_x4 <= -snake_object_width) {
      snake_object_x4 = width + snake_object_width;
      snake_object_y4 = int(random(25, 375));//gives random position
      snake_object_speed4 = int(random(speed_random_low, speed_random_high));//gives random speed
    }
    //snake 5
    image(snake, snake_object_x5, snake_object_y5, snake_object_width, snake_object_height);
    snake_object_x5 = snake_object_x5 - snake_object_speed5;
    if (snake_object_x5 <= -snake_object_width) {
      snake_object_x5 = width + snake_object_width;
      snake_object_y5 = int(random(25, 375));//gives random position
      snake_object_speed5 = int(random(speed_random_low, speed_random_high));//gives random speed
    }
    //snake 6
    image(snake, snake_object_x6, snake_object_y6, snake_object_width, snake_object_height);
    snake_object_x6 = snake_object_x6 - snake_object_speed6;
    if (snake_object_x6 <= -snake_object_width) {
      snake_object_x6 = width + snake_object_width;
      snake_object_y6 = int(random(25, 375));//gives random position
      snake_object_speed6 = int(random(speed_random_low, speed_random_high));//gives random speed
    }
  }
  if (doughnutHit > 25 || killCount > 15) {
    speed_random_low = 6;
    println("Killed 15!");
    frameRate(70);
    //snake 7
    image(snake, snake_object_x7, snake_object_y7, snake_object_width, snake_object_height);
    snake_object_x7 = snake_object_x7 - snake_object_speed7;
    if (snake_object_x7 <= -snake_object_width) {
      snake_object_x7 = width + snake_object_width;
      snake_object_y7 = int(random(25, 375));//gives random position
      snake_object_speed7 = int(random(speed_random_low, speed_random_high));//gives random speed
    }
    //snake 8
    image(snake, snake_object_x8, snake_object_y8, snake_object_width, snake_object_height);
    snake_object_x8 = snake_object_x8 - snake_object_speed8;
    if (snake_object_x8 <= -snake_object_width) {
      snake_object_x8 = width + snake_object_width;
      snake_object_y8 = int(random(25, 375));//gives random position
      snake_object_speed8 = int(random(speed_random_low, speed_random_high));//gives random speed
    }
    //snake 9
    image(snake, snake_object_x9, snake_object_y9, snake_object_width, snake_object_height);
    snake_object_x9 = snake_object_x9 - snake_object_speed9;
    if (snake_object_x9 <= -snake_object_width) {
      snake_object_x9 = width + snake_object_width;
      snake_object_y9 = int(random(25, 375));//gives random position
      snake_object_speed9 = int(random(speed_random_low, speed_random_high));//gives random speed
    }
  }
}

void mouseClicked() {
  //when restart button is pressed 
  if (mouseX <= 500 && mouseX >= 430 && mouseY<= 370 && mouseY >= 300) {
    welcomeScreen = false;
    liveCount = 3;
    doughnutHit = 0;
    killCount = 0;
    println("Game restarted!");
  }


  //When choosing player
  if (mouseX< (kittenX + welcomeScreenW/2) && mouseX> (kittenX - welcomeScreenW/2) && mouseY< (kittenY + welcomeScreenH/2) && mouseY> (kittenY - welcomeScreenH/2) ) {
    kitten_chosen = true;
    welcomeScreen = false;
    killCount = 0;
    liveCount = 3;
  }

  if (mouseX< (huskyX + welcomeScreenW/2) && mouseX> (huskyX - welcomeScreenW/2) && mouseY< (huskyY + welcomeScreenH/2) && mouseY> (huskyY - welcomeScreenH/2) ) {
    husky_chosen = true;
    welcomeScreen = false;
    killCount = 0;
    liveCount = 3;
  }
}

void mousePressed() {
  fire = true;
}

void cannon(int shotY) {
  player2.play(0);
  if (shotY>= snake_object_y - snake_object_height/2 && shotY<= snake_object_y + snake_object_height/2 ||
    shotY>= snake_object_y2 - snake_object_height/2 && shotY<= snake_object_y2 + snake_object_height/2 ||
    shotY>= snake_object_y3 - snake_object_height/2 && shotY<= snake_object_y3 + snake_object_height/2 ||
    shotY>= snake_object_y4 - snake_object_height/2 && shotY<= snake_object_y4 + snake_object_height/2 ||
    shotY>= snake_object_y5 - snake_object_height/2 && shotY<= snake_object_y5 + snake_object_height/2 ||
    shotY>= snake_object_y6 - snake_object_height/2 && shotY<= snake_object_y6 + snake_object_height/2 ||
    shotY>= snake_object_y7 - snake_object_height/2 && shotY<= snake_object_y7 + snake_object_height/2 ||
    shotY>= snake_object_y8 - snake_object_height/2 && shotY<= snake_object_y8 + snake_object_height/2 ||
    shotY>= snake_object_y9 - snake_object_height/2 && shotY<= snake_object_y9 + snake_object_height/2) {
    killCount = killCount+1;
    savedX = snake_object_x; // saves the x-coordinate where the snake get shot
    savedY = snake_object_y; // saves the y-coordinate where the snake get shot
    strike = true;
    // red
    strokeWeight(5);  // Thicker
    stroke(#e74c3c);
    line(50, mouseY-15, savedX, mouseY);
    // orange
    stroke(#e67e22);
    line(50, mouseY-10, savedX, mouseY);
    // yellow
    stroke(#f1c40f);
    line(50, mouseY-5, savedX, mouseY);
    // green
    stroke(#1abc9c);
    line(50, mouseY, savedX, mouseY);
    // blue
    stroke(#2c3e50);
    line(50, mouseY+5, savedX, mouseY);
    // purple
    stroke(#9b59b6);
    line(50, mouseY+10, savedX, mouseY);

    nonLoopingGif.play();
    player1.play(0);
    if (shotY>= snake_object_y - snake_object_height/2 && shotY<= snake_object_y + snake_object_height/2) {
      snake_object_x = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y2 - snake_object_height/2 && shotY<= snake_object_y2 + snake_object_height/2) {
      snake_object_x2 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y3 - snake_object_height/2 && shotY<= snake_object_y3 + snake_object_height/2) {
      snake_object_x3 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y4 - snake_object_height/2 && shotY<= snake_object_y4 + snake_object_height/2) {
      snake_object_x4 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y5 - snake_object_height/2 && shotY<= snake_object_y5 + snake_object_height/2) {
      snake_object_x5 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y6 - snake_object_height/2 && shotY<= snake_object_y6 + snake_object_height/2) {
      snake_object_x6 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y7 - snake_object_height/2 && shotY<= snake_object_y7 + snake_object_height/2) {
      snake_object_x7 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y8 - snake_object_height/2 && shotY<= snake_object_y8 + snake_object_height/2) {
      snake_object_x8 = 1100; // make the object dissapear
    } 
    else if (shotY>= snake_object_y9 - snake_object_height/2 && shotY<= snake_object_y9 + snake_object_height/2) {
      snake_object_x9 = 1100; // make the object dissapear
    }
  } 
  if (strike == false) {
    // red
    strokeWeight(5);  // Thicker
    stroke(#e74c3c);
    line(50, mouseY-15, 1000, mouseY);
    // orange
    stroke(#e67e22);
    line(50, mouseY-10, 1000, mouseY);
    // yellow
    stroke(#f1c40f);
    line(50, mouseY-5, 1000, mouseY);
    // green
    stroke(#1abc9c);
    line(50, mouseY, 1000, mouseY);
    // blue
    stroke(#2c3e50);
    line(50, mouseY+5, 1000, mouseY);
    // purple
    stroke(#9b59b6);
    line(50, mouseY+10, 1000, mouseY);
  }
} 


void gameOver() {
  if (liveCount <= 0) {//How many lives the player has
    //background(play_background);
    background(#e74c3c);
    image(dead, width/2, height/2-50, 218, 200);
    smooth();
    image(replay, 500, 340, 70, 70);
  }
}



