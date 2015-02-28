
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/134378*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="gypsy.png"; */
/* @pjs preload="food.png"; */
/* @pjs preload="baby.png"; */
/* @pjs preload="player.png"; */
/* @pjs preload="tile.png"; */
class Asteroid
{
  float x = width+16;
  float y = random(16, height-16);
  float radius = 64;
  float hp=100;
}
class Food
{
  float x = width+16;
  float y = random(16, height-16);
  float w=64;
  float h=64;
}
class Ship
{
  float x=0;
  float y=0;
  float w=128;
  float h=64;
  boolean up=false;
  boolean down=false;
}
class bullet
{
  float bullet_x;
  float bullet_y;
  float bullet_speed;
  float bullet_max_speed=20;
}

Food[] foods = new Food[4];
Asteroid[] asteroids = new Asteroid[8];
Ship player =  new Ship();

PImage ground;
PImage food;
PImage gypsy;
PImage baby;
PImage playerImg;
int x_pos = 0;
int babies = 3;
int foodItems=0;
float accel = 0;
float timer = 10.00;
float setupTimer = 0;
//float player_x=mouseX;
//float player_y=mouseY;
float player_speed=0;
float max_player_speed=20;





void setup() {

  size(640, 480);
  for (int i = 0; i<asteroids.length; i +=1) {
    asteroids[i] = new Asteroid();
    asteroids[i].x= width + random(width);
  }
  for (int i = 0; i<foods.length; i ++) {
    foods[i] = new Food();
    foods[i].x= width + random(width);
  }

  player.y=height/2;
  player.x=64;
  ground = requestImage("tile.png");
  food = requestImage("food.png");
  baby = requestImage("baby.png");
  playerImg = requestImage("player.png");
  gypsy = requestImage("gypsy.png");
}

void draw() {
  if (gypsy.width > 0) {

    if ((int(timer)+.5)>0) {
      for (int i=0;i<babies;i++) {
        image(baby, 64*i, 48, 64, 64);
      }

      if (x_pos<48) {
        x_pos+=4;

        for (int i=0;i<width+x_pos;i+=48) {
          image(ground, i-x_pos, 0, 48, 480);
        }
        if (x_pos>47) {
          x_pos=0;
        }
      }

      if (player.down&&player.y<height-64) {
        player.y+=10;
      }
      if (player.up&&player.y>64) {
        player.y-=10;
      }
      rectMode(CENTER);

      image(playerImg, player.x, player.y, player.w, player.h);

      for (int i=0;i<foods.length;i++) {
        foods[i].x-=(8+accel);
        if (player.x +player.w/2 > foods[i].x 

          && player.x -player.w/2 < foods[i].x
          && player.y -player.h/2 < foods[i].y
          && player.y +player.h/2 > foods[i].y
          ) {
          foods[i].x=width+16;
          foods[i].y=random(16, height-16);
          foodItems+=1;
        }

        image(food, foods[i].x, foods[i].y, foods[i].w, foods[i].h);


        if (foods[i].x<0) {
          foods[i].x=width+10;
          foods[i].y=random(16, height-16);
        }
      }

      for (int i=0;i<asteroids.length;i++) {
        asteroids[i].x-=8+accel;
        //float py = width+64-player.w-asteroids[i].radius;

        if (player.x +player.w/2 > asteroids[i].x 

          && player.x -player.w/2 < asteroids[i].x
          && player.y -player.h/2 < asteroids[i].y
          && player.y +player.h/2 > asteroids[i].y
          ) {
          asteroids[i].x=width+16;
          asteroids[i].y=random(16, height-16);
          background(255, 255, 0);
        }

        image(gypsy, asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);


        if (asteroids[i].x<0) {
          asteroids[i].x=width+10;
          asteroids[i].y=random(16, height-16);
        }
      }

      textSize(36);
      text("time:" +int(timer+.5), width-64, 48, width/4, width/8);
      timer-=1/frameRate;
      accel += .01;
    }



    if (int(timer+.5)==0) {
      background(255, 0, 0);

      text("Time is up", width/2, height/2, 256, 128);
    }
  }
}


void keyPressed() {
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




