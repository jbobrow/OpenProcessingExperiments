
/*
This code is a bit of a replica of multiple ball ping pong. The user is able to control the vertical axis of the "obstacle", a short wall, to bounce an array of balls from one wall to the next. The user can bounce the balls to either wall and attempt to keep all the balls from hitting the opposite wall. 
The inspiration for this project originally started with two Rube Goldberg-esqe video of a series of balls traveling through an obstacle course.The third video is of an animation of a bouncing ball, which shows a bouncing ball in stills: 
http://www.youtube.com/watch?v=21t79OCziXs
http://www.youtube.com/watch?v=LoR2k3B0ifk
http://www.youtube.com/watch?v=w-i35J8yXoc
I have also drawn inspiration from a few written codes such as a simpler ping pong game(for the wall obstacle idea): 
http://processingjs.org/learning/topic/collision/
A rolling ball animation(for the code needed to create a rolling ball in Processing:
http://www.learningprocessing.com/examples/chapter-5/example-5-6/
And a bouncing ball animation(which helped me figure out speed and if statements:
http://www.openprocessing.org/sketch/47766
I also used the information from the packets in class: Getting Started in Processing: Classes and Arrays.
I had originally meant to create a Rube Goldberg-esqe program, where a ball travels through an obstacle course, but opted to create this ping pong like game instead. In future editting of this code, I hope to be able to make the user be able to change the horizontal axis of the "obstacle" and perhaps create a more of a competitive game experience. Most of my process and ideas are written in my notebook: things like the original ideas, the transitions,. the new ideas, and post-its filled with how-tos from Ms. Freed.
*/

Wall obstacle;
Ball[] balls = new Ball[10];

void setup()
{
  size(200,200);
  background(0);
  smooth();
  obstacle = new Wall(100, mouseY, 10, 45);
  for( int i = 0; i < balls.length; i++)
  {
    float x = random(width);
    float y = random(height);
    int d = 15;
    balls[i] = new Ball(x,y,d);
  }
}

void draw()
{
  background(0);
  fill(255);
  obstacle.display();
  for (int i = 0; i < balls.length; i++)
  {
    balls[i].move();
    balls[i].display();
  }
}
   

class Ball
{
  float diameter;
  float x;
  float y;
  float speed;
  Ball(float TempX, float TempY, float TempD)
  {
    x = TempX;
    y = TempY;
    diameter = TempD;
    speed = 1;
  }
  void display()
  {
    stroke(0);
    ellipse(x,y,diameter,diameter);
    fill(255);
  }
  void move()
  {
    x += speed;
    
    if (x > width || x < 0) 
    {
      speed *= -1;
    }
    if(x < obstacle.x && x + diameter/2 > obstacle.x && y + diameter/2 > mouseY && y - diameter/2 < mouseY + obstacle.wallheight)
    {
     speed = -abs(speed);
    }
    if(x > obstacle.x && (x - diameter/2) < (obstacle.x + obstacle.wallwidth) && y + diameter/2 > mouseY && y - diameter/2 < mouseY + obstacle.wallheight)
    {
      speed = abs(speed);
    }
  }
} 

class Wall
{
  float wallheight;
  float wallwidth;
  float x;
  float y;
  Wall(float wX, float wY , float wW, float wH)
  {
    x = wX;
    y = wY;
    wallwidth = wW;
    wallheight = wH;
  }
 void display()
 {
   stroke(0);
   rect(x, mouseY, wallwidth, wallheight);
   fill(255);
 }
}
