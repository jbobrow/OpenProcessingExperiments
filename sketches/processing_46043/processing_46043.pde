

class Circle 
{
  int x; 
  int y; 
  int w;
  int h;
  int speed; 

  PImage a;
  Circle(int newX, int newY, PImage img)
  {
    a = img;
    speed= int(random(1, 40)); 
    x = newX; 
    y = newY; 
    w = (int)random(200,700);
    
    
  }
  
  void draw()
  {
    //println (a); 
    image(a, x, y, w, w); 
    if(moving == true)
    {
      y += speed;
    }
    else if (mousePressed == mousePressed) {
     mousePressed = false;
    }
    
    if(y > height) {
      y = -w;
    }
  }
}

