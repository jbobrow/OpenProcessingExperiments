
int x_position=0;
int x_speed=+2;
int y_position=100;
int y_speed=+2;

void setup(){
  size(400,400);
}

void draw(){
  background(250,255,3);
  x_position=x_position+5+x_speed;
  y_position=y_position+5+y_speed;
  fill(0);
  ellipse(x_position,y_position,50,50);
  if(x_position>400){
    x_speed=-20;
  }
  if(y_position>400){
    y_speed=-20;
  }
  if(x_position<0){
    x_speed=+2;
  }
  if(y_position<0){
    y_speed=+2;
  }
  
}
