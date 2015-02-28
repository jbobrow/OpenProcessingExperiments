
Ship ship1;
Ship ship2;
Ship ship3;
int StopNowYouDarnShip;
void setup(){
  size(600, 400); // 
  ship1 = new Ship(width/2, 100.0);
  ship2 = new Ship(width/2, 170.0);
  ship3 = new Ship(width/2, 260.0);
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


if(abs(ship1.sizeX-ship3.sizeX) <= StopNowYouDarnShip){
  ship1.noMove = true;
  ship3.noMove = true;
  
}
if (abs(ship1.sizeX-ship2.sizeX) <= StopNowYouDarnShip){
  ship1.noMove = true;
  ship2.noMove = true;
}
if (abs(ship2.sizeX-ship3.sizeX) <= StopNowYouDarnShip){
  ship2.noMove = true;
  ship3.noMove = true;
}
}
class Ship {
  float low; 
  float high; 
  float sizeX;
  float sizeY;
  float posX;
  float posY;
  boolean noMove;
int x;
int y;



  Ship(float tPosX, float tPosY) { 
    low = 50;
    high = 500;
    posX = tPosX;
    posY = tPosY;
  }
  void move(){
    sizeX=random(low, high);
    sizeY=10;
      x = 4;
y = 7;
int diff = abs(x - y);
println(diff);
  }
  void display() {
    rectMode(CENTER);
    fill(0);
    rect(posX,posY,sizeX,sizeY);
  

println(ship1.sizeX);
println(ship2.sizeX);
println(ship3.sizeX);

  }
 

}


