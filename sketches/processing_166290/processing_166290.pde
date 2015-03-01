
Car car1;
Car car2;
Car car3;
   
void setup(){
  size(600,400);
  car1 = new Car(100);
  car2 = new Car(200);
  car3 = new Car(300);
}
 
void draw(){
  background(160);
  car1.display();
  car1.move();
  car2.display();
  car2.move();
  car3.display();
  car3.move();
     
    if (car1.x > width-30 || car1.x <0 || car2.x > width-30 || car2.x <0 || car3.x > width-30 || car3.x <0 ) {
      car1.xspeed = car1.xspeed*-1;
      car2.xspeed = car2.xspeed*-1;
      car3.xspeed = car3.xspeed*-1;
}
   
}
   
  
  

class Car {
  color c;
  float x;
  int y;
  float xspeed;
  int R;
  int G;
  int B;
     
  Car(int ypos) {
    y = ypos;
    x = 100;
    xspeed = random(2,9);
    R = 255;
    G = 255;
    B = 255;
   
  }
  void display(){
    stroke(0);
    fill(c);
    rectMode(CENTER);
    
   
  }
  void move(){
     x = x + (xspeed);
  if (x > width-30 || x < 0){
    R = int(random(255));
    G = int(random(255));
    B = int(random(255));
    }
    fill(R,G,B);
    rect(x,y,35,15);
  }
      
}


