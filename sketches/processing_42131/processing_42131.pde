

Water[] w;


void setup()
{
  size(600, 300);
  noStroke();


  w = new Water[300];
  for (int i = 0; i <w.length; i++)
  {
    w[i] = new Water();
    w[i].x = random(-10, 10);
    w[i].y = random(-10, 10);
    w[i].a = random(10, 20);
    w[i].b = random(20, 30);
  }
}

void draw()
{
  background(255);

  for ( int i = 0; i <w.length; i++)
  {

    w[i].move();
    w[i].show();
  
  }
  for ( int i = 0; i <w.length; i++)
  {  
     w[i].x = 10;
     w[i].y = -10;
  
      w[i].a = mouseX  - 300;
      w[i].b = mouseY  - 300;
  }
 
}
  
class Water
{
  float x, y;
  float a, b;


  
  void show()
  {
    x = random(width);
    y = random(height); 
    fill (104, 111, 229);
    ellipse(x, y, a, b);
  }
  void move()
  {
    x += (random(-300, 0)) ;//* 0.1;
    y += (random(-300, 0)) ;//* 0.1;
  }
  
  
  
  
  
}


