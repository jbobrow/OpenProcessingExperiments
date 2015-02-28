
Square [] squareX = new Square[20];
Square [] squareY = new Square[20];
 
void setup() {
 size (400, 400);
for (int i = 0; i < squareX.length; i = i + 1){
  squareX[i] = new Square( int(random(0,400)), int(random(0,350)), int(random(0,320)));
}
for (int i = 0; i < squareY.length; i = i +1){
  squareY[i] = new Square( int(random(0,400)), int(random(0,360)), int(random(0,400)));
}
}
 
void draw(){
 background(0);
 for (int i = 0; i < squareX.length; i = i + 1){
 squareX[i].display();
 squareX[i].moveX();
 squareX[i].bounceX();
}
for (int i = 0; i < squareY.length; i = i + 1){
 squareY[i].display();
 squareY[i].moveY();
 squareY[i].bounceY();
}
  
}
 

class Square{
  color c;
  int x;
  int y;
  int speed;
 

Square(int tempX, int tempY, int tempSpeed) {
  x = tempX;
  y = tempY;
  speed = tempSpeed;
}
 

void display(){
  fill(255,0,0);
  rect(x, y, 20, 20);
}
 
void moveX(){
x = x + speed;
}
 
void moveY(){
y = y + speed;
}
 
void bounceX(){
  if ((x > width) || (x < 0)) {
   speed = speed * 1;
}}
 
void bounceY (){
 if ((y > height) || (y < 0)) {
   speed = speed * -1;
}}
 
}
