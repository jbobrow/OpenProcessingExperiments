
  Car myCar01;
  Car myCar02;
  Car myCar03;
  
void setup(){  
  size(1300, 200);
  myCar01=new Car(20,color(150,200,0),20, 10);
  myCar02=new Car(30,color(0, 150, 150), 80,100);
  myCar03=new Car(50,color(220,200,0), 150, 15);
}
 
void draw() {
  background(180);
  fill(245);
  rect(650,50,1300,3);
  rect(650,120,1300,3);
  myCar01.move();
  myCar02.move();
  myCar03.move();
  myCar01.bounce();
  myCar02.bounce();
  myCar03.bounce();
  myCar01.display();
  myCar02.display();
  myCar03.display();
}

  class Car {
  float x_position;
  float carsize;
  color cr;
  float y_position;
  float x_speed;
  
 
  Car(float Sz,color Cr, float Y, float car_speed) {
    x_position=0;
    cr=Cr;
    carsize=Sz;
    y_position=Y;
    x_speed=car_speed;
  }
 
  void move() {
    x_position=x_position+x_speed;
  }
  
  void bounce(){
    //if x_position reach to the end of the wall
    if (x_position > width || x_position<0) {
      //inverse the speed
      x_speed=x_speed*-1;
    }
  }
  
    void display() {
    fill(30);  
    rectMode(CENTER);
    rect(x_position-carsize*0.3, y_position-carsize*0.3, carsize*0.2, 3);
    rect(x_position+carsize*0.3, y_position-carsize*0.3, carsize*0.2, 3);
    rect(x_position-carsize*0.3, y_position+carsize*0.3, carsize*0.2, 3);
    rect(x_position+carsize*0.3, y_position+carsize*0.3, carsize*0.2, 3);
    noStroke();
    fill(cr);
    rect(x_position, y_position, carsize, carsize*0.5);
    }
}

