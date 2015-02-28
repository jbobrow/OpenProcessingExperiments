
float ballY;
float ballX;
float ranspota;
float radius;
float ranspotb;
int spot;
float speed;
void setup()
{
  size(600, 600);
  background(0, 0, 0);
  smooth();
  frameRate(60);
  //initialize veriables:
  ballY=width/2;
  ballX=width/2;
  ranspotb=random(600);
  ranspota=random(600);
  radius=30;
  speed=5;
}

void draw()
{

  fill(0, 0, 0, 25);
  rect(0, 0, 600, 600);
  fill(9, 245, 255); 
  ellipse( ballX, ballY, radius, radius );
  fill(252, 3, 252);
  ellipse( ranspota, ranspotb, radius, radius );
  println( "frameCount: " + frameCount );
  if (dist(ballX, ballY, ranspota, ranspotb)<2*radius)
  {
    ranspota=random(600);
    ranspotb=random(600);
    spot=spot+1 ;
  }
  fill(255,161,18);
  if (ballY>=height-radius)
  {
    ballY=height-radius/4; 
    textSize(60);
    text("You Lose!!!!", random(600), random(600));
    noLoop();
  }
  if (ballY<=radius)
  {
    ballY=radius/4; 
    textSize(60);
    text("You Lose!!!!", random(600), random(600));
    noLoop();
  }
  if (ballX<=radius)
  {
    ballX=radius/4; 
    textSize(60);
    text("You Lose!!!!", random(600), random(600));
    noLoop();
  }
  if (ballX>=width-radius)
  {
    ballX=width-radius/4; 
    textSize(60);
    text("You Lose!!!!", random(600), random(600));
    noLoop();
  }
  if (spot>=25)
  {
    fill(20, 255, 210);
    textSize(60);
    text("You Win!!!", random(600), random(600));
    noLoop();
  }
  if (key=='w')
  {
    ballY=ballY-speed;
  } 
  if (key=='s')
  {
    ballY=ballY+speed;
  }
  if (key=='a')
  {
    ballX=ballX-speed;
  } 
  if (key=='d')
  {
    ballX=ballX+speed;
  }
 fill(37,232,123);
  textSize(24);
  text("Number of Hits: ", 275, 500);
  text(spot, 525, 500);  
  if (ranspotb>=height-radius)
  {
    ranspotb=height-radius/2; 
    ranspotb=random(600);
  }
  if (ranspotb<=radius)
  {
    ranspotb=radius/2; 
    ranspotb=random(600);
  }
  if (ranspota<=radius)
  {
    ranspota=radius/2; 
    ranspota=random(600);
  }
  if (ranspota>=width-radius)
  {
   ranspota=width-radius/2; 
    ranspota=random(600);
  }
}


