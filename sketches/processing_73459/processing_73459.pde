
int x;
float y=50;
int speed=1;
float speedY;
float gravity=0.1;

void setup(){
 size(400,200);
 smooth();
}

void draw(){
 background(255,240,230);
  x=x+speed;
  if( x > width||x < 0 ){
    speed=speed*-1;
  }
 
  y=y+speedY;
  speedY=speedY+gravity;
  if(y>height-50){
  speedY=speedY*-1;
  }
  stroke(0);
  fill(0);
  ellipse(x,y,32,32);
}

