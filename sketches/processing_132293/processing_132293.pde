



// vierkantje breedte en hoogte

float playerWidth;
float playerHeight;

// muntje breedte, hoogte, positie en twist motion

float circleLocationX;
float circleLocationY;
float circleRadius;
int draai;

//puntensysteem

int punten;
int motion;
int multiplier;
int health;

//afbeeldingen

PImage instructions;
PImage dead;
boolean alive;

// systeem om te springen met zwaartekracht etc. 
 
 
 
 
 
 
 
 
 
class Orange
{
  
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed;
  float walkSpeed;
}
 
 
Orange player;
float left;
float right;
float up;
float down;
 

float gravity = 1;
 

float ground = 595;














 
void setup()
{
 
//variabelen een waarde geven. 
 
playerWidth = 50;
playerHeight = 50;


circleLocationX = random(5,1260);
circleLocationY = 100;
circleRadius = 15.0;
draai=30;

punten = 0;
motion = 6;
multiplier = 1;
health = 10;
alive=true;  


// spel afmetingen en snelheid bepalen

  
  size(1280, 720);
  frameRate(80);
  
  // class aanroepen etc
   
  player = new Orange();
  player.position = new PVector(600, ground);
  player.direction = 1;
  player.velocity = new PVector(0, 0);
  player.jumpSpeed = 16;
  player.walkSpeed = 7;
  
  
//afbeeldingen aanroepen  
  
  instructions = loadImage("instructions.png");
  dead = loadImage("dead.png");
  
  
  
}
 
void draw()
{
  
  
  
  
  Background();
  image(instructions,4,631);
  muntje();
  updateplayer();
  collide();
  pointy();
  
  
 
  
  
  
  
  
  
  

 
 
 
}
 
 
 
 
// beweging van de speler


 
void updateplayer()
{
 
  if (player.position.y < ground)
  {
    player.velocity.y += gravity;
  }
  else
  {
    player.velocity.y = 0;
  }
   

  if (player.position.y >= ground && up != 0)
  {
    player.velocity.y = -player.jumpSpeed;
  }
   

  player.velocity.x = player.walkSpeed * (left + right);
   
 
  PVector nextPosition = new PVector(player.position.x, player.position.y);
  nextPosition.add(player.velocity);
   
  // Check collision with edge of screen and don't move if at the edge
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    player.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    player.position.y = nextPosition.y;
  }
   
   
   
   
// de speler zelf



  rectMode(CENTER);
  stroke(0);
  fill(238,78,0);
  rect(player.position.x,player.position.y,playerWidth, playerHeight);
   
  
}
 
 
// toetsen binden aan een beweging & reset 
 
void keyPressed()
{
  if (key == 'd')
  {
    right = 4;
    player.direction = -1;
  }
  if (key == 'a')
  {
    left = -4;
    player.direction = 1;
  }
  if (alive == true){
  if (key == ' ')
  {
    up = -1;
  }
  }
  if(alive == false){ if (key == ' ')
  {
    setup();
    
  }
  }
  
  if (key == 's')
  {
    down = 1;
  }

  
}
 
 
// stoppen met bewegen als je de toets loslaat.

 
void keyReleased()
{
  if (key == 'd')
  {
    right = 0;
  }
  if (key == 'a')
  {
    left = 0;
  }
  if (key == ' ')
  {
    up = 0;
  }
  if (key == 's')
  {
    down = 0;
  }
}


// de achtergrond scene + zwarte balken.


