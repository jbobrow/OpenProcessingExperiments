
void setup(){
  size (400,400);
  background (0);
  noStroke();
}

int x=0;
int y=50;
int speed = 10;
void draw(){
frameRate(30);
rect(x,y,5,5);
float n = random (255);
fill (0,0,210,n);
x=x+speed;
if ((x<0)||(x>=400)){
speed=speed*-1;
y = y + 50;
}
}


