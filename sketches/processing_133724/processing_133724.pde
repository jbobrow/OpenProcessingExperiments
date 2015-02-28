
class Asteroid
{
  float x = random(16, width-16);
  float y = -100;
  float radius = 20;
  float hp=100;
}
class Ship 
{
  float x=0;
  float y=0;
  float w=50;
  float h=20;
  boolean right=false;
  boolean left=false;
}

Asteroid[] asteroids = new Asteroid[8];
Ship player =  new Ship();

void setup() {

  size (480, 640);
  for (int i = 0; i<asteroids.length; i +=1) {
    asteroids[i] = new Asteroid();
   
      background(255,0,0);
    }
  
  player.y=height-64;
  player.x=width/2;
}

void draw() {
  background(255);
  fill(0);
  if (player.left&&player.x>10) 
  {
    player.x-=10;
  }
  if (player.right&&player.x<width-10) 
  {
    player.x+=10;
  }
  rectMode(CENTER);
  rect(player.x, player.y, player.w, player.h);
  if (asteroids.length<8) {
    int a=asteroids.length;
    asteroids[a]= new Asteroid();
  }
  for (int i=0;i<asteroids.length;i++) {
    asteroids[i].y+=1;
    ellipse(asteroids[i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);


    if (asteroids[i].y>height) {
      asteroids[i].x=random(16, width-16);
      asteroids[i].y=0;
    }
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode==RIGHT) {
      player.right=true;
    }
    if (keyCode==LEFT) {
      player.left=true;
    }
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode==RIGHT) {
      player.right=false;
    }
    if (keyCode==LEFT) {
      player.left=false;
    }
  }
}



