
Car car1;
Car car2;
Car car3;

    
void setup(){
  size(700,600);
  car1 = new Car();
  car2 = new Car();
  car3 = new Car();
}
  
void draw(){
  background(50);
  
  car1.display();
  car1.move();
  
  car2.display();
  car2.move();
  
  car3.display();
  car3.move();
      
    if (car1.x > width-51 || car1.x <0 || 
    car2.x > width-51 || car2.x <0 || 
    car3.x > width-51 || car3.x <0 ) {
      car1.xspeed = car1.xspeed*-1;
      car2.xspeed = car2.xspeed*-1;
      car3.xspeed = car3.xspeed*-1;
}
    
}
    
   
   
 
class Car {
  float x;
  float y;
  float xspeed;
  int r;
  int g;
  int b;

  Car() {
    x = 100;
    y = random(height); //so everytime you run the code it's a different race because they are at random heights
    xspeed = random(3,13);
    r = 255;
    g = 255;
    b = 255;
    
  }
  void display(){
   rectMode(CENTER);
    stroke(0);
     
    
  }
  void move(){
     x = x + (xspeed);
  if (x > width-51 || x < 0){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
    }
    fill(r,g,b);
    rect(x,y,50,30);
    
  }
       
}
