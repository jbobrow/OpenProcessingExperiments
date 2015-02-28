
float goalieX;
float xspeed = 4;
float ballX= 200;
float ballY= 200;
float ballYspeed=0;
int score=0;
int miss=5;
float goalieL=20;
 
void setup()
{
  size (600, 600);
  background (35, 193, 34);
  smooth();
  goalieX=200;
}
 
void draw()
{
  background (#008000);
  strokeWeight(2);
  line(120, 50, 280, 50);
  line(120, 50, 120, 90);
  line(280, 50, 280, 90);
  stroke(255, 255, 255);
  line(0, 90, 400, 90);
  line(65, 90, 65, 140);
  line(65, 140, 333, 140);
  line(333, 140, 333, 90);
  line(0, 255, 600, 255);
  fill(255, 255, 255);
  ellipse(200, 200, 8, 8);
 
  fill(0);
  textAlign(CENTER);
  textSize(10);
  
  textSize(20);
  text("Score: "+score, 50, 435);
  text("Balls Left: " + miss, 60, 480);
 
 
  stroke(0);
  strokeWeight(3);
 

  line(goalieX, 90, goalieX+goalieL, 90);
  if (goalieX >= 280-goalieL)
  {
    xspeed *= -1;
    goalieX= 280-goalieL;
  }
  if ( goalieX <= 120)
  {
    xspeed *= -1;
  }
  goalieX=goalieX+xspeed;
  ballY=ballY+ballYspeed;
 
  // println(ballY + ", " + ballYspeed);
 
 
  if (ballY <=90)
  {
    ballYspeed = 0;
    ballY = 200;
 
    if (goalieX <= 200 && goalieX >= 200-goalieL)
    {
      miss--;
    }
 
    else
    {
      score=score+1;
      if ( abs(xspeed) < 20)
      {
        xspeed=xspeed*1.1;
        goalieL= goalieL+1;
      }
    }
  }
  if (miss==0)
  {
    fill(35, 193, 34);
    rect(0,0,width,height);
    fill(255,255,255);
    text("End Game", 200, 200);
    text ("Reset:s or a", 200,250);
    text("Score: " + score, 200,300);
    noLoop();
  }
}
 
void mousePressed()
{
  ballYspeed = -7;
}
 
 
void keyPressed()

{
  if (key == 'a')
  {
    loop();
    ballY = 200;
    goalieL=20;
  }
  if (key=='s')
  {
    score=0;
    miss=5;
    ballY=200;
    xspeed=4;
    goalieX=width/2;
  }
}



