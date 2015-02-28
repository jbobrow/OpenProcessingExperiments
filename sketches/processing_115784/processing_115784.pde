
Car car1;
Car car2;
Car car3;

void setup(){
  size(600, 400); // 
  car1 = new Car(width/2, 100.0);
  car2 = new Car(width/2, 200.0);
  car3 = new Car(width/2, 300.0);
  
}
void draw() {
  background(225);
  car1.move(); 
  car1.display();
  car2.move();
  car2.display();
  car3.move();
  car3.display();

}


class Car {
  float low; 
  float high; 
  float sizeX;
  float sizeY;
  float posX;
  float posY;
  float xspeed;

  Car(float tPosX, float tPosY) { 
    low = 50;
    high = 500;
    posX = tPosX;
    posY = tPosY;
    xspeed = random(3);
  }
  void move(){
    sizeX = random(low, high);
    sizeY = 10;
    posX = posX + xspeed; {
    if (posX < 0)
      xspeed = 3; }
      {
    if (posX > width) 
      xspeed = -3; }
      
  }
  
  void display(){ 
    rectMode(CENTER);
    stroke(2);
    color(50,25,25,200);
    fill(0);
    rect(posX,posY,30,15);
  }
  

  }


