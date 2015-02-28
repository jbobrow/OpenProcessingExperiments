
int posY = 0;
int posX = 0;
int vel = 5;




void setup() {
  size(400, 400);
  frameRate(12);
}

void draw() {
  background(100);
  
  fill(155, 238, 91);
  ellipse(posX + 200, posY, 70, 70);
  posY = posY +vel;
  
  if (posY > height || posY < 0) {
   vel = vel * -1;
  if (posY > height || posY < 0) 
   vel = vel * -1;  
  }
  
  
  fill(91, 205, 238);
  ellipse(posX + 100, posY, 50, 50);
  posY = posY +vel;
  
  if (posY > height || posY < 0) {
   vel = vel * -1; 
  }
  
  
}


