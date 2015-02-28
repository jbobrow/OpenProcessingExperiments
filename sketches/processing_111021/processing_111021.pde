
PImage monalisa;
PImage wheatley;
PImage cube;

void setup()
{
  size(700, 1000);
  monalisa = requestImage("monalisa.jpg");
  wheatley = requestImage("wheatley.png");
  cube = requestImage ("cube.png");
   rect(57, 74, 100, 100);
}

void draw()
{
   println("x: " + mouseX + " y: " + mouseY);
    
  if (monalisa.width > 0)
  {
    monalisa.filter(GRAY);
    image(monalisa, 0, 0);
  }
  
    stroke(0); 
  int gridSize = 100;
  int X = 0;
  int Y = 0;
  
  for(X = 0; X < width; X +=gridSize)
  {
    line(X, 0, X, height);
  }
  stroke(0);
  for(Y = 0; Y < height; Y += gridSize)
  {
    line(0, Y, width, Y);
  }
  
    float x = 10;
  float y = 10;
  float prevX = x;
  float prevY = y; 
  strokeWeight(5);
  while (x < 700)
  {
    x += 1;
    y += random(-3, 6);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }
  
  
   
  if (wheatley.width > 0)
  {
    image(wheatley, 0, 0, 250, 188);
  }
  
  if (cube.width > 0)
  {
    image(cube, 500, 800, 200, 200);
  }

}


