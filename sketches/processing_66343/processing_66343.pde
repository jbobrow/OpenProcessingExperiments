
float ballX;   
float ballY;    
float yspeed;
float xspeed;
float gravity;  

void setup() {
  size(400,400);
  
  ballX = width/2;
  ballY = 0; 
  yspeed = 10;
  gravity = .1;
  xspeed = -10;

}

void draw() {
  background(255);

  // Display the square
  fill(255, 0, 255);
  noStroke();
  ellipse(ballX, ballY, 10, 10);
  
  ballX += xspeed;
  ballY += yspeed;
  yspeed += gravity;
  
  if (ballY >= height-5 || ballY <= 5) {
    yspeed *= -0.95;
  }
  
  if (ballX >= width-5 || ballX <= 0) {
    xspeed *= -0.95;
  }
}









