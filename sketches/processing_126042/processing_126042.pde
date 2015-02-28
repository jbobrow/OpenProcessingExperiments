
int square_size = 100;
int num_of_squares = 8;
ArrayList<Point> prisoners;

void setup()
{
  size(square_size*num_of_squares, square_size*num_of_squares);
  prisoners = new ArrayList<Point>();
  
  //First prisoner(s)
  prisoners.add(new Point(square_size/2,height-square_size/2));
  prisoners.add(new Point(square_size/2,height-square_size/2-square_size));
  prisoners.add(new Point(square_size/2+square_size,height-square_size/2));

}

void draw()
{
  background(0);
  
  draw_checkerboard();
  setup_prison();
  draw_prisoners();

}

void mouseClicked()
{
  int mousexpos = mouseX;
  int mouseypos = mouseY;
  for(int i = 0; i < prisoners.size(); i++)
  {
    int xpos = prisoners.get(i).xvalue();
    int ypos = prisoners.get(i).yvalue();
    if ((abs(mousexpos-xpos) < (square_size / 2)) 
          && (abs(mouseypos-ypos) < (square_size / 2)))
    {
      //Clicked on checker #i
      boolean right = false;
      boolean above = false;
      
      if (checkPrisoners(xpos+square_size,ypos)) 
      {
        right = true;
      }
      
      if (checkPrisoners(xpos,ypos-square_size))    
      {
        above = true;
      }
      
      //Clone prisoners if ok
      if (!right && !above)
      {
        prisoners.add(new Point(xpos + square_size,ypos));
        prisoners.add(new Point(xpos,ypos-square_size));
        prisoners.remove(i);
      }
    }
  }
}

boolean checkPrisoners(int x,int y)
{
  int xpos,ypos;
  for (int i = 0; i < prisoners.size(); i++)
  {
    xpos = prisoners.get(i).xvalue();
    ypos = prisoners.get(i).yvalue();
    if (xpos == x && ypos == y)
    {
      return true;
    }
  }
  return false;
}
    
    

void keyPressed()
{
  setup();
}
  

void draw_checkerboard()
{
  strokeWeight(1);
  stroke(0);
  for(int x = 0; x < num_of_squares; x++)
  {
    for(int y = 0; y < num_of_squares; y++)
    {
      if ((x+y)%2==0)
      {
        fill(0);
      }
      else
      {
        fill(255);
      }
      rect(x*square_size,height-y*square_size-square_size,square_size,square_size);
    }
  }
}

void setup_prison()
{
  strokeWeight(10);
  stroke(0,200,0);
  line(0,height,0,height - 2*square_size);
  line(0,height - 2*square_size,square_size,height - 2*square_size);
  line(square_size,height - 2*square_size,square_size,height - square_size);
  line(square_size,height - square_size,2*square_size,height - square_size);
  line(2*square_size,height - square_size,2*square_size,height);
  line(0,height,2*square_size,height);
}

void draw_prisoners()
{
  for (int i=0; i < prisoners.size(); i++)
  {
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(prisoners.get(i).xvalue(),prisoners.get(i).yvalue(),square_size/2,square_size/2);
  }
}

class Point
{
  int x;
  int y;
  
  Point (int x1, int y1)
  {
    x = x1;
    y = y1;
  }
  
  int xvalue()
  {
    return x;
  }
  
  int yvalue()
  {
    return y;
  }
}
