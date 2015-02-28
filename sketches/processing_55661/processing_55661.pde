
float bola=200;
float gravidade = 3;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(0,0,0);
  fill(255,0,0);
  stroke(255,255,100);
  strokeWeight(3);
  ellipse(200,bola,20,20);
  bola=bola+gravidade;
  if(bola > 390){
    gravidade=-gravidade*1.3;
  }
  if(bola < 10){
    gravidade=-gravidade*1.3;
  }
  if(gravidade>400){
    bola=200;
    gravidade=3;
  }
}

