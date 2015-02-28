
float x;
float y;
float angle;
float radical;
int direction;


void setup(){
  size(600, 600);
  background (0,176,255);
  angle = 10;
  radical = 20;
  direction = +1;
}

void draw(){
  x = cos(radians(angle)) * radical/2;
  y = sin(radians(angle)) * radical/2;
  fill(255,213,0);
  rect(x,y,20,20);
  angle+= 10;
  radical+=direction;
}

