

// An object give a name to a (messy) collection of variables, data, and possibly other objects.
// This is like saying "city" to refer to the colelction of people, buildings, and roads 


// tell Processing we want to name our object type Square

class Square
{
  // width in pixels
  int w;
  
  int x;
  int y;
  
  // colors
  int r;
  int g;
  int b;
  
  boolean over;

  // this is the "constructor" for a new Square
  Square()
  {
    x = 0;
    y = 0;
    w = 50;
    r = 0;
    g = 0;
    b = 0;
    over = false;
  }

  Square(int _x, int _y, int _w, int _r, int _g, int _b)
  {
    x = _x;
    y = _y;
    w = _w;
    r = _r;
    g = _g;
    b = _b;
    over = false;
  }


  void draw()
  {
    
    // set the fill color for the 1st square
    if (over)
    {
       fill(255); 
    }
    else
    {   
      fill( r, g, b );
    }
  
    // draw the rectangle starting at 10,10 
    rect(x,y, w,w);  
  }
  
  void mousePressed()
  {
   if ( (mouseX > x) && (mouseX < x+w) &&
       (mouseY > y) && (mouseY < y+w))
      {
         over = true;
      }
     else
     {
         over = false;
     }
  }
 
}


// make these global Squares
Square s1 = new Square();
Square s2 = new Square(10,10, 100, 18, 86, 201);
Square s3 = new Square(110, 110, 80, 245, 159, 0);


void setup()
{
  size(256, 256);
  
  // create 2 instances of Square
  // we need the "new" keyword, and the object name written as a function
  // (more on this soon)

  /*
  // set the width variable of the 1st square to 100 pixels
  s1.w = 100;
  // make it a nice purple color
  s1.r = 255;
  s1.g = 0;
  s1.b = 255;

  

  // set the width variable of the 1st square to 100 pixels
  s2.w = 100;
  // make it a nice blue color
  s2.r = 18;
  s2.g = 86;
  s2.b = 201;
  */

}

void draw()
{
  
  background(100);
  
  // black outlines
  stroke(0);

  // lets draw 2 colored squares 100 pixels wide! yay!
  s1.draw();
  
  // draw the rectangle starting at 110,110 
  s2.draw();
  
  s3.x = mouseX;
  s3.y = mouseY;
  s3.draw();
}


void mousePressed()
{
 
  s1.mousePressed();
  s2.mousePressed();
  s3.mousePressed();  
}



void mouseMoved()
{
  s1.over = false;
}



void mouseReleased()
{
  s1.over = false;
  s2.over = false;
  s3.over = false;
}


  

