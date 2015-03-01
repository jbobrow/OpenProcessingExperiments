
void setup(){
size(400,400);
}
int ballx= 100;
int bally=50;
int speed=2;
void draw(){
drawBall();
bounceBall();
}

void drawBall(){
ellipse(ballx,bally,20,20);
ballx=ballx+speed;
bally=bally+speed;
}

void bounceBall(){
if(ballx>=width || ballx<50 || ballx>=height){
speed=speed*-1;
}
}

