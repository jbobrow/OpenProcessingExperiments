
PImage forward;
float forwardX = 0;
float forwardY = 0;
float forwardSpeedX = 3.0;
float forwardSpeedY = 3.0;
int forwardWidth = 100;
int forwardHeight = 89;

PImage defender;
float defenderX = 0;
float defenderY = 0;
float defenderSpeedX = 1.0;
float defenderSpeedY = 1.0;
int defenderWidth = 100;
int defenderHeight = 109;

PImage puck;
float puckX = 0;
float puckY = 0;
float puckSpeedX = 4.0;
float puckSpeedY = 4.0;
int puckWidth = 64;
int puckHeight = 64;

PImage rink;
int gameWidth = 800;
int gameHeight = 402;
int radius = 32;

void setup() {
  
  rink = loadImage("rink.png");                        
  forward = loadImage("forward.png");                  
  defender = loadImage("defender.png");                
  puck = loadImage("puck.png");                        
  
 
  forwardX = random(0, gameWidth - forwardWidth);      
  forwardY = random(0, gameHeight - forwardHeight);    
  defenderX = random(0, gameWidth - defenderWidth);    
  defenderY = random(0, gameHeight - defenderHeight);  
  puckX = random(0, gameWidth - puckWidth);            
  puckY = random(0, gameHeight - puckHeight);         
  
  size(gameWidth, gameHeight);                         
  background(0xFFFFFF);                                
  smooth();                                            
  noStroke();                                          
  ellipseMode(RADIUS);                                 
}

void draw() {
  image(rink, 0, 0);       
  float changeX = 0;       
  float changeY = 0;       
  
  puckSpeedX = updateSpeedDirection(gameWidth, puckX, puckWidth, puckSpeedX);     
  puckSpeedY = updateSpeedDirection(gameHeight, puckY, puckHeight, puckSpeedY);   
  puckX += puckSpeedX; 
  puckY += puckSpeedY; 
  
  changeX = calculateChange(gameWidth, forwardX, puckX, forwardSpeedX);    
  changeY = calculateChange(gameHeight, forwardY, puckY, forwardSpeedY);  
  forwardX += changeX;  
  forwardY += changeY; 
  
  changeX = calculateChange(gameWidth, defenderX, forwardX, defenderSpeedX);     
  changeY = calculateChange(gameHeight, defenderY, forwardY, defenderSpeedY);   
  defenderX += changeX; 
  defenderY += changeY; 
  
  if (checkCollision(forwardX, forwardY, radius, puckX, puckY, radius)) {
    puckX = random(0, gameWidth - puckWidth);     
    puckY = random(0, gameHeight - puckHeight);   
  }
  if (checkCollision(forwardX, forwardY, radius, defenderX, defenderY, radius)) {
    forwardX = random(0, gameWidth - forwardWidth);    
    forwardY = random(0, gameHeight - forwardHeight);   
  }
  
  image(forward, forwardX, forwardY); 
  image(defender, defenderX, defenderY); 
  image(puck, puckX, puckY); 
}

float calculateChange(float bounds, float coordinate1, float coordinate2, float speed) {
  float change = 0;
  float distance = coordinate1 - coordinate2;
  if (distance > 0) {
    change = -speed;
  } else if (distance < 0) {
    change = speed;
  }
  return change;
}

float updateSpeedDirection(float bounds, float coordinate, float size, float speed) {
  float s = speed;
  if (coordinate + size > bounds || coordinate < 0) {
    s *= -1;
  }
  return s;
}

boolean checkCollision(float x1, float y1, float width1, float x2, float y2, float width2) {
  float combinedRadii = (width1 / 2) + (width2 / 2);
  float distance = dist(x1, y1, x2, y2);
  if (combinedRadii > distance) 
    return true;
  
  return false;}


