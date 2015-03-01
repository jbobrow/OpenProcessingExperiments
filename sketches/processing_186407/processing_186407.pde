
Mover1 m1;                  //Primera función
Mover2 m2;                  //Segunda función

float dt = 1/60.0;

void setup() {
  size(800,600);
  m1 = new Mover1();
  m2 = new Mover2();  
  background(255);
  
  fill(0,0,200);
  textSize(20);
  text("Osciladores",25,50);
  fill(0);
  textSize(15);
  text("y = sin(x)*exp(-0.002x)",25,90);
  text("y = 0.5sin(3x)+0.5sin(3.5x)",25,500);
}

void draw() {
  
  stroke(0);
  line(0, 200, 800, 200);
  line(0, 400, 800, 400);
   
  m1.update();
  m1.display();
 
  m2.update();
  m2.display(); 
}
class Mover1 {

  PVector location;
  PVector velocity;
  int amplitud = 10;

  Mover1() {
    location = new PVector(8, 200);
    velocity = new PVector(10,0);
  }

  void update() {  
       
    location.x += velocity.x*dt;                                      //La x se desplaza a velocidad constante
    location.y += amplitud*sin(location.x)*exp(-0.002*location.x);    //La y en: y = sin(x)*exp(-0.002x)
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 8, 8);
  }

}

class Mover2 {

  PVector location;
  PVector velocity;
  int amplitud = 10;

  Mover2() {
    location = new PVector(8, 400);
    velocity = new PVector(10,0);
  }

  void update() {  
       
    location.x += velocity.x*dt;                                                    //La x se desplaza a velocidad constante
    location.y += amplitud*0.5*sin(3*location.x)+amplitud*0.5*sin(3.5*location.x);  //La y en: 0.5sin(3x)+0.5sin(3.5x)
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 8, 8);
  }

}


