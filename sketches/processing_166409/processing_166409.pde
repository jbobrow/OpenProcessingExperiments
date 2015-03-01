
Car myCar1;
Car myCar2;
Car myCar3;
  
void setup(){
  size(800,600);
  myCar1 = new Car(75);
  myCar2 = new Car(200);
  myCar3 = new Car(325);
}

void draw(){
  background(120);
  
  myCar1.display();
  myCar1.move();
  myCar2.display();
  myCar2.move();
  myCar3.display();
  myCar3.move();
    
    if (myCar1.x > width-20 || myCar1.x < 0 || myCar2.x > width-20 || myCar2.x < 0 || myCar3.x > width-20 || myCar3.x < 0 ) {
      myCar1.xspeed = myCar1.xspeed*-1;
      myCar2.xspeed = myCar2.xspeed*-1;
      myCar3.xspeed = myCar3.xspeed*-1;
    }
  }
  
  class Car {
    float x;
    int y;
    float xspeed;
    int r;
    int g;
    int b;
    
  Car(int ypos) {
    y = ypos;
    x = 100;
    xspeed = random(5,15);
    r = 255;
    g = 255;
    b = 255;
  }
  
 void display(){
   if (x > width-20 || x < 0){
   r = int(random(255));
   g = int(random(255));
   b = int(random(255));
   }
   
    fill(r,g,b);
    rect(x,y,20,15);
  }
  
 void move(){
    x = x + (xspeed);
  }
}



