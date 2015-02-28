
void setup(){
  size(700, 700);
  
  rectMode(CENTER);
  
 
}

void draw(){
  
  background(128, 0, 0);
  
  for(int i = 0; i < 700; i+=100){
  for(int j = 0; j < 700; j+=100){
   makeRect(50+i, 50+j, (int)random(5, 50), (int)random(5, 50)); 
  } 
 }
  
}

void makeRect(int posX, int posY, int sizeX, int sizeY){
  strokeWeight(10);
  stroke(0, (int)random (0, 255),(int)random(0, 255));
  fill((int)random(0, 255), (int)random(0, 255), 0);
  rect(posX, posY, sizeX, sizeY);
  
}
