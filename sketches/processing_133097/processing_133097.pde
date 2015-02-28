
Ball myBall;
Ball myBall2;
Ball myBall3;
Ball myBall4;
Ball myBall5;
Ball myBall6;
Ball myBall7;
Ball myBall8;
Ball myBall9;
Ball myBall10;

void setup() {
size(600,600);
smooth();
background(0);
myBall = new Ball(80,100);
myBall2 = new Ball(500,200);
myBall3 = new Ball(190,150);
myBall4 = new Ball(450,80);
myBall5 = new Ball(50,300);
myBall6 = new Ball(100,60);
myBall7 = new Ball(360,250);
myBall8 = new Ball(270,100);
myBall9 = new Ball(220,400);
myBall10 = new Ball(150,310);
}

void draw() {
fill(255,255,255,10);
rect(0, 0, 600, 600, 50);
fill(0);
noStroke();

fill(220,220,220,50);
myBall10.run();
fill(200,200,200,50);
myBall9.run();
fill(150,150,150,50);
myBall8.run();
fill(100,100,100,50);
myBall6.run();
myBall7.run();
fill(50,50,50);
myBall4.run();
myBall5.run();
fill(0);
myBall.run();
myBall2.run();
myBall3.run();
}
class Ball{
float x = 0;
float y = 0;
float speedX = 5;
float speedY = 0.5;


Ball(float _x, float _y){

x = _x;
y = _y;

}

void run(){
display();
move();
bounce();
gravity();
}

void gravity(){
speedY += 0.2;
}

void bounce(){
if(x > width) {
speedX = speedX * -1;
}
if(x < 0) {
speedX = speedX * -1;
}
if(y > height) {
speedY = speedY * -1;
}
if(y < 0) {
speedY = speedY * -1;
}

}

void move(){

  x += speedX;
y += speedY;
}

void display(){
ellipse (x,y,40,40);
}
}


