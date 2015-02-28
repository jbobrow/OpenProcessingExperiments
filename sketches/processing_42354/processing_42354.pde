
//moving balls with oop

int NUM_BALLS = 200;

//create an empty array called myBalls to contain objects of the type Ball
Ball[] myBalls = new Ball[NUM_BALLS];
color[] myColors = {
  #05E039, #E0A605, #05E0CC, #F7F000, #00F79E, #BD00F7, #F7003A,#2812FF,#8B00FF
};

//declaration object
Ball myBall, myBall2;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();

  //populate the array
  for (int i=0;i<NUM_BALLS;i++)
  {
    myBalls[i] = new Ball(int(random(-width, width)), int(random(-500, 0)), myColors[i%(myColors.length-1)]);
    myBalls[i].speedY=random(1, 3);
    myBalls[i].myDiameter=map(myBalls[i].speedY, 1, 3, 3,10);
  }
}

void draw()
{
  background(0);
  for (int i=0;i<myBalls.length;i++)
  {
    myBalls[i].update();
  }
}

class Ball
{
  //properties
  float myDiameter;
  float posX=250;
  float posY=250;
  float speedX;
  float speedY;
  color myColor;
  float dx, intX;

  Ball(int POSX, int POSY, color MYCOLOR)
  {
    intX=POSX;
    posY=POSY;
    myColor = MYCOLOR;
  }

  //method
  void update()
  {
    fill(myColor);
    ellipse(posX+intX, posY, myDiameter, myDiameter);
    fill(myColor, 10);
    ellipse(posX+intX, posY, myDiameter+2, myDiameter+2);
    posY+=speedY;
    if (posY>height)
    {
      posY=0;
    }

    dx+=.003;

    posX=noise(dx)*width;
  }
}

