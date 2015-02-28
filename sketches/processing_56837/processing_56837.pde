
PShape ball;
float x =100;
float y=0;
float speed2=0;
float gravity =0.1;
float h=50;
int c=0;



boolean ballDrop=false;
void setup(){
  size(900,600);
  ball=loadShape("ball.svg");
}
void draw(){
  
  background(255);
  fill(0);
  noStroke();

  
  shape(ball,x,y,50,h);
  
  if(ballDrop){
  
  x=x+2;
  y=y+speed2;
  speed2=speed2+gravity;
  if(y>height-50){
  speed2=speed2*-.80;
  }
 
}
}
void mousePressed(){
  ballDrop=!ballDrop;
}


