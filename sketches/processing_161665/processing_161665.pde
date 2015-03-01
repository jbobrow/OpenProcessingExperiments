
int circleX = 50;
int circleY = 100;
int speedX = PI * PI;
int speedY = 7;

void setup (){
size(600,300);
smooth();
}

void draw (){
background(0,255,0);

circleX = circleX +speedX;
circleY = circleY +speedY;

if ((circleX > width) || (circleX < 0)){
speedX = speedX * -1;
}

if ((circleY > height) || (circleY < 0)){
speedY = speedY * -1;
}

stroke(0);
fill(13,12,255);
ellipse(circleX,circleY,50,50);
}
