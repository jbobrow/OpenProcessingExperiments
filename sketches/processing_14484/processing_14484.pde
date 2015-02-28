
//make some cars

class Car
{
  float carX;
  float carY = 0;
  float carW = 100;
  float carH = 50;
  float carSpeed = 3;

  Car (float x, float y, float s) {
    carX = x;
    carY = y;
    carSpeed = s;
  }
  
  
  void moveCar() {
    carX += carSpeed;
    if (carX > width) {
      carX = 0;
    }
  }

  void drawCar () {
    fill (255, 0, 0);
    image (tracktor, carX, carY, carW, carH);
  }




void checkCollision () {
  
  for (int i = 0; i < car.length; i++) {
    if(intersects(frog.frogX, frog.frogY, frog.frogW, frog.frogH,  carX, carY, carW, carH)) {

      frog.frogX=275;
      frog.frogY=550;      
      game.lives-=.5;
      println("collision");
    }
  }
}
  
  boolean intersects(float tx, float ty, float tw, float th, float rx, float ry, float rw, float rh) 
{
  rw += rx;  
  rh += ry;  
  tw += tx;
  th += ty;


  boolean result =              
    ((rw < rx || rw > tx) &&     
    (rh < ry || rh > ty) &&     
    (tw < tx || tw > rx) &&     
    (th < ty || th > ry));      

  return result;
}
}


