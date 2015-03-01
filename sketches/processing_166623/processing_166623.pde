
int ground = 550;  //
int startH = 100;  //drop point height
int ballRadius = 22;
float ballHeight = 0;
float ballHeightNext = 0;
float gravity = 1.0;
float speed = 0;  //realtime speed
float speedG = 0; //max speed when hit ground
float energyLost = 1.60;
int time;
boolean drop=true;  //ball status 

void setup() 
{
  smooth();
  size(300, 600);
  frameRate(60);
  noStroke();
  speedG = sqrt(2*gravity*(ground - ballRadius - startH));  // infer from h = gt^2/2 and v = gt
}

void draw() 
{
  background(213,246,255);
  fill(125);
  rect(0, ground, width, ground);

  if (drop)
  {
    ballHeight =startH + (gravity*time*time)/2;  // h = gt^2/2 
    time++;
    if ( ballHeight >= ground - ballRadius ) 
    {      
      speedG = speedG - energyLost; //energy lost
      if (speedG <=0 ) speedG=0;
      ballHeight = ground - ballRadius;
      drop = false;
      time = 0;
    }
  } else  //bounced up
  {
    ballHeight = ground - ballRadius - (speedG*time - gravity*time*time/2); // h = v0t - gt^2/2
    speed =  speedG - gravity*time;  // v = v0- gt
    time++;
    if ( speed <= 0 ) 
    {
      startH =  int(ballHeight); //new drop point
      drop = true;
      time = 0;
    }
  }
  fill(0,118,0);
  ellipse(150, ballHeight, ballRadius*2, ballRadius*2);
  //println(speed+", "+ballHeight+", " + speedG);
}

void keyPressed()
{
  startH = 50;
  speedG = sqrt(2*gravity*(ground - ballRadius - startH));
  drop = true;
  background(213,246,255);
}

