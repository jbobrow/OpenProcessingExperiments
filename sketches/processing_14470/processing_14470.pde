
//by Priscilla Boatwright

int xPosition = 0;
int speed = 5;
int xPositionb = 100;
int speedb = 5;
 

void setup(){
  size(400,200);
}

void draw(){
  background(20, 100, 160);
  fill(250, 20);
  noStroke ();
  triangle(xPosition, 200, 150, 100, xPositionb, 200);
fill(20, 100, 160);
  noStroke ();
  triangle(400, 0, 100, 100, 400, 130);
  
    

  
  xPosition= xPosition + speed;
  xPositionb= xPositionb+ speedb;
  

  
}
                
                
