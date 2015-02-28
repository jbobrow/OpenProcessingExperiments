
//fijo las variables
int circleSize=0;
float circleX=10;
float circleY=10;

//el tamaño de la pantalla
void setup(){
  size(600,600);
}
//círculo que varía de tamaño
void draw(){
  background(255,0,0,100);
  ellipse(mouseX,mouseY,circleX,circleY);
  
  circleX=circleX*1.02;
  circleY=circleY*1.02;
}

