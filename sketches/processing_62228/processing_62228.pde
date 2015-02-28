
float diameter; 
float ballX; 
float ballY; 
float xSpeed; 
float ySpeed;


void setup() { 
  size(600, 600); 
  background(255, 255, 255); 
  smooth(); 
  frameRate(60); 
  diameter = 20; 
  ballX = 0; 
  ballY = 600; 
  xSpeed = 2; 
  ySpeed = 1;
} 
void draw() { 
  background(20, 100, 255); 
  fill(255, 255, 255);
  strokeWeight(3);
  line(500, 400, 500, 600);

  fill(255, 0, 0);
  triangle(500, 400, 590, 425, 500, 450);
  fill(0, 255, 0);
  triangle(300, 100, 200, 500, 400, 500);
  fill(0, 0, 0);
  quad(250, 600, 250, 500, 350, 500,350 , 600 );









  // Is ball at the bottom? 
  if (ballY >= height-diameter/2 ) 
  { 
    ballY = height-diameter/2;
    ySpeed = ySpeed * (-1) ;
  }
  // Is ball at the top? 
  if (ballY <= diameter/2 )
  { 
    ballY = diameter/2; 
    ySpeed = ySpeed * (-1) ;
  } 
  // Is ball at the right edge?
  if (ballX >= width-diameter/2 ) 
  { 
    ballX = width-diameter/2;
    xSpeed = xSpeed * (-1) ;
  }
  // Is ball at the left edge? 
  if (ballX <= diameter/2 )
  { 
    ballX = diameter/2; 
    xSpeed = xSpeed * (-1) ;
  }


 
  ballX = ballX + xSpeed; 
  ballY = ballY + ySpeed;
  fill(255, 255, 255);
  ellipse( ballX, ballY, diameter, diameter );
  println("x=" + ballX + " y=" + ballY);
  ySpeed = ySpeed+.4;
  // loosing height after each bounce
  if (ballY > height-diameter/2)
  {
    ballY=height-diameter/2;
    ySpeed = ySpeed*.6;
  }
 
// slow the ball down faster when it is rolling.
  if (ballY > height-diameter/2-1)
  {
    xSpeed *=.9;
  }
}

void mouseDragged()
{
  ballX = mouseX;
  ballY= mouseY;
  xSpeed = mouseX - pmouseX;
  ySpeed = mouseY - pmouseY;
}


