
Car car1;
Car car2;
Car car3;

int x = 8;

void setup(){
  size(600,400);
  car1 = new Car(100,5,30);
  car2 = new Car(50,170,60);
  car3 = new Car(200,15,15);
}

void draw(){
  background(255);
  car1.move();
  car2.move();
  car3.move();
  
  if(car1.xpos + 8 > width || car2.xpos + 8 > width || car3.xpos + 8 > width){
    car1.bounce(-1);
    car2.bounce(-1);
    car3.bounce(-1);
  } 
  if(car1.xpos - 8 < 0 || car2.xpos - 8 < 0 || car3.xpos - 8 < 0){
    car1.bounce(1);
    car2.bounce(1);
    car3.bounce(1);
  }
  
  car1.drawCar(100,16);
  car2.drawCar(200,16);
  car3.drawCar(300,16);
}

class Car {
  color colorC;
  int xpos;
  int xspeed;
  
  Car(int a, int b, int c){
    xpos = 8;
    colorC = color(a,b,c);
    xspeed = int(random(4,10));
  }
  
  void move(){
    xpos = xpos + xspeed;
  }

  void bounce(int direction){
      xspeed = int(random(4,10));
      xspeed = xspeed * direction;
      colorC = color(random(0,255),random(0,255),random(0,255));
  }

  void drawCar(int y, int thesize){
    rectMode(CENTER);
    stroke(200);
    fill(colorC);
    rect(xpos,y,thesize,thesize); 
  } 
}


