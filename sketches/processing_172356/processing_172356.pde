
float ballX=10;
float dx =2;
void setup(){
  size(500,500);
  background(255,0,100);
}
void draw(){
  ballX= ballX + dx;
  background(255,0,100);
  fill(0,255,0);
  rect(450,mouseY,20,100);
  fill(0,0,255);
  ellipse(ballX,20,20,20);
  if(ballX >450){
    dx =-dx;
  }
}
