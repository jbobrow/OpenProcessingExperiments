
Mover mover;

float dt = 1/60.0;                                      // Diferencial de tiempo
float q = 150-(100/cos(PI/6))*sin(PI/6);                // Operaciones para encontrar operaciones según el grado de pendiente
float e = 200*sin(PI/3);


void setup() {
  size(800,500);
  mover = new Mover();
}

void draw() {
  background(255);
  fill(0,0,200);
  textSize(20);
  text("Montaña rusa sin aceleración",25,50);
  
  stroke(0);
  line(0, 250, 100, 250);                               // 0º pendiente
  line(100, 250, 200, 150);                             // 45º pendiente
  line(200, 150, 300, q);                               // 30º pendiente
  line(300, q, 400, q+e);                               // 60º pendiente
  line(400, q+e, 500, q+e-100);                         // 45º pendiente
  line(500, q+e-100, 600, q+e-100+q);                   // 30º pendiente
  line(600, q+e-100+q, 800, q+e-100+q);                 // 0º pendiente
  
  // Se actaliza y se pinta la esfera
  mover.update();
  mover.display(); 
}
class Mover {

  PVector location;
  PVector velocity;

  Mover() {
    location = new PVector(8, 250);
    velocity = new PVector(50,0);
  }

  void update() { 
    
    // Aplicamos la fórmula x = x + v*dt    
    location.x += velocity.x*dt;          
    location.y += velocity.y*dt;
    
    if(location.x > 0 && location.x < 100){
      fill(0);
      text("Pendiente 0º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    }
    
    if (location.x > 100 && location.x < 200){          // Velocidad reducida a un cuarto
      velocity.x = 12.5;
      velocity.y = -12.5;
      fill(0);
      text("Pendiente 45º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    } else if (location.x > 200 && location.x < 300){   // Velocidad reducida a un tercio de la inicial
      velocity.x = 16.666667*2;                         // y menor la y al ser de una pendiente menos inclinada
      velocity.y = -9.623*2;
      fill(0);
      text("Pendiente 30º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    } else if (location.x > 300 && location.x < 400){   // Velocidad aumentada un tercio parte de la inicial
      velocity.x = 66.666667*2;                         // y aumentada por dos para mostrar caída
      velocity.y = 66.666667*2*1.732;
      fill(0);
      text("Pendiente 60º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    } else if (location.x > 400 && location.x < 500){   // Velocidad reducida a un cuarto
      velocity.x = 12.5;
      velocity.y = -12.5;
      fill(0);
      text("Pendiente 45º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    } else if (location.x > 500 && location.x < 600){   // Velocidad aumentada una tercera parte
      velocity.x = 57.735*1.75;
      velocity.y = 57.735*1.6;
      fill(0);
      text("Pendiente 30º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    } else if (location.x > 600 && location.x < 800){   // Velocidad aumentada a un cuarto en x
      velocity.x = 50;
      velocity.y = 0;
      fill(0);
      text("Pendiente 0º",25,400);
      text("Velocidad en X: "+velocity.x,25,425);
      text("Velocidad en Y: "+velocity.y,25,450);
    } else if (location.x > 800){
      location.x = 8;
      location.y = 250;
    }    
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 16, 16);
  }

}



