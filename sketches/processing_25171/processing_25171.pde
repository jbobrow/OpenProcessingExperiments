
float x;
float speed=+10;

void setup(){
  size(500,500);
  background(0,255);
  x=0;
}
void draw(){
background(0,255);
  
  if(x>=500+50){
    speed=-10;
  }
  
  if (x<=0){
    speed=+10;
  }
  
  x=x+speed;
  fill(x,0,0);
  stroke(random(255),0,0,100);
  triangle(random(x),random(x),random(x),random(x),random(x),random(x));
}

