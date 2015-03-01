
float a = 25;
Rectangle r;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();


void setup()
{
  size(700,700);
  background(0);
  for (int i = 0; i < 50; i++)
  {
    rectangles.add(new Rectangle());
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < rectangles.size(); i++)
  {        
    Rectangle r1 = rectangles.get(i);
    r1.drawRectangle();
  }
}
  
class Rectangle
{
  color c;
  float xpos;
  float ypos;
  float s;
  

 
  Rectangle()
  {
    xpos = random(width);
    ypos = random(height);
    s = random(200);
    c = color(random(255),random(255),random(255));
    
  }
      
  void drawRectangle()
  {
    xpos+=random(-20,20);
    ypos+=random(-20,20);
    fill(c);
    noStroke();
    rect(xpos, ypos, s, s);
  }
}  

