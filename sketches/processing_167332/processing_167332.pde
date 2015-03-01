
Car car1;
Car car2;
Car car3;
 
void setup(){
  size(800,800);
  car1 = new Car(100);
  car2 = new Car(250);
  car3 = new Car(400);
}
void draw(){
  background(123,191,187);
 
  car1.display();
  car1.move();
  car2.display();
  car2.move();
  car3.display();
  car3.move();
   
    if (car1.x > width-20 || car1.x <0 ||
      car2.x > width-20 || car2.x <0 ||
      car3.x > width-20 || car3.x <0 ) {
      car1.speed = car1.speed*-1;
      car2.speed = car2.speed*-1;
      car3.speed = car3.speed*-1;
}
 
}
 
class Car {
  float x;
  int y;
  float speed;
  int r;
  int g;
  int b;
   
  Car(int a) {
    y = a;
    x = 100;
    r = 255;
    g = 255;
    b = 255;
    speed = random(2,7);
 
  }
  void display(){
    if (x > width-20 || x < 0){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    }
    fill(r,g,b);
    rect(x,y,40,10);
     
 
  }
  void move(){
     x = x + (speed);
   }
    
}
     

