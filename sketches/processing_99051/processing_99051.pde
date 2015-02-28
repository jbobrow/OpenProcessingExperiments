
float ballY = 30;
float ballYSpeed = 1;
float ballX = 30;
float ballXSpeed = 1;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

}

void draw()
{ 
fill(random(255),random(255),random(255));
ellipse(random(255),random(600),20,30);
rect(ballY,ballX,50,60);
ballY = ballY + ballYSpeed;
ballX = ballX + ballXSpeed;
rect(ballY,ballX,80,30);
ballY = ballY + ballYSpeed;
ballX = ballX + ballXSpeed;
ellipse(random(255),random(300),10,9);
rect(12,79,100,200);
triangle(90,91,80,81,70,71);
point(4,7);
line(45,40,10,13);
quad(67,78,46,43,29,24,89,98);
rect(10,20,30,40);
}
