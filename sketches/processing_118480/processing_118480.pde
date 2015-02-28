
Ship ship1;
Ship ship2;
Ship ship3;
int range;


void setup(){
  size(800, 600); 
  frameRate(20); 
  ship1 = new Ship(width/2, 100.0);
  ship2 = new Ship(width/2, 300.0);
  ship3 = new Ship(width/2, 500.0);
  range = 3;
  
}
void draw() {
  background(255);

  ship1.move();
  ship2.move(); 
  ship3.move();
  if (abs(ship1.sizeX - ship2.sizeX) <= range) {
    ship1.freeze = true;
    ship2.freeze = true;
  }
  if (abs(ship1.sizeX - ship3.sizeX) <= range) {
    ship1.freeze = true;
    ship3.freeze = true;
  }
  if (abs(ship2.sizeX - ship3.sizeX) <= range) {
    ship2.freeze = true;
    ship3.freeze = true;
  }
  
  
  ship1.display();
  ship2.display();
  ship3.display();
   
}

class Ship {
  float low; 
  float high; 
  float sizeX;
  float sizeY;
  float posX;
  float posY;
  boolean freeze;

  Ship(float tPosX, float tPosY) {
    freeze = false;
    low = 50;
    high = 500;
    posX = tPosX;
    posY = tPosY;
  }
  void move(){
    sizeY=10;
    if (!freeze) {
    sizeX=random(low, high);
    
    }    
    
      
  }
  void display() {
    rectMode(CENTER);
    fill(0);
    rect(posX,posY,sizeX,sizeY);

  }
  
}


