
Mover mover;

void setup() {
  size(800,600,P3D);
  mover = new Mover();
  background(255);
  
  //fill(0,0,200);
  textSize(20);
  text("Espiral3D",25,50,0);
}

void draw() {
  
  stroke(75);
  fill(255);
  line(200,300,0,600,300,0);      //Eje X
  line(400,100,0,400,500,0);      //Eje Y
  line(400,300,0,400,300,200);    //Eje Z
  
  mover.update();
  mover.display(); 
}

class Mover {

  PVector pos;
  float dt = 1/60.0;
  float T = 1;                       //Una vuelta por segundo
  float r = 100.0;
  float angle = TWO_PI*dt/T;
  float vel = 25.0;                  //Velocidad para el eje X

  Mover() {
    pos = new PVector(0, 0, 0);
  }

  void update() {
    if (r > 0) {    
      pos.z = r*sin(angle);
      pos.y = r*cos(angle);
      pos.x += vel*dt;

      // Le vamos restando el mismo ángulo para que vaya en el sentido de las agujas del reloj
      // Y le vamos quitando radio para que sea una espiral
      angle -= TWO_PI*dt/T;
      r-=0.5;
    }
  }

  void display() {
    pushMatrix();
    stroke(255,0,0);
    fill(255, 0, 0);
    translate(pos.x+400, pos.y+300, pos.z);
    sphere(2.5);
    popMatrix();
  }
}



