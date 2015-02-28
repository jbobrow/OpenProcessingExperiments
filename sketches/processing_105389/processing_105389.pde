
int siz = 30;
int posX = 5; //initial position
int posY = 100;
int velX = 8; //Either posX and posX OR velX and velY must be two different variables or the ball will bounce in a line
int velY = 10;

void setup(){
  size(800,600);
  
}

void draw(){
  background(100);
  ellipse(posX, posY, 30,30);
  posX = posX + velX; //these ones must be within the brackets but the initial variables must be at the top
  posY = posY + velY;
  if(posX > width ||posX < 0){
    velX = velX * -1;
  }
  if(posY > height ||posY < 0){
    velY = velY * -1;
  }
}
