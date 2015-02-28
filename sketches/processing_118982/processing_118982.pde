
Paddle paddlePoint;

void setup () {
//setting background size
size(600,600) ;
paddlePoint = new Paddle ();
frameRate(60);
}

float ballX = 200;
float ballY = 100;
float speedX = 10;
float speedY = 0;

void draw(){

if(ballX < 0 || ballX > width) speedX = -speedX;
if (ballY > height){
speedY -= 1.5;
speedY = -speedY; }
float distance = abs(mouseX - ballX); 

ballX += speedX;
ballY += speedY;
speedY += 1.5;
//colours of ball, paddle and background
background(8,22,70) ;
fill (181,193,51) ;
noStroke();
ellipse(ballX, ballY, 50,50) ;
fill (255);

paddlePoint.display();

fill (0) ;
int counter = 0;
//linking triangle to a point on wall and paddle
if(ballX <1){
background(255,0,0); 
fill(255);
triangle(ballX, ballY, 0, height, paddlePoint.x, paddlePoint.y + paddlePoint.h); 
//counter++;
//text("Counter is " + counter, 100,);
fill(250, 255, 0);
text("Y=mX+c", 300, 300);
textSize(50);

}
//creating triangles within the game
if(ballX >599){
background(255,0,0); 
fill(255);
triangle(ballX, ballY, 600, height, paddlePoint.x, paddlePoint.y + paddlePoint.h);
fill(250, 255, 0);
text("Y=mX+c", 300, 300);
textSize(50);

}

}

class Paddle{

float x, y, w, h;

Paddle(){
x = mouseX;
y = 600 - 25;
w = 75;
h = 25;
}
void display(){
x = mouseX;
rect(x, y, w, h);
fill(289,76,0);

} 
}
