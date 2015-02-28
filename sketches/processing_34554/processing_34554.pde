
class Particula{ // Se definen las características físicas de las bolitas

  float x = random(0.0,500.0);
  float y = random(0.0, 100.0);
  float radius = random (5.0,10.0);
  float speed = random (1.0,10.0);
  int dirX = 1;
  float dirY = -0.5;



 void go(){    //se definen las acciones que toman las bolitas
   display();
   run();
   bounce();
 
 }
 
 void display(){   //se define la bolita
 
   ellipse (x,y,radius,radius);
 
 }

void run(){  //movimiento de las bolitas

  
  y = y+speed*(dirY);

}

void bounce(){  //rebote de las bolitas

  if (x>width || x<0){
  
    dirX=-dirX;
    
  }
  
  if (y >height || y < 0){
  
    dirY = -dirY;
  
  }
}
}

