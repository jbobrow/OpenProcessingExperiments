
class Ball{
//global variables
float x = 0;
float y = 0;
float speedX = 16;
float speedY = 16;


//constructor
Ball(float _x,float _y){
  
  x = _x;
  y = _y;
 
}




//functions

void run(){
display();
move();
bounce();
gravity();
}
 void gravity(){
   
   speedY += .5;
 }
void bounce(){
if (x > width +31)  {
  speedX = speedX *-1.2;
}
if (x < 0-31)  {
  speedX = speedX *-1;
}
if (y > height + 31)  {
  speedY = speedY *-1;
}
if (y < 0-31)  {
  speedY = speedY *-1;
}
}
void move(){
 x += speedX; 
y += speedY; 

}

void display(){
  ellipse( x,height/2,30 ,y);
  fill(random(255),random(255),random(255),random(0,60));
  noStroke();
}
}

