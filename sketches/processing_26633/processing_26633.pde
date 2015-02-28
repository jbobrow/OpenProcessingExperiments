
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

Circle [] circles = new Circle[6];

void setup()
{
  size(500,500);
  smooth();

  minim = new Minim(this);
  song = minim.loadFile("piano.wav");

  for (int i = 0; i < circles.length; i++)
  {
    circles[i] = new Circle();
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].display();
    for (int j = 0; j < circles.length; j++)
    {


      if(i != j && (circles[i]).intersect(circles[j])) {
        song.loop(0);
      }
    }
  }
}

void mouseDragged()
{
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].move();
  }
}

class Circle
{
  float r;
  float xpos;
  float ypos;

  Circle()
  {
    xpos = random(width);
    ypos = random(height);
    r = 35;
  }
  void display()
  {
    noStroke();
    fill(0,80);
    ellipse(xpos,ypos,r*2,r*2);
  }

  void move()
  {
    if(dist(mouseX,mouseY,xpos,ypos)<r)
    {
      xpos = xpos +  mouseX-pmouseX;
      ypos = ypos + mouseY-pmouseY;
      if (xpos>width+r || ypos>height+r || xpos<0-r || ypos<0-r) {
        xpos = 0;
        ypos = 0;
      }
    }
  }

  boolean intersect (Circle c){
    float distance = dist(xpos,ypos,c.xpos,c.ypos);
    if(distance < r+c.r)
    {
      return true;
    }
    else {
      return false;
    }
  }
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


