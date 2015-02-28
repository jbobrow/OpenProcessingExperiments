
/* @pjs preload="red_ship.png, giga_shoot.png, background.png"; */

//timers
float timer = 0.0;
float gameTimer = 20.0;
//images
PImage background;
//meteor papameters
float[] sphereX = new float [5];
float[] sphereY = new float [5];
float Msize = 40;
//score 
float score = 100;
//font
PFont font;
//booleans
boolean vert = true;
boolean horiz = true;



//top down class
class TopDownRotater
{
  PImage image;
  boolean pressed;
  boolean pressCount;
  boolean shield = false;
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
  font = loadFont("LilyUPCBoldItalic-48.vlw");
  textFont(font, 32);
  size(600, 600);
  ship = new TopDownRotater();
  ship.image = loadImage("red_ship.png");
  background = loadImage("background.png");
  ship.position = new PVector(500, 500);
  ship.direction = new PVector(0,1);
  ship.velocity = new PVector(0,0);
  ship.speed = 1;
  ship.rotateSpeed = .1;
  ship.pressed = false;
  ship.pressCount = false;



for(int i = 0; i <5; i++){
   sphereX[i] = random(10, 590); 
   sphereX[i] = random(10, 590); 
  }
   noCursor();
}

void draw(){
  //declare classes
  loseScreen LoseScreen = new loseScreen();
  winScreen WinScreen = new winScreen();
  if(score > 0){
  
  gameTimer -= .01;
   image(background, 300, 300);
 //ship mode
  if(ship.pressed == true)
 {
   timer += .0167;
 }
 
  if(timer > 2.0)
 {
  ship.image = loadImage("red_ship.png");
  ship.pressed = false;
  ship.shield = false;
  timer = 0; 
 }
//score showing
if(score > 75)
{
fill(42, 165, 18);
}
if(score <75 && score > 30)
{
  fill(246, 250, 38);
}
if(score < 30)
{
 fill(196, 14, 14); 
}

text("Health: " + score, 10, 20);

fill(255);
text("Time: " + gameTimer, 400, 20);



if(gameTimer <= 0)
{
  WinScreen.setup();
  WinScreen.draw();
}

 
//movement
//rotate2D(ship.direction, ship.rotateSpeed * (left + right));

ship.velocity.x = ship.direction.y * (ship.speed * (left + right));
ship.velocity.y = ship.direction.y * (ship.speed * (up + down));

ship.position.add(ship.velocity);

pushMatrix();
translate(ship.position.x, ship.position.y);
//rotate(ship.direction.heading2D());
imageMode(CENTER);
image(ship.image, 0, 0);
popMatrix();
//draw meteors

if(vert == true){
  for(int i =0; i < 5; i++){
    meteors(sphereX[i], sphereY[i]);
    sphereY[i] += 9.0;
    if(sphereY[i] > height){
     sphereX[i] = random(10, 590);
     sphereY[i] = -30;
     horiz = true; 
     vert = false;
    }
}}


if(horiz == true){
  for(int i =0; i < 5; i++){
    meteors(sphereX[i], sphereY[i]);
    sphereX[i] += 9.0;
    if(sphereX[i] > width ){
     sphereX[i] = -30;
     sphereY[i] = random(10, 590);
     vert = true; 
     horiz = true;
    }
}
}}

else{
  LoseScreen.setup();
  LoseScreen.draw();
}
}



//rotate 
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
    right = 10;
  }
  
  if (keyCode == LEFT)
 {
   left = -10;
 } 
 
  if (keyCode == UP)
 {
   up = -10;
 } 
 
 if (keyCode == DOWN)
 {
   down = 10;
 } 
 
   if (key == 'e' && ship.pressCount == false)
 {
  ship.image = loadImage("giga_shoot.png");
  ship.shield = true;
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
   ship.pressed = true;
   ship.pressCount = true;
 } 
 

}

void meteors(float x, float y){
  
    fill (82, 61, 28);
    ellipse(x, y, Msize, Msize);
    
    if(dist(x,y,ship.position.x,ship.position.y) < Msize && ship.shield == false)
    {
     score --; 
    }
}

class loseScreen{
  void setup(){
   background(0);
  }
  void draw(){
  textSize(100);
  fill(255);
  text("You lose", 175, 325); 
  }
}

class winScreen{
  void setup(){
   background(255);
  }
  void draw(){
  textSize(100);
  fill(0);
  text("You win", 175, 325); 
  }
}