void Background(){
  
   background(14,61,64);
  
  rectMode(CORNER);
  noStroke();
  fill(0);
  rect(0,0,1280,100);
  
  noStroke();
  fill(0);
  rect(0,620,1280,100);


noStroke();
  fill(9,39,41);
  rect(0,100,1280,320); 
  
  noStroke();
  fill(9,41,43);
  rect(0,278,1280,160); 

  noStroke();
  fill(10,44,46);
  rect(0,375,1280,80); 
 
  noStroke();
  fill(11,46,48);
  rect(0,410,1280,40); 
  
  noStroke();
  fill(11,49,51);
  rect(0,428,1280,20);
  
  noStroke();
  fill(12,51,54);
  rect(0,438,1280,10);
  
  noStroke();
  fill(12,53,56);
  rect(0,448,1280,5);
  
  noStroke();
  fill(13,56,59);
  rect(0,452,1280,3);
  
  noStroke();
  fill(13,57,59);
  rect(0,455,1280,1);
  
  noStroke();
  fill(13,58,60);
  rect(0,456,1280,1);
  
  noStroke();
  fill(14,59,61);
  rect(0,457,1280,1);

 noStroke();
  fill(14,60,62);
  rect(0,458,1280,1);
  
   noStroke();
  fill(14,60,63);
  rect(0,459,1280,1);
  
   noStroke();
  fill(14,61,63);
  rect(0,460,1280,1);
  
}


// puntensysteem


void pointy(){
  
   
  fill(255,228,0);
   textSize(24);
  text("Points:",13,40);
  text( punten, 94, 40);
 
  
  fill(32,221,50);
  textSize(24);
  text("Multiplier: X",13,80);
  textSize(44);
  text( multiplier, 160, 80);
  
  fill(30,215,248);
   textSize(45);
  text("♥",581,64);
  text( health, 628, 65);
  
  if(health <= 0){
   image(dead,0,0);
   alive=false;
   
    }
     
  
  
  if(multiplier == 30){
  if(health <10){health= health+1; multiplier=31;}
  }
  if(multiplier == 60){
  if(health <10){health= health+1; multiplier=61;}
  }
  if(multiplier == 90){
  if(health <10){health= health+1;multiplier=91; }
  }
  if(multiplier == 120){
  if(health <10){health= health+1; multiplier=121;}
  }
  if(multiplier == 150){
  if(health <10){health= health+1; multiplier=151;}
  }
  if(multiplier == 180){
  if(health <10){health= health+1; multiplier=181;}
  }
  if(multiplier == 210){
  if(health <10){health= health+1;multiplier=211; }
  }
  if(multiplier == 240){
  if(health <10){health= health+1; multiplier=241;}
  }
  if(multiplier == 270){
  if(health <10){health= health+1;multiplier=271; }
  }
  if(multiplier == 300){
  if(health <10){health= health+1; multiplier=301;}
  }
}



// dit moet je vangen


void muntje(){
   fill(255,228,0);
  stroke(0);
  ellipse(circleLocationX, circleLocationY, draai, circleRadius*2);
  
  circleLocationY = circleLocationY + motion;
  draai = draai-2;
  if (draai < -30) { draai=26; }
  
  
  if (circleLocationY >610){
    circleLocationY = 100;
    circleLocationX = random(5,1250);
    multiplier = 1;
    health = health-1;
}
}
  
  
  
  
// collision event tussen het muntje en de speler  
  
  
void collide(){
   
  boolean collisionDetected = Collision(circleLocationX, circleLocationY, 
  circleRadius, player.position.x,player.position.y,playerWidth, playerHeight);
  
  boolean collisionDetected2 = Collision(circleLocationX, circleLocationY, 
  circleRadius, 430,75 , playerWidth, playerHeight);
  
  
  
  if ((collisionDetected == true) || (collisionDetected2 == true )) {
    
    multiplier = multiplier + 1;
    punten = punten+(1*multiplier);
    circleLocationX = random(5,1250);
    circleLocationY = 100;
  }
 
}
 
 boolean Collision(
      float circleX,
      float circleY,
      float radius,
      float rectangleX,
      float rectangleY,
      float rectangleWidth,
      float rectangleHeight)
{
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);
 
    if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
 
    if (circleDistanceX <= (rectangleWidth/2)) { return true; }
    if (circleDistanceY <= (rectangleHeight/2)) { return true; }
 
    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);
 
    return (cornerDistance_sq <= pow(radius,2));
}


  

 
 
 
  




