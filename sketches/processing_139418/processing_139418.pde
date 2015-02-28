
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

// ----------------------------
// Crazy Painter - Draft Project 
// by Daniel Wyllie
// ----------------------------

PImage img1;
PImage img2;
color col_A = 0;
color col_B = 0;
color col_C = 0;
color col_D = 0;

boolean transition = false;

public class Point
{
  int x;
  int y;

  Point(int x, int y)
  {
    this.x = x;
    this.y = y;
  } 

  int getX()
  {
    return x;
  }

  int getY()
  {
    return y;
  }

  void draw(int last_x, int last_y)
  { 
    x = (int)(last_x+random(-mouseX/10, mouseX/10));
    y = (int)(last_y+random(-mouseX/10, mouseX/10));
  }
}

Point[] point = new Point [4];

void setup()
{
  size(854, 480);
  background(0);
  img2 = loadImage("ponty.jpg");
  img1 = loadImage("lema.jpg");
  noFill();
  rectMode(CENTER);
  for (int i=0; i<4; i++)
  {
    point[i] = new Point((int)random(width/4), (int)random(height/4));
  }
}

void draw()
{
 
  for (int k=0; k<30; k++)
  {     
      if (transition)
      {
        col_A = img1.get(point[0].getX(), point[0].getY());
        col_B = img1.get(point[1].getX(), point[1].getY());
        col_C = img1.get(point[2].getX(), point[2].getY());
        col_D = img1.get(point[3].getX(), point[3].getY());
      }
      else
      {
        col_A = img2.get(point[0].getX(), point[0].getY());
        col_B = img2.get(point[1].getX(), point[1].getY());
        col_C = img2.get(point[2].getX(), point[2].getY());
        col_D = img2.get(point[3].getX(), point[3].getY());
      }

      stroke(col_C, map(mouseY, 0, height, 255, 150));
      strokeWeight(mouseY/30);

      if 
        ((brightness(col_A) - brightness(col_B) < 50)
        &&
        (brightness(col_B) - brightness(col_C) < 50)
        &&
        (brightness(col_C) - brightness(col_D) < 50))

      {

        bezier(point[0].getX(),   point[0].getY(), 
               point[1].getX(), point[1].getY(), 
               point[2].getX(), point[2].getY(), 
               point[3].getX(), point[3].getY());
        fill(col_C);
        ellipse(point[0].getX(), point[0].getY(), brightness(col_A)/40, brightness(col_A)/40);
        noFill();
      }
      point[0].draw(round(random(width)), round(random(height)));
      point[1].draw(point[0].getX(), point[0].getY());
      point[2].draw(point[1].getX(), point[1].getY());
      point[3].draw(point[2].getX(), point[2].getY());
  }
}


void mouseDragged()
{
  // code that happens when the mouse moves
  // with the button down
}

void mousePressed() 
{
  transition = !transition;
}

void mouseReleased()
{
  // code that happens when the mouse button
  // is released
}


