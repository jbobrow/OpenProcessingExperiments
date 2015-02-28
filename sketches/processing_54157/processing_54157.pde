
Wiggler w1; //Declare the wiggler

void setup()
{
  size(500, 500);
  smooth();
  //Initialize the wiggler by calling its constructor
  w1 = new Wiggler(random(width), random(height), random(2, 6));
}
void draw()
{
  //background stuff
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  //Call methods on the wigglaz
  w1.display();
  w1.update();

  //We made a method that returns each wiggler's dist from center.
  if ( w1.distFromCenter() < 50)
    fill(255, 0, 0);
  else
    noFill();

  ellipse(width/2, height/2, 100, 100);
}

class Wiggler
{
  float xpos, ypos;
  float speed;
 
  Wiggler(float tx, float ty, float ts)
  {
    xpos = tx;
    ypos = ty;
    speed = ts;
  }
 
  void update()
  {
    float rx = random(-speed, speed*3);
    float ry = random(-speed, speed*3);
    xpos+=rx;
    ypos+=ry;
  }
 
  void display()
  {
    stroke(255);
    noFill();
    ellipse(xpos, ypos, 20, 20);
    wrap(); //I moved this here since I always want it to be done.
  }
  void wrap()
  {
    if (xpos >= width+10) {
      xpos = -10;
    }
    else if (xpos<=-10) {
      xpos = width+10;
    }
    else if (ypos>=height) {
      ypos=0;
    }
    else if (ypos<=0) {
      ypos=height;
    }
  }
 
  float distFromCenter()
  {
    float d = dist(xpos, ypos, width/2, height/2);
    return d;
  }
}



