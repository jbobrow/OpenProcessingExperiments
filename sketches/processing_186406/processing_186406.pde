
Mover mover;

void setup() {
  size(500,500);
  mover = new Mover();
}

void draw() {
  background(255);
  fill(0,0,200);
  textSize(20);
  text("Movimiento circular",25,50);
  
  stroke(75);
  fill(255);
  ellipse(width/2,height/2,100,100);
  line(50,250,450,250);                          // Eje X
  line(250,50,250,450);                          // Eje Y
  
  mover.update();
  mover.display(); 
}

class Mover {

  PVector pos;
  float dt = 1/60.0;
  float t = 0;
  float T = 1;     // Una vuelta por segundo
  float r = 50.0;
  int m;
  
  Mover() {
    pos = new PVector(100, 100);
  }

  void update() {   
    // Vamos incrementando el tiempo para que la esfera vaya cambiando de posición 
    t += dt;
    
    //Se utiliza la fórmula: radio*sin(w*t) y radio*cos(w*t)
    //w = 2*PI/T
    pos.x = r*sin(TWO_PI*t/T);
    pos.y = r*cos(TWO_PI*t/T);
  }
  
  void display() {
    stroke(0);
    fill(175);
    translate(pos.x,pos.y);
    ellipse(width/2,height/2,16,16);
  }
}


