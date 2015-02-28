
//Mira A | Bouncing Ball | CP1 | Mods 16/17

Ball circle;

void setup()
{
  size (500, 500);
  smooth();
  //Constructs a new Ball named "circle".
  circle = new Ball();
}

void draw()
{
  //The white borders of the canvas.
  noStroke();
  fill(44,22,59,15);
  rect(0,0,500,500);
  fill(255);
  rect(0,0,20,500);
  rect(480,0,20,500);
  rect(0,0,500,20);
  rect(0,480,500,20);
  stroke(255);
  strokeWeight(7);
  noFill();
  rect(50,50,400,400);
  //The new Ball, "circle", will perform these functions.
  circle.move();
  circle.bounce();
  circle.show();
}

class Ball
{
  //Variables controlling the location and direction of the Ball,
  //respectively.
  int x,y;
  boolean right,up;
  //Initializes the variables to certain values.
  Ball()
  {
    x = int(random(75,425));
    y = int(random(75,425));
    right = true;
    up = false;
  }
  //Codes for the movement of the Ball.
  void move()
  {
    //If right is true, the Ball will move towards the right.
    if (right == true)
    {
      x = x + 3;
    }
    //If right is false, the Ball will move towards the left.
    else if (right == false)
    {
      x = x - 3;
    }
    //If up is true, the Ball will move upwards.
    if (up == true)
    {
      y = y - 3;
    }
    //If up is false, the Ball will move downwards.
    else if (up == false)
    {
      y = y + 3;
    }
  }
  //The Ball will bounce if it comes into contact with a wall.
  void bounce()
  {
    if (x < 75)
    {
      right = true;
    }
    else if (x > 425)
    {
      right = false;
    }
    if (y < 75)
    {
      up = false;
    }
    else if (y > 425)
    {
      up = true;
    }
  }
  //Codes for the Ball's appearance.
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 30, 30);
    stroke(255);
    strokeWeight(3);
    noFill();
    ellipse(x,y,45,45);
  }
}
