
//Food video game.
//Funness: 10/10

final int MODE_DRAW = 0;
final int MODE_SHOW = 1;
final int MODE_TITLE = 2;

PImage Plate;
boolean MousePressedLastFrame;
ArrayList Drawing;
int mode;
long time_you_started_draw_mode;

void setup()
{
  size(900,450);
  smooth();
  strokeWeight(10);
  Plate = loadImage("plate.jpg");
  imageMode(CENTER);
  background(255);
  MousePressedLastFrame = false;
  Drawing = new ArrayList();
  stroke(255, 0, 0);
  fill(0, 0, 255);
  mode = MODE_TITLE;
}

void draw()
{
  background(255);
  switch(mode)
  {
  case MODE_TITLE:
    {
      pushMatrix();
      scale(5);
      text("GET READY TO PLAY A",0,25);
      text("REALLY EXCITING GAME!!!!!",0,50);
      text("CLICK TO GOOOOOO!!!",0,75);
      popMatrix();
      if(!mousePressed)
      {
        if(MousePressedLastFrame == true)
        {
          MousePressedLastFrame = false;
          mode = 0;
          time_you_started_draw_mode = millis();
        }
      }
      if(mousePressed)
      {
        MousePressedLastFrame = true;
      }
      else
      {
        MousePressedLastFrame = false;
      }
    }
    break;
  case MODE_DRAW:
    {
      if (mousePressed)
      {
        Drawing.add(new DrawPoint(mouseX, mouseY, !MousePressedLastFrame));
        MousePressedLastFrame = true;
      }
      else
      {
        MousePressedLastFrame = false;
      }
    }
    if ((int)(10-(millis()-time_you_started_draw_mode)/1000) <= 0)
    {
      mode = MODE_SHOW;
    }
    pushMatrix();
    scale(5);
    text("QUICK, DRAW A FOOD!!!! " + Integer.toString((int)(10-(millis()-time_you_started_draw_mode)/1000)), 0, 15);
    popMatrix();
    DrawDrawing();

    break;
  case MODE_SHOW:
    {
      image(Plate, width*5/8, height*3/4);
      pushMatrix();
      scale(3);
      fill(0,0,255);
      text("GREAT JOB! IT LOOKS DELICIOUS!!!!!!!", 0, 25);
      fill(0,255,0);
      text("YOU WON!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", 0, 75);
      popMatrix();
      pushMatrix();
      scale(0.3);
      translate(width*13/8, height*9/6);
      DrawDrawing();
      popMatrix();
    }
    break;
  default:
    break;
  }
}

void DrawDrawing()
{
  for (int i = 0; i < Drawing.size()-1; ++i)
  {
    DrawPoint first = (DrawPoint) Drawing.get(i);
    DrawPoint next = (DrawPoint) Drawing.get(i+1);
    line(first.getx(), first.gety(), 
    first.getx(), first.gety());
    if (!next.getstart())
    {
      line(first.getx(), first.gety(), 
      next.getx(), next.gety());
    }
  }
  if (Drawing.size()>0)
  {
    DrawPoint last = (DrawPoint) Drawing.get(Drawing.size()-1);
    line(last.getx(), last.gety(), 
    last.getx(), last.gety());
  }
}  

class DrawPoint
{
  int x;
  int y;
  boolean start;
  DrawPoint(int x_, int y_, boolean start_)
  {
    x = constrain(x_, 0, width);
    y = constrain(y_, 0, height);
    start = start_;
  }
  int getx() { 
    return x;
  }
  int gety() { 
    return y;
  }
  boolean getstart() { 
    return start;
  }
}


