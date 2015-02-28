
int numPetal = 15;
float deg = 360/numPetal;


void setup(){
  size(600,400);
  frameRate(5);
}

void draw(){
  int posX = int (random (600));
  int posY = int (random (400));
  drawFlower(posX, posY);
}

void drawFlower(int posX, int posY){
  pushMatrix();
  translate(posX,posY);
  
  fill(255,255,0);
  stroke(0);
  ellipse(0,0,50,50);
  
  fill(255);
  strokeWeight(1);
  
  for (int i=0; i<numPetal; i++){
    pushMatrix();
    float rad = radians(deg*i);
    rotate (rad);
    translate(0,-60);
    ellipse (0,0,30,70);
    popMatrix();
  }
  popMatrix();
}
