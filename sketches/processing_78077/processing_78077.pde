
void setup()
{
  size(401, 401);
  background (0);
}

void draw()
{
  stroke(255, 0, 0);  
  // Vertikale Linien
  line(0, 0, 0, height);
  line(50, 0, 50, height);
  line(100, 0, 100, height);
  line(150, 0, 150, height);
  line(200, 0, 200, height);
  line(250, 0, 250, height);
  line(300, 0, 300, height);
  line(350, 0, 350, height);
  line(400, 0, 400, height);
  
  // Horizontale Linien
  line(0, 0, width, 0); 
  line(0, 50, width, 50);
  line(0, 100, width, 100);
  line(0, 150, width, 150);
  line(0, 200, width, 200);
  line(0, 250, width, 250);
  line(0, 300, width, 300);
  line(0, 350, width, 350);
  line(0, 400, width, 400);
}
