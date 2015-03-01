
void setup(){
  size(500,500);
  background(0);
  frameRate(10);
}
void draw(){

float x1 = random(width);
float x2 = random (height);

strokeWeight(20);
stroke(20,200,230,30);

line(x1,0,x2,height);

  if(mousePressed){
    frameRate(300);
}
}
