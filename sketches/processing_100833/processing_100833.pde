
void setup()
{
  size(400, 400);
  smooth();
  v = 3;
}

int v;

void draw()
{
  background(0);
  
  strokeWeight(2);
  
  for (int i = 0; i < v; i++)
  {
    float a1 = radians(i*360/v);
    float a2 = radians((i+1)*360/v);
    for (int j = 0; j < 120; j++)
    {
      stroke(0, j*2, j*2);
      line(width/2+cos(a1)*j, height/2+sin(a1)*j,
           width/2+cos(a2)*j, height/2+sin(a2)*j);
    }
    stroke(0, 127, 0);
    line(width/2+cos(a1)*130, height/2+sin(a1)*130,
         width/2+cos(a2)*130, height/2+sin(a2)*130);
  }
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(0, 255, 255);
  text("X to add vertices", width/2, height/25);
  text("Z to remove vertices", width/2, height/10);
  text("Divisions : "+v, width/2, height*9/10);
}

void keyReleased()
{
  if (key == 'z')  v--;
  if (key == 'x')  v++;
  if (v < 3)  v=3;
}




