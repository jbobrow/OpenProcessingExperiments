

void setup(){
  smooth();
  size (400,400);
  fill (70,100,210); 
}


int x2=0;
int speed=5;
float y=50;
float speed2=random(10);
void draw(){
  background(40,40,250);
  frameRate(24);
  ellipse (250,x2,20,20);
  fill (200,50,40);
  rect (x2,y,20,20);
  y=y+speed2;
  x2=x2+speed;
  if ((x2<0)||(x2>=380)){
    speed=speed*-1;
  }
  if ((y<20)||(y>380)){
    speed2=speed2*-1;
  }
}

