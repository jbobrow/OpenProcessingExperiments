
float y=100;
float speed=5;
float g=0.1;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  y= y+ speed;
  speed= speed+ g;
  if((y>height)||(y<0)){
    speed= speed*-0.95;
  }
  stroke(0);
  fill(255,0,0);
  ellipse(100,y,50,50);
}
