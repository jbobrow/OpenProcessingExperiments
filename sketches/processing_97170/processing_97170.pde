
//CHRIS PRO HOMEWORK 11.2

//placing my arrays using a new made class
Balls [] ballsX = new Balls[10];
Balls [] ballsY = new Balls[10];

void setup() {
 size (500, 500);
 //setting my number of arrays and what i decided to edit in my new made class
for (int i = 0; i < ballsX.length; i = i + 1){
  ballsX[i] = new Balls( int(random(0,500)), int(random(0,500)), int(random(0,30)));
}
for (int i = 0; i < ballsY.length; i = i +1){
  ballsY[i] = new Balls( int(random(0,500)), int(random(0,500)), int(random(0,30)));
}
}

void draw(){
 background(31, 255, 3);
 //setting my number of arraws and what functions placed in my class i chose to include
for (int i = 0; i < ballsX.length; i = i + 1){
 ballsX[i].display();
 ballsX[i].moveX();
 ballsX[i].bounceX();
}
for (int i = 0; i < ballsY.length; i = i + 1){
 ballsY[i].display();
 ballsY[i].moveY();
 ballsY[i].bounceY();
}
 
}

// my class name and the data variables
class Balls{
int x;
int y;
int speed;

//Initialize my data variables
Balls(int tempX, int tempY, int tempSpeed) {
x = tempX;
y = tempY;
speed = tempSpeed;
}

//my functions that tell my class what to do 
void display(){
  fill(135, 8, 152);
 ellipse(x, y, 20, 20); 
}

void moveX(){ 
x = x + speed;
}

void moveY(){ 
y = y + speed;
}

void bounceX(){
  if ((x > width) || (x < 0)) {
   speed = speed * -1;
}}

void bounceY (){
 if ((y > height) || (y < 0)) {
   speed = speed * -1; 
}}

}



