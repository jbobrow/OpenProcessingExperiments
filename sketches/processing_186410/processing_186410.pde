
Mover mover;

void setup() {
  size(500,500);
  mover = new Mover();
  background(255);
  
  fill(0,0,200);
  textSize(20);
  text("Espiral",25,50);
}

void draw() {
  
  stroke(75);
  fill(255);
  line(50,250,450,250);
  line(250,50,250,450);
  
  mover.update();
  mover.display(); 
}

class Mover {

  PVector pos;
  float dt = 1/60.0;
  float T = 1;                       //Una vuelta por segundo
  float r = 100.0;
  float angle = TWO_PI*dt/T;
  
  Mover() {
    pos = new PVector(0, 0);
  }

  void update() {
    if (r > 0){    
      pos.x = r*sin(angle);
      pos.y = r*cos(angle);
      
      // Le vamos restando el mismo ángulo para que vaya en el sentido de las agujas del reloj
      // Y le vamos quitando radio para que sea una espiral
      angle -= TWO_PI*dt/T;
      r-=0.5;
    } 
  }
  
  void display() {
    stroke(0);
    fill(255,0,0);
    translate(pos.x,pos.y);
    ellipse(width/2,height/2,16,16);
  }
}


