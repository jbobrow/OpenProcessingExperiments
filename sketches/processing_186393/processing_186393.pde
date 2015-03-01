
Mover mover;

float dt = 1/60.0;
float q = 150-(100/cos(PI/6))*sin(PI/6);
float e = 200*sin(PI/3);


void setup() {
  size(800,500);
  mover = new Mover();
}

void draw() {
  background(255);
  fill(0,0,200);
  textSize(20);
  text("Montaña rusa con aceleración",25,50);
  
  //Montaña rusa
  stroke(0);
  line(0, 350, 200, 350);                               // 0º pendiente
  line(200, 350, 400, 150);                             // 45º pendiente
  line(400, 150, 600, 350);                             // 45º pendiente
  line(600, 350, 800, 350);                             // 0º pendiente
  
  // Se actualiza y pinta la esfera
  mover.update();
  mover.display(); 
}

class Mover {

  PVector location;
  PVector v1,v2,v3;
  float acceleration = 0.0;

  Mover() {
    location = new PVector(8, 350);
    v1 = new PVector(50,0);                          //Velocidad primer y cuarto tramo
    v2 = new PVector(12.5,-12.5);                    //Velocidad segundo tramo
    v3 = new PVector(25,25);                         //Velocidad tercer tramo
  }

  void update() {   
    
    if (location.x > 0 && location.x < 200){            // Velocidad reducida a un cuarto
      acceleration = 0;
      v1.x += acceleration*dt;                          //La fórmula: v = v+a*t
      v1.y += acceleration*dt;
      location.x += v1.x*dt;
      location.y += v1.y*dt;
      fill(0);
      text("Pendiente 0º",25,400);
      text("Velocidad en X: "+v1.x,25,425);
      text("Velocidad en Y: "+v1.y,25,450); 
    } else if (location.x >= 200 && location.x < 400){   // Velocidad reducida a un tercio de la inicial
      acceleration = 0.25;
      v2.x -= acceleration*dt;
      v2.y += acceleration*dt;
      location.x += v2.x*dt;
      location.y += v2.y*dt; 
      fill(0);
      text("Pendiente 45º",25,400);
      text("Velocidad en X: "+v2.x,25,425);
      text("Velocidad en Y: "+v2.y,25,450);    
    } else if (location.x > 400 && location.x < 600){   // Velocidad reducida a un tercio de la inicial
      acceleration = 5;
      v3.x += acceleration*dt;
      v3.y += acceleration*dt;
      location.x += v3.x*dt;
      location.y += v3.y*dt;
      fill(0);
      text("Pendiente 45º",25,400);
      text("Velocidad en X: "+v3.x,25,425);
      text("Velocidad en Y: "+v3.y,25,450);     
    } else if(location.x > 600 && location.x < 800){
      acceleration = 0;
      v1.x += acceleration*dt;
      v1.y += acceleration*dt;
      location.x += v1.x*dt;
      location.y += v1.y*dt;
      fill(0);
      text("Pendiente 0º",25,400);
      text("Velocidad en X: "+v1.x,25,425);
      text("Velocidad en Y: "+v1.y,25,450);
    } else{
     location.x = 8;
    } 
    
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 16, 16);
  }

}



