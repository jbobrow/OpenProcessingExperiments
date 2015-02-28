
ButterFly butterfly1;
ButterFly butterfly2;
ButterFly butterfly3;
ButterFly butterfly4;
ButterFly butterfly5;
ButterFly butterfly6;
ButterFly butterfly7;
ButterFly butterfly8;
ButterFly butterfly9;
ButterFly butterfly10;



 
void setup() {
  size(500, 500);
  

  butterfly1 = new ButterFly(random(width), random(height),random(10), 50);
  butterfly2 = new ButterFly( random(width), random(height),random(10), 50);
  butterfly3 = new ButterFly( random(width), random(height), random(10), 50);
  butterfly4 = new ButterFly( random(width), random(height), random(10), 50);
  butterfly5 = new ButterFly( random(width), random(height), random(10), 50);
  butterfly6 = new ButterFly(random(width), random(height),random(10), 50);
  butterfly7 = new ButterFly( random(width), random(height),random(10),50);
  butterfly8 = new ButterFly( random(width), random(height), random(10), 50);
  butterfly9 = new ButterFly( random(width), random(height), random(10), 50);
  butterfly10 = new ButterFly( random(width), random(height), random(10), 50);
}
 
 
void draw() {
 

 background(50,200,50);

 
  butterfly1.move();
  butterfly1.display();
  butterfly2.move();
  butterfly2.display();
  butterfly3.move();
  butterfly3.display();
  butterfly4.move();
  butterfly4.display();
  butterfly5.move();
  butterfly5.display();
  butterfly6.move();
  butterfly6.display();
  butterfly7.move();
  butterfly7.display();
  butterfly8.move();
  butterfly8.display();
  butterfly9.move();
  butterfly9.display();
  butterfly10.move();
  butterfly10.display();
  
}
 
 
class ButterFly {
  
  float x;
  float y; 
  float xspeed;
  float yspeed;
  float Flysize;
  PImage ima;
  
   
  
 
  ButterFly( float tempX, float tempY,  float tempXspeed, float s) {
    
    x=tempX;
    y=tempY; 
    xspeed=tempXspeed;
    yspeed=tempXspeed;
    Flysize=s;
    ima = loadImage("butterfly.png");

  }
 
  void display() {
    
   image(ima,x,y,Flysize,Flysize);
   
   
   
  }
 
  void move() {
    //random also can have a range
    x=random(100,400);
     y=y-yspeed;
    
    }
  }



