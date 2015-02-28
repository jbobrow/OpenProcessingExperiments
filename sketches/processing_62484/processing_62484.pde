
float ballY;

void setup()
{ 
  size(500,500);
  background(255, 255, 255);
  smooth(); 
  frameRate(100);
} 
void draw() 
{ 
  if (key=='c')
  {
    background(255,255,255);
  }
  if (key=='b')
  {
    ballY= random(500);
    fill(50,random(100,255),random(200,255));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
  if (key=='v')
  {
    ballY= random(500);
    fill(165,random(70),random(200,255));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
  if (key=='r')
  {
    ballY= random(500);
    fill(random(200,255),random(70),random(50));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
  if (key=='y')
  {
    ballY= random(500);
    fill(random(240,255),random(240,255),random(20));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
  if (key=='g')
  {
    ballY= random(500);
    fill(random(60),random(200,255),random(60));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
  if (key=='o')
  {
    ballY= random(500);
    fill(random(240,255),random(160,170),random(20));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
  if (key=='p')
  {
    ballY= random(500);
    fill(random(230,255),random(45),random(230,255));
    ellipse( mouseX, ballY, 50, 50 );
    println(ballY);
    loop();
  }
}

