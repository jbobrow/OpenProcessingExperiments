
Ship ship1;
Ship ship2;
Ship ship3;


void setup(){
  size(800, 600); // 
  ship1 = new Ship(width/2, 150.0);
  ship2 = new Ship(width/2, 300.0);
  ship3 = new Ship(width/2, 450.0);

  frameRate(20);
  
}
void draw() {
  background(255);

  ship1.move(); 
  ship1.display();
  ship2.move();
  ship2.display();
  ship3.move();
  ship3.display();

  if (abs(ship1.sizeX - ship2.sizeX) <=2) {
    ship1.freeze();
    ship2.freeze();
  }
  if (abs(ship2.sizeX - ship3.sizeX) <=2) {
    ship2.freeze();
    ship3.freeze();
  }
}

// I can't figure out how to stop move function
class Ship {
  float low; 
  float high; 
  float sizeX;
  float sizeY;
  float posX;
  float posY;

  Ship(float tPosX, float tPosY) { // A constructor.
    low = 50;
    high = 500;
    posX = tPosX;
    posY = tPosY;
  }
  void move(){
    sizeX=random(low, high);
    sizeY=10;
  }
  void display() { // Function.
    rectMode(CENTER);
    fill(0);
    rect(posX,posY,sizeX,sizeY);
  }
  void freeze() {
    rectMode(CENTER);
    fill(0);
    noLoop();
  }
  }





