
/* @pjs preload="red_ship.png"; */
/* @pjs preload="giga_ship.png"; */
float timer = 0.0;

//top down class
class TopDownRotater
{
  PImage image;
  float timer;
  PVector position;
  PVector direction;
  PVector velocity;
  float rotateSpeed;
  float speed;
}
TopDownRotater ship;

//directions
float left =0;
float right =0;
float up =0;
float down =0;

void setup(){
 size(600, 600);
  ship = new TopDownRotater();
  ship.image = loadImage("red_ship.png");
  ship.position = new PVector(300, 300);
  ship.direction = new PVector(0,1);
  ship.velocity = new PVector(0,0);
  ship.speed = 1;
  ship.rotateSpeed = .1;
  ship.timer = 0;
}

void draw(){
 background(39, 38, 38);
//movement
rotate2D(ship.direction, ship.rotateSpeed * (left + right));

ship.velocity.x = ship.direction.x * (ship.speed * (up + down));
ship.velocity.y = ship.direction.y * (ship.speed * (up + down));

ship.position.add(ship.velocity);

pushMatrix();
translate(ship.position.x, ship.position.y);
rotate(ship.direction.heading2D());
imageMode(CENTER);
image(ship.image, 0, 0);
popMatrix();
}

void rotate2D(PVector v, float theta)
{
  float m = v.mag();
  float a = v.heading2D();
  a += theta;
  v.x = m * cos(a);
  v.y = m * sin(a);
}

void keyPressed(){
  if (keyCode == RIGHT)
  {
    right = 1;
  }
  
  if (keyCode == LEFT)
 {
   left = -1;
 } 
 
  if (keyCode == UP)
 {
   up = -10;
 } 
 
 if (keyCode == DOWN)
 {
   down = 10;
 } 
 
 if (key == 'e')
 {
  ship.image = loadImage("giga_ship.png");
 }
 

  
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    right = 0;
  }
  
  if (keyCode == LEFT)
 {
   left = 0;
 } 

 if (keyCode == UP)
 {
   up = 0;
 } 
 
 if (keyCode == DOWN)
 {
   down = 0;
 }
 
  if (key == 'e')
 {
  ship.image = loadImage("red_ship.png");
 } 
}


