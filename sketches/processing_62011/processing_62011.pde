
float ballX=1000;
float ballY=1000;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(30);
}

void draw()
{
  background(255, 255, 255);
  fill(255, 0, 0);
  ellipse( mouseX, mouseY, 50, 50 );
  
  if (mousePressed)
  {
    ballX = random(width);
    ballY = random(height);
    fill(random(255), random(255), random(255));
    ellipse(ballX, ballY, 4, 4);
  }
  
  if(dist(mouseX,mouseY,ballX,ballY)<27)
  {
   background(255,255,255); 
   textSize(50);
   textAlign(CENTER);
   text("YOU LOSE!",width/2,height/2);
   noLoop();
   
  }
}


