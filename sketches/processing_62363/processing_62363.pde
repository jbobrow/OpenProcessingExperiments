
float ballY;
float radius;
float ySpeed; 

void setup()
{ 
  size(400, 600);
  background(50, 150, 255);
  smooth();
  frameRate(75); 

  ballY = 0;
  radius = 20;
  ySpeed = 5;
}
void draw()
{
  background(50, 150, 255);
  fill(0, 0, 0); 
  ellipse(width/2, 400, 70, 70); 
  strokeWeight(10); 
  line(width/2, 400, width/2, 525);  
  line(width/2, 525, 150, 600); 
  line(width/2, 525, 250, 600); 
  line(width/2, 475, 275, 400); 
  line(width/2, 475, 125, 400);
  if (ballY>= 400-radius)
  {
    ballY = 400-radius; 
    ySpeed = ySpeed*-1;
  } 
  if (ballY<= radius)
  { 
    ballY = radius;
    ySpeed = ySpeed*(-1);
  }
  ballY = ballY + ySpeed; 
  strokeWeight(0); 
  fill(255, 0, 0); 
  ellipse(275, ballY, radius*2, radius*2);
}


