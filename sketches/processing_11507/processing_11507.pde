

float angle = 0.1;
float offset = 160;
float scalar = 30;

float speed = .45;

void setup(){
  size(320,320);
  smooth();
  background(0);
}
void draw(){
  float x = offset + cos(angle)* scalar;
  float y = offset + sin(angle)* scalar;

  angle+= speed;

  ellipse(x,y,5,5);
  
  if((x>300)&&(y>300)){
  scalar = -scalar;

  }else{
  scalar +=speed;
  }
}


