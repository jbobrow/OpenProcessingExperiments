
Car car1;
Car car2;
Car car4;
Car car3;
Car car5;
Car car6;
Car car7;
Car car8;
Dark d1;
Dark d2;
Dark d3;
Dark d4;
Dark d5;

void setup() {
  size(600,600);
  float r1 = random(4);
  float r2 = random(4);
  float r3 = random(4);
  float r4 = random(4);
  float r5 = random(4);
  float r6 = random(4);
  float r7 = random(4);
  float r8 = random(4);
  float r9 = random(4);
  float r10 = random(4);
  float r11 = random(4);
  float r12 = random(4);
  float r13 = random(4);
  car1 = new Car(color(255,0,0),15,100,r1);
  car2 = new Car(color(0,0,255),0,12.5,r2);
  car3 = new Car(color(0,255,0),27,150,r3);
  car4 = new Car(color(255,0,255),54,185,r4);
  car5 = new Car(color(255,255,255),300,300,r5);
  car6 = new Car(color(0,255,255),0,400.5,r6);
  car7 = new Car(color(111,100,0),27,500,r7);
  car8 = new Car(color(255,0,113),54,575,r8);
  d1 = new Dark(color(150,150,150),100,50,r9);
  d2 = new Dark(color(100,0,100),200,60,r10);
  d3 = new Dark(color(200,200,0),300,70,r11);
  d4 = new Dark(color(50,50,150),400,60,r12);
  d5 = new Dark(color(150,100,50),500,50,r13);
}

void draw() {
  background(0);
  car1.drive();
  car1.display();
  car2.drive();
  car2.display();
  car3.drive();
  car3.display();
  car4.drive();
  car4.display();
  car5.drive();
  car5.display();
  car6.drive();
  car6.display();
  car7.drive();
  car7.display();
  car8.drive();
  car8.display();
  d1.drive();
  d1.display();
  d2.drive();
  d2.display();
  d3.drive();
  d3.display();
  d4.drive();
  d4.display();
  d5.drive();
  d5.display();
}

class Car{
  color c;
  float x;
  float y;
  float speed;

Car(color tempC, float tempx, float tempy, float tempSpeed) {
  c = tempC;
  x = tempx;
  y = tempy;
  speed = tempSpeed;
}

void display() {
  stroke (0);
  fill(c);
  rectMode(CENTER);
  ellipse(x,y,25,25);
}

void drive() {
  x = x+speed;
  if (x > width) {
    float r = random(550);
    x = r;
    speed = speed+1;
  }
  if (speed > 100) {
    float p = random(3);
    speed = p;
  }
}
}
class Dark {
  color c;
  float x;
  float y;
  float speed;
  
Dark(color tempC, float tempx, float tempy, float tempSpeed) {
  c = tempC;
  x = tempx;
  y = tempy;
  speed = tempSpeed;
}  
void display() {
  stroke (0);
  fill(c);
  rectMode(CENTER);
  rect(x,y,30,30);
}
void drive() {
  y = y+speed;
  if (y > height) {
    float r = random(550);
    y = r;
    speed = speed+1;
  }
  if (speed > 100) {
    float p = random(3);
    speed = p;
  }
}
}

                
                
