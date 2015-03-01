
void setup()
{
  size(800,600);
  background(0);
  fill(255);
}
 

void draw()
{
  int a = (int)map(mouseX, 0, 800, 0, 255);
  int b = (int)map(mouseY, 0, 600, 0, 255);
   
  stroke(a, b, 128, 80);
  fill(a, b, 128, 80);
  strokeWeight(1);
   
  if(mousePressed && mouseButton == LEFT)
  {
    line(mouseX,mouseY,400,300); 
  }
   
  if(keyPressed && (key == 'g' || key == 'G'))
  {
    for(int i = 0; i <= 10; i++)
    {
      strokeWeight(random(3));
      stroke(random(255));
      point(int(random(800)),int(random(600)));
    }
  }
   
  if(keyPressed && (key == 'b' || key == 'B'))
  {
    setup();
  }
}

