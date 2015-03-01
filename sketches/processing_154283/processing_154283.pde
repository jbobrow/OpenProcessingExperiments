
//0 means attract loop(main menu), 1 means game, 2 means game over
int state = 0;

//stars
int numStars = 500;
float[] dotX=new float[numStars];
float[] dotY=new float[numStars];
float[] speedX=new float[numStars];
float[] speedY=new float[numStars];
float[] dotSize=new float[numStars];

//blackhole
float blackHoleX;
float blackHoleY;
float blackHoleSpeed;

void setup()
{
  size(700, 500);
  background(random(255), random(255), random(255));

  //game variables
  for (int i=0; i<numStars; i++)
  {
    dotX[i] = random(width);
    dotY[i] = random(height);
    speedX[i]=random(-10,10);
    speedY[i]=random(-10,10);
    dotSize[i] = random(5, 10);
  }

  blackHoleX = random(width);
  blackHoleY = random(height);
  blackHoleSpeed = 0;

}

void draw()
{
  if (state == 0)
  {
    //text
    textSize(32);
    textAlign(CENTER);
    text("Press space to begin!", width/2, height/2);
    //attract
    //press space to begin
  } else if (state == 1)
  {
    //game
    background(50);
    stroke(255);

    for (int i=0; i<numStars; i++)
    {
      strokeWeight(dotSize[i]);
      point(dotX[i], dotY[i]);
      dotX[i] += speedX[i];
      dotY[i] += speedY[i];
      if (dotY[i]>height)
        dotY[i] = 0;

      if (dotX[i]>width)
        dotX[i] = 0;

    }
    //draw black hole
    stroke(0);
    strokeWeight(25);
    point(blackHoleX, blackHoleY);
    //DO something to the stars near the black hole
    for (int i=0; i<numStars; i++)
    {
      if (dist(dotX[i], dotY[i], blackHoleX, blackHoleY)<75) {
        dotX[i] = 0.5*dotX[i] + 0.5*blackHoleX;
        dotY[i] = 0.5*dotY[i] + 0.5*blackHoleY;
      }
    }

  } else
  {
    //game over
  }
}

void keyPressed() {
  if (state ==0)
  {
    if (key == ' ')
      state = 1;
    background(random(255), random(255), random(255));
  } else if (state == 1)
  {
  } else
  {
  }
}

