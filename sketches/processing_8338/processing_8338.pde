
import controlP5.*;

ControlP5 controlP5;
Spinner spinner;
float interval;

void setup()
{
  size(400,400);
  //smooth();
  background(0);
  controlP5 = new ControlP5(this);
  interval = PI/5;
  spinner = new Spinner(width/2,height/2,interval);
  controlP5.addBang("reinitialize",0,height-40,20,10);
  Slider s = controlP5.addSlider("steps",0.3,10,5,0,height-10,200,10);
}

void draw()
{
  spinner.update();
  spinner.display();
}

void reinitialize()
{
  background(0);
  spinner = new Spinner(width/2,height/2,interval);
}

void steps(float tempinterval)
{
  spinner.interval = PI/tempinterval;
  interval = PI/tempinterval;
}

//void mouseClicked()
//{
//  background(0);
//  spinner = new Spinner(width/2,height/2,2);
//}

class Spinner
{
  int xOrigin,yOrigin;
  float x,y;
  float px,py;
  float ang;
  float radius;
  float interval;
  Spinner(int tempxorigin,int tempyorigin,float tempinterval)
  {
    interval = tempinterval;
    xOrigin = tempxorigin;
    yOrigin = tempyorigin;
    ang = 0;
  }
  void update()
  {
    px = x;
    py = y;
    ang = ang + interval;
    radius = radius + 0.5;
    x = cos(ang)*radius + xOrigin;
    y = sin(ang)*radius + yOrigin;
  }
  void display()
  {
    if(radius < sqrt(width*width + height*height))
    {
      stroke(510./width*radius);
      line(px,py,x,y);
    }
  }
}

