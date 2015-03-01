
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/134378*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="tile.png"; */




int babies = 10;
boolean increaseSpeed = true;
int pos_x = 0;
float accel = 8;
float minAccel = 7;
float maxAccel = 15;
float timer = 0;
float setupTimer = 0;
float player_speed=0;
float max_player_speed=20;
int margin = 32;
String gameMode = "start";
String score = "this this this";
String[] scores = split(score, ' ');

class Asteroid
{
  float x = width+16;
  float y = random(16, height-16);
  float r = 80;
  float hp=10;
}
class Food
{
  float x = width+16;
  float y = random(16, height-16);
  float r = 16;
}
class Ship
{
  float x=0;
  float y=0;
  float r=0;
  int hp=3;
  int maxHp=5;
  int speed = 16;
  boolean up=false;
  boolean down=false;
}

Food[] foods = new Food[1];
Asteroid[] asteroids = new Asteroid[1];
Ship player =  new Ship();

void setup() {
  rectMode(CENTER);
  ellipseMode(RADIUS);
  noStroke();
  size(720, 480);
   frameRate = 30;
  for (int i = 0; i<asteroids.length; i +=1) {
    asteroids[i] = new Asteroid();
    asteroids[i].x= width + random(width);
    asteroids[i].r=height/2;
  }
  for (int i = 0; i<foods.length; i ++) {
    foods[i] = new Food();
    foods[i].x= width + random(width);
    foods[i].r=margin;
  }

  player.y=height/2;
  player.x=margin*2;
  player.r=margin*2;
}

void draw() {
 // saveFrame("Demo1-####.tif");
  rectMode(LEFT);
  fill(255, 50);
  rect(0, 0, width, height);
  rectMode(CENTER);
  if (gameMode == "start") {
  
    fill(random(255), random(255), random(255));
    textSize(100);
    textMode(CENTER);
    text("Avoidance", margin, height/2);
    textSize(60);
    text("Press [space] to Start", margin, int(height*.75));
  }

  if (gameMode == "play") {
   
    if (player.hp > 0) {
      //game loop
      /////////////////////SPEED CONTROL/////////////////////
      if (increaseSpeed) {
        if (accel<=maxAccel) {
          if (accel<accel+5) {
            accel+=.5/frameRate;
          }
          else {
            accel+=1/frameRate;
          }
        }
        else {
          increaseSpeed=false;
          maxAccel+=2;
        }
      }
      if (!increaseSpeed) {
        if (accel>8) {
          accel-=2/frameRate;
        }
        else {
          increaseSpeed=true;
        }
      }


      //////////////////////SCROLLING BACKGROUND////////////////
      fill(255, 20);
      rectMode(LEFT);
      rect(0, 0, width, height);
      /////////////////////////////////PLAYER MOVEMENT//////////////////////////////
      if (player.down&&player.y<height-margin) {
        player.y+=player.speed;
      }
      if (player.up&&player.y>margin*2.5) {
        player.y-=player.speed;
      }
      //////////////////////////////////PLAYER MODEL///////////////////////////////
      fill(random(200, 255), random(255), random(255),150);
      ellipse(player.x, player.y, margin, margin); 
      //////////////////////////////////FOOD HIT DETECTION///////////////////////////////
      for (int i=0;i<foods.length;i++) {
        foods[i].x-=accel;
        if (player.x +player.r > foods[i].x 

          && player.x -player.r < foods[i].x
          && player.y -player.r < foods[i].y
          && player.y +player.r > foods[i].y
          ) {
          foods[i].x=-64;
          foods[i].y=random(margin, height-margin);

          if (player.hp<player.maxHp) {
            player.hp++;
            fill(100, 255, 200);
            triangle(player.x-64, player.y-64, player.x-64, player.y+64, player.x+64, player.y);
          }
        }
        //////////////////////////////////FOOD MODELS///////////////////////////////
        ellipse(foods[i].x, foods[i].y, foods[i].r, foods[i].r);


        if (foods[i].x<0&&player.hp<5) {
          foods[i].x=width+margin;
          foods[i].y=random(margin*2, height-margin);
        }
        else if (foods[i].x<0&&player.hp==5) {
          foods[i].x=-64;
          foods[i].y=-64;
        }
      }

      ////////////////////ASTEROID HIT DETECTION////////////////
      for (int i=0;i<asteroids.length;i++) {
        asteroids[i].x-=accel;

        if (player.x +asteroids[i].r*.6 > asteroids[i].x 
          && player.x -asteroids[i].r*.6 < asteroids[i].x
          && player.y -asteroids[i].r*.6 < asteroids[i].y
          && player.y +asteroids[i].r*.6 > asteroids[i].y
          ) {
          asteroids[i].x=-200;
          asteroids[i].y=height/2;
          player.hp-=1;
          fill(255, 0, 0);
          triangle(player.x-64, player.y, player.x+32, player.y+32, player.x+32, player.y-32);
          //background(255, 255, 0);
        }
        rectMode(CENTER);
        fill(0);
        rect(asteroids[i].x, asteroids[i].y, asteroids[i].r, asteroids[i].r);
        //image(gypsy, asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);

        /////////////////Asteroid respawn///////////////////////
        if (asteroids[i].x<0-asteroids[i].r) {
          asteroids[i].x=width+asteroids[i].r;
          asteroids[i].y=random(margin*2, height-margin);
        }
      }
      ///////////////////GUI//////////////////////////
      textSize(margin*2);
      fill(0);
      textAlign(RIGHT);
      text(int(timer), width-margin/4, margin*1.75);
      timer+=1/frameRate;
      fill(int(255/player.maxHp)*(player.maxHp-player.hp), int(255/player.maxHp)*player.hp, 0);
      for (int i=0;i<player.hp;i++) {
        ellipse( margin+margin*(i*2), margin, margin, margin);
      }
    }
    else {
      gameMode = "end";
      frameRate = 10;
    }
  }

  if (gameMode == "end") {//end game loop

    for (int i = 0; i < width; i+=(width/8)) {
      fill(random(255), random(255), random(255));
      rectMode(TOP);
      rect(i, 0, i+width/8, height);
    }
    score = ("Velocity=" + accel + " Timer=" + timer + " Location=" + int(player.y));
    scores = split(score, ' ');
    saveStrings("HighScores.txt", scores);
    //background(0);
    fill(255);
    textSize(48);
    textAlign(CENTER);
    for (int i=0;i<scores.length;i++) {
      text(scores[i], width/2, (margin*2)+(height/scores.length)*i);
    }
    textSize(24);
    text("Press [space] to Start.", width/2, height - margin);
    gameMode = "start";
    noLoop();
  }
}

void keyPressed() {
  if (key==' ') {

    if (gameMode=="start") {
      timer=0;
      player.hp=3;
      accel = 8;
      increaseSpeed = true;

      for (int i=0;i<asteroids.length;i++) {
        asteroids[i].x=width+random(width);
        asteroids[i].y=random(margin, height-margin);
      }
      for (int i=0;i<foods.length;i++) {
        foods[i].x=width+random(width);
        foods[i].y=random(margin, height-margin);
      }
      loop();
      gameMode = "play";
    }

    if (gameMode == "end") {
      gameMode = "start";
    }
  }
  if (key == CODED) {
    if (keyCode==UP) {
      player.up=true;
      player.down=false;
    }
    if (keyCode==DOWN) {
      player.down=true;
      player.up=false;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode==UP) {
      player.up=false;
    }
    if (keyCode==DOWN) {
      player.down=false;
    }
  }
}



