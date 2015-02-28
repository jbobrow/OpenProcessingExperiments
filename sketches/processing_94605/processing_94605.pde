
float x=0;
void setup(){
  size(400,400);
  background(255);
  smooth();
  noFill();
  strokeWeight(20);
  stroke(0);
  strokeCap(SQUARE);
}
void draw(){
  background(255);
  arc(x-50,height/2,100,100,PI/4,7*PI/4);
  arc(width+50-x,height/2,100,100,5*PI/4,11*PI/4);
  x=x+10;
  if(x-90>=width/2){
    noLoop();
  }
}
