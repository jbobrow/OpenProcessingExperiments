

 
PVector pos;     
PVector speed;   
PVector accel;   
float direction; 
 
void setup() {
  size(800, 800);
  pos = new PVector(width/2, height/2, 0);
  speed = new PVector();
  accel = new PVector();
}
 
void draw() {
  checkKeys();
  background(0);
   
  speed.add(accel);  
  pos.add(speed);    
   
  drawShip();
 
  accel.set(0, 0, 0); //Accel stopper (Via Tom Eskra)                    
  if (speed.mag() != 0) speed.mult(0.99); //Drag (Aid from Tom Eskra an old friend from highschool)
   
}
 
void checkKeys() {
   
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      direction-=0.1;
    }
    else if (keyCode == RIGHT) {
      direction+=0.1;
    }
    else if (keyCode == UP) {
      float totalAccel = 0.2;                 // how much the ship accelerates
      accel.x = totalAccel * sin(direction);  // total acceleration's X component
      accel.y = -totalAccel * cos(direction); // total acceleration's Y component
    }
  }
}
 
void drawShip() {
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(direction);
   
  noStroke();
  fill(255); 
  triangle(-10, 20, 10, 20, 0, -20);
  }




